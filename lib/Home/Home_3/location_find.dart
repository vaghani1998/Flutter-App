import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_temp/Const_Colors/colors.dart';
import 'package:weather_temp/Home/Home_1/CurrentData_model/currentdata.dart';
import 'package:weather_temp/Home/Home_1/temprature.dart';

CurrentData? currentData;

class LocationFind extends StatefulWidget {
  const LocationFind({Key? key}) : super(key: key);

  @override
  State<LocationFind> createState() => _LocationFindState();
}

class _LocationFindState extends State<LocationFind> {
  Future<CurrentData?> fetchData() async {
    // ****  Future Method of CurrentData **** //
    try {
      final response = await http.get(Uri.parse(
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

  Future<Position> _determinePosition() async {
    // ****  Future Method which geolocator to location found package **** //
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

  Future<void> _makeSocialMediaRequest(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232F3B),
      body: FutureBuilder<CurrentData?>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: Stack(
                  children: [
                    Positioned(
                        top: -155.h,
                        left: -85.w,
                        child: Container(
                          height: 210.h,
                          width: 210.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff2C3B45), width: 40),
                            shape: BoxShape.circle,
                          ),
                        )),
                    Positioned(
                        bottom: -100.h,
                        right: -95.w,
                        child: Container(
                          height: 210.h,
                          width: 210.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff2C3B45), width: 22),
                            shape: BoxShape.circle,
                          ),
                        )),
                    Container(
                      margin:
                          EdgeInsets.only(left: 24.w, right: 24.w, top: 42.h),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _determinePosition().then((value) {
                                setState(() {
                                  lat = value.latitude;
                                  long = value.longitude;
                                });
                              });
                            },
                            child: Container(
                              width: 95.w,
                              height: 30.h,
                              margin: EdgeInsets.only(bottom: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_searching_sharp,
                                      color: reachText, size: 18.sp),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                        text:
                                            '${snapshot.data!.sys.country} ${snapshot.data!.name}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: reachText,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '${snapshot.data!.name}',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            height: 120.h,
                            width: 120.h,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: roundBig,
                                      blurRadius: 65.0,
                                      blurStyle: BlurStyle.normal,
                                      offset: Offset(0.0, 0.75),
                                      spreadRadius: -15),
                                ],
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    roundBig,
                                    roundBigMotion,
                                  ],
                                )),
                            margin: EdgeInsets.only(top: 28.h, bottom: 18.h),
                          ),
                          Container(
                            height: 35.h,
                            padding: EdgeInsets.all(8.r),
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child:
                                Text('${snapshot.data!.weather[0].description}',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                          ),
                          Text(
                            '${kelvinToCelsius(snapshot.data!.main.temp)}°C',
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 65.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/Bottom_Icons/wind_home.png',
                                    height: 22,
                                    color: reachText,
                                  ),
                                  SizedBox(
                                    width: 8.w,
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
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/Bottom_Icons/pixel_water.png',
                                    color: reachText,
                                    height: 22.h,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    '${snapshot.data!.main.humidity} %',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: textColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: reachText,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    '${degrees(snapshot.data!.wind.deg.toInt())} mBar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: textColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 35.h),
                                height: 45.h,
                                child: Row(
                                  children: [
                                    Text(
                                      'Temperature',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text('Temperature',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.sp,
                                                )),
                                            content: Row(
                                              children: [
                                                Text(
                                                    "Today : ${snapshot.data!.main.temp}°k",
                                                    style: TextStyle(
                                                      fontSize: 22.sp,
                                                      color: text,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Image.network(
                                                    'http://openweathermap.org/img/w/${snapshot.data!.weather[0].icon}.png'),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.cyan,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.r)),
                                                    padding:
                                                        EdgeInsets.all(14.r),
                                                    child: Text("okay",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        )),
                                                  ))
                                            ],
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text('Celsius',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: reachText,
                                              )),
                                          SizedBox(width: 10.w),
                                          const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: reachText,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                height: 45.h,
                                child: Row(
                                  children: [
                                    Text(
                                      'Wind Speed',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text('Wind Speed',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.sp,
                                                )),
                                            content: Row(
                                              children: [
                                                Text(
                                                    "Today : ${snapshot.data!.wind.speed} km/h",
                                                    style: TextStyle(
                                                      fontSize: 22.sp,
                                                      color: text,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                SizedBox(width: 15.w),
                                                Image.asset(
                                                  'assets/Bottom_Icons/wind_home.png',
                                                  height: 22,
                                                  color: reachText,
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.cyan,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.r)),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: Text("okay",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        )),
                                                  ))
                                            ],
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text('m/s',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: reachText,
                                              )),
                                          SizedBox(width: 10.w),
                                          const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: reachText,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5.h),
                                height: 45.h,
                                child: Row(
                                  children: [
                                    Text(
                                      'Source',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text('Source',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.sp,
                                                )),
                                            content: Link(
                                              target: LinkTarget.blank,
                                              uri: Uri.parse(
                                                  'https://openweathermap.org'),
                                              builder: (context, followLink) =>
                                                  ElevatedButton(
                                                      onPressed: followLink,
                                                      child: Text(
                                                          'Open Link Weather')),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.cyan,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.r)),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: Text("okay",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                        )),
                                                  ))
                                            ],
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text('weather.gov',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: reachText,
                                              )),
                                          SizedBox(width: 10.w),
                                          const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: reachText,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
