import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:weather_temp/Const_Colors/colors.dart';
import 'package:weather_temp/Home/Home_1/temprature.dart';
import 'package:weather_temp/models/favorite_model.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchPage = TextEditingController();

  double lat = 44.500000;
  double long = -89.500000;

  Future<Favorite?> fetchData(String city) async {
    searchList.clear();
    try {
      Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${city
              .trim()}&callback=test&appid=3fd59c6ac275ce50c0d20223983e7c91'));
      if (response.statusCode == 200) {
        String json =
        '''{${response.body.replaceAll('test(', '"test":').replaceAll(
            ')', '')}}''';
        Map change = jsonDecode(json);

        String jsonData = '''{
          "city": "${change['test']['name']}",
          "country": "${change['test']['sys']['country']}",
          "humidity": "${change['test']['main']['humidity']}%",
          "speed": "${milesHour(change['test']['wind']['speed'])}",
          "temp": "${kelvinToCelsius(change['test']['main']['temp'])}°",
          "icon": "${change['test']['weather'][0]['icon']}"
        }''';
        // searchList.add(favoriteFromJson(jsonData));
        return favoriteFromJson(jsonData);
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
    return null;
  }

  List<String> list = [
    '''{
    "city": "${'Surat'}",
    "country": "India",
    "humidity": "13%",
    "speed": "9km/h",
    "temp": "-22°",
    "icon": ""
  }'''
  ];

  List<Favorite> fav = [];
  List<Favorite> searchList = [];

  @override
  void initState() {
    for (var element in list) {
      fav.add(favoriteFromJson(element));
      searchList.add(favoriteFromJson(element));
    }
    getAllData();
    super.initState();
  }

  var box = Hive.box('FavBox');

  getAllData() {
    setState(() {
      name = box.values.toList();
    });
  }

  List name = [];

  search(String val) {
    if (val.isNotEmpty) {
      name.clear();
      name.add(val);
      setState(() {});
    } else {
      setState(() {
        name = box.values.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff081B25),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 45.h,
                color: background,
                margin: EdgeInsets.only(top: 42.h),
                child: TextFormField(
                  controller: searchPage,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: textColor,
                    fontWeight: FontWeight.w400,
                  ),
                  // onChanged: search,
                  onFieldSubmitted: search,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 13.h),
                      prefixIcon: const Icon(
                        Icons.search_sharp,
                        color: reachText,
                      ),
                      isDense: true,
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.cancel,
                          color: reachText,
                        ),
                        onPressed: searchPage.clear,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: text)),
                ),
              ),
              Expanded(
                child: name.isEmpty
                    ? Center(
                    child: Text('Data Not Found',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: text)))
                    : GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18.0,
                  mainAxisSpacing: 18.0,
                  padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    name.length,
                        (index) {
                      return FutureBuilder(
                          future: fetchData(name[index]),
                          builder: (context, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snap.data == null) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                setState(() {
                                  name.removeAt(index);
                                });
                              });
                              return Center(
                                  child: CircularProgressIndicator());
                            }
                            return InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () async {
                                await box.put(name[index], name[index]);
                                if (searchPage.text.isNotEmpty) {
                                  setState(() {
                                    searchPage.clear();
                                    name = box.values.toList();
                                  });
                                }
                              },
                              child: Container(
                                height: 70.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: bigContiner,
                                  borderRadius:
                                  BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${(snap.data!.temp)}",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        ShaderMask(
                                          blendMode: BlendMode.srcIn,
                                          shaderCallback: (Rect bounds) {
                                            return ui.Gradient.linear(
                                              const Offset(4.0, 24.0),
                                              const Offset(24.0, 4.0),
                                              [
                                                roundBig,
                                                roundBigMotion,
                                              ],
                                            );
                                          },
                                          child: Image.network(
                                              'http://openweathermap.org/img/w/${snap.data!.icon}.png'),
                                        ),
                                      ],
                                    ),
                                    Text(snap.data!.city,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Text(snap.data!.country,
                                        style: TextStyle(
                                          color: text,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/Bottom_Icons/pixel_water.png',
                                              height: 15,
                                              color: reachText,
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            Text(
                                              "${snap.data!.humidity}",
                                              style: TextStyle(
                                                fontWeight:
                                                FontWeight.w400,
                                                color: textColor,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Image.asset(
                                              'assets/Bottom_Icons/wind_home.png',
                                              color: reachText,
                                              height: 15.h,
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "${snap.data!
                                                    .speed
                                                    .split('.')
                                                    .first} km/h",
                                                style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: textColor,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
