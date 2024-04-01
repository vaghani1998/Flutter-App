import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_temp/Const_Colors/colors.dart';
import '../../SearchPage.dart';
import 'CurrentData_model/currentdata.dart';
import 'CurrentData_model/temperatures_model.dart';
import 'package:intl/intl.dart';

String endpoint =
    'http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=3fd59c6ac275ce50c0d20223983e7c91';

Future<List<Temp>>? temp;

int kelvinToCelsius(kelvinValue) {
  // ****  Function convertor to Temprature **** //
  double celsius = kelvinValue - 273.15;
  return celsius.toInt();
}

String milesHour(mileValue) {
  // ****  Function convertor to speed **** //
  double miles = mileValue * 4.47;
  return miles.toStringAsFixed(2);
}

String degrees(degreeVal) {
  // ****  Function convertor to Humanity **** //
  double degree = (degreeVal * 8 / 191);
  return degree.toStringAsFixed(2);
}

double lat = 44.500000;
double long = -89.500000;

class Temperatures extends StatefulWidget {
  const Temperatures({Key? key}) : super(key: key);

  @override
  State<Temperatures> createState() => _TemperaturesState();
}

class _TemperaturesState extends State<Temperatures> {
  String findMinValue(num kelvinToCelsius) {
    final List<dynamic> y = <dynamic>[kelvinToCelsius];
    final yMin = y.cast<num>().reduce(min);
    return yMin.toString(); // 1
  }

  String findMaxValue(num kelvinToCelsius) {
    final List<dynamic> y = <dynamic>[kelvinToCelsius];
    final yMax = y.cast<num>().reduce(max);
    return yMax.toString(); // 1
  }

  Future<Position> _determinePosition() async {
    // ****  Future Method of geolocator packages  **** //
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<CurrentData?> fetchData() async {
    // return Future<CurrentData>.delayed(const Duration(seconds: 5));
    try {
      Position position = await _determinePosition();
      lat = position.latitude;
      long = position.longitude;
      Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=3fd59c6ac275ce50c0d20223983e7c91'));
      if (response.statusCode == 200) {
        CurrentData currentData = currentDataFromJson(response.body);
        return currentData;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
    return null;
  }

  List<String> days = [];

  dataDay() {
    for (int i = 0; i < 5; i++) {
      DateTime added = DateTime.now().add(
        Duration(days: i),
      );
      final formatter = DateFormat('EEEE').format(added);
      days.add(formatter);
    }
  }

  List<List> fData = [];
  List<WetData> mainDate = [];

  Future<List<WetData>?> findData() async {
    // ****  Future Method of CurrentData **** //
    try {
      final response = await http.get(Uri.parse(endpoint));
      Temp temp = tempFromJson(response.body);
      fData.clear();
      int ind = 0;
      List lis = [];
      for (int i = 0; i < temp.list.length; i++) {
        lis.add(temp.list[i]);
        if (((i + 1) % 8) == 0) {
          if (ind == 0) {
            fData.add(lis.take(8).toList());
          } else {
            fData.add(lis.skip(ind * 8).take(8).toList());
          }
          ind++;
        }
      }
      int dayInd = 0;
      fData.forEach((element) {
        List Minimum = [];
        List Maximum = [];

        element.forEach((ele) {
          Minimum.add(kelvinToCelsius(ele.main.tempMin));
          Maximum.add(kelvinToCelsius(ele.main.tempMax));
        });
        String json = ''' 
 {"day":"${days[dayInd]}",
 "icon":"${element[0].weather[0].icon}",
 "min":"${Minimum.cast<num>().reduce(min)}",
 "max":"${Maximum.cast<num>().reduce(max)}"
 }
 ''';
        WetData wetData = wetDataFromJson(json);
        mainDate.add(wetData);
        dayInd++;
      });
      return mainDate;
    } catch (e, t) {
      print(e);
      print(t);
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  BannerAd? bannerAd;
  bool isAdLoaded = false;
  var adUnit = "ca-app-pub-3940256099942544/6300978111";

  void loadAd() {
    bannerAd = BannerAd(
      adUnitId: adUnit,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {},
        onAdClosed: (Ad ad) {},
        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    dataDay();
    return Scaffold(
      backgroundColor: background,
      body: FutureBuilder<CurrentData?>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                        top: 105.h,
                        left: -55.h,
                        child: Container(
                          height: 210.h,
                          width: 210.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xff162731), width: 5)),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 42.h, left: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.name,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 22.sp,
                            ),
                          ),
                          Container(
                            width: 102.w,
                            height: 75.h,
                            child: RichText(
                              text: TextSpan(
                                text:
                                    '${kelvinToCelsius(snapshot.data!.main.temp)}°',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 65.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 35.h,
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(snapshot.data!.weather[0].description,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: -85.h,
                        top: -50.h,
                        child: Container(
                          height: 245.h,
                          width: 245.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: roundBig,
                                    blurRadius: 65.0,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(0.0, 0.75),
                                    spreadRadius: -8),
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  roundBig,
                                  roundBigMotion,
                                ],
                              )),
                        )),
                    Positioned(
                        right: 75.w,
                        top: 75.h,
                        child: SvgPicture.asset(
                            'assets/Bottom_Icons/Home_1/weather1.svg',
                            height: 110.h,
                            color: cloud)),
                    Positioned(
                        top: 1.h,
                        right: -47.h,
                        child: SvgPicture.asset(
                            'assets/Bottom_Icons/Home_1/weather2.svg',
                            height: 95.h,
                            color: cloud)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 220.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 15.h),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Bottom_Icons/pixel_water.png',
                                color: reachText,
                                scale: 1.3,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                "${snapshot.data!.main.humidity} %",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.watch_later_outlined,
                                color: reachText,
                                size: 19,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                '${degrees(snapshot.data!.wind.deg)} mBar',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/Bottom_Icons/wind_home.png',
                                color: reachText,
                                scale: 2.2,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                '${milesHour(snapshot.data!.wind.speed)} km/h',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  SearchPage(),));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 24.w, top: 65.h, bottom: 12.h),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: reachText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const VerticalSlider(),
                        if (bannerAd != null)
                          Container(
                            margin: EdgeInsets.all(24),
                            width: bannerAd!.size.width.toDouble(),
                            height: bannerAd!.size.height.toDouble(),
                            child: SafeArea(
                              child: AdWidget(ad: bannerAd!),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 24.w, right: 24.w, bottom: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Day',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: reachText,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text('Temp Min-Max',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: reachText,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<WetData>?>(
                              future: findData(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Text(
                                              snapshot.data![index].day,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: textColor,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                            Spacer(),
                                            Image.network(
                                              'https://openweathermap.org/img/wn/${snapshot.data![index].icon}.png',
                                              width: 35.w,
                                              height: 35.h,
                                            ),
                                            SizedBox(
                                              width: 85.w,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${snapshot.data![index].min}°',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.yellowAccent,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(
                                                  '${snapshot.data![index].max}°',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: cloud,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 5.h,
                                        );
                                      },
                                      itemCount: snapshot.data!.length);
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      bottomNavigationBar: isAdLoaded
          ? SizedBox(
              height: bannerAd!.size.height.toDouble(),
              width: bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: bannerAd!),
            )
          : SizedBox(),
    );
  }
}

class VerticalSlider extends StatefulWidget {
  const VerticalSlider({Key? key}) : super(key: key);

  @override
  State<VerticalSlider> createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  Future<Temp?> findData() async {
    // ****  Future Method of CurrentData **** //
    try {
      Response response = await http.get(Uri.parse(endpoint));
      Temp temp = tempFromJson(response.body);
      return temp;
    } catch (e, t) {
      print(e);
      print(t);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<Temp?>(
          future: findData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: snapshot.data!.list.length,
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        '${formatTimeOfDay(TimeOfDay(hour: snapshot.data!.list[index].dtTxt.hour, minute: snapshot.data!.list[index].dtTxt.minute))}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: textColor,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Image.network(
                          'https://openweathermap.org/img/wn/${snapshot.data!.list[index].weather[0].icon}.png',
                          height: 30.h),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        kelvinToCelsius(snapshot.data!.list[index].main.temp)
                                .toString() +
                            "°",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: textColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10.w);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
