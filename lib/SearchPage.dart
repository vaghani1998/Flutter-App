// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Const_Colors/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController caratFrom = TextEditingController();
  TextEditingController caratTo = TextEditingController();
  TextEditingController userName = TextEditingController();

  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
        backgroundColor: Colors.blueAccent[50],
      ),
      backgroundColor: const Color(0xffF3F3F3),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 42.h,
                    width: 240.w,
                    child: TextFormField(
                      controller: userName,
                      style: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.black87),
                        ),
                        hintText: 'Stock Id Or Certificate No',
                        contentPadding: EdgeInsets.all(10.r),
                        hintStyle: GoogleFonts.poppins(
                          color: hintGridList,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(78.w, 42.h)),
                      backgroundColor:
                      const MaterialStatePropertyAll(Colors.black),
                    ),
                    onPressed: () {
                      selectedColorIndex;
                      selectedClarityIndex;
                      selectedLabIndex;
                    },
                    child: Center(
                        child: Text('Submit',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                  )
                ],
              ),
              ListView(
                cacheExtent: 10000,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 52.w,
                                height: 2.h,
                                margin: EdgeInsets.only(right: 3.w),
                                color: Colors.black54,
                              ),
                              Text('SHAPE',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Container(
                                width: 52.w,
                                height: 2.h,
                                margin: EdgeInsets.only(left: 3.w),
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 8.h),
                              elevation: 3,
                              backgroundColor: selectColors == true
                                  ? Colors.white
                                  : Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: borderBox, width: 2),
                                  borderRadius: BorderRadius.circular(4.r)),
                              fixedSize: Size(78.w, 42.h),
                            ),
                            onPressed: () {
                              setState(() {
                                selectColors = !selectColors;
                              });
                            },
                            child: Text('ROUND',
                                style: GoogleFonts.poppins(
                                  color: selectColors == true
                                      ? hintGridList
                                      : Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ],
                      ),
                      const ListOfLab(),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 41.w,
                                height: 2.h,
                                margin: EdgeInsets.only(right: 3.w),
                                color: Colors.black54,
                              ),
                              Text('LOCATION',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Container(
                                width: 41.w,
                                height: 2.h,
                                margin: EdgeInsets.only(left: 3.w),
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                           Row(
                            children: [
                              India(),
                              Hongkong(),
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 51.w,
                                  height: 2.h,
                                  margin: EdgeInsets.only(right: 3.w),
                                  color: Colors.black54,
                                ),
                                Text('CARAT',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Container(
                                  width: 51.w,
                                  height: 2.h,
                                  margin: EdgeInsets.only(left: 3.w),
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 76.w,
                                  height: 35.h,
                                  margin: EdgeInsets.only(right: 4.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: borderBox, width: 2),
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: TextField(
                                    controller: caratFrom,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10.h, left: 5.w),
                                      border: InputBorder.none,
                                      hintText: 'From',
                                      hintStyle: GoogleFonts.poppins(
                                        color: hintGridList,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 76.w,
                                  height: 35.h,
                                  margin: EdgeInsets.only(right: 4.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: borderBox, width: 2),
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: TextField(
                                    controller: caratTo,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10.h, left: 5.w),
                                      border: InputBorder.none,
                                      hintText: 'To',
                                      hintStyle: GoogleFonts.poppins(
                                        color: hintGridList,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // LISTVIEW COLOR, CLARITY, QUICK CRITERIA, CUT, POLISH, SYM, FL, MILKY, COLOR SHADE, BROWN, EYE CLEAN, TAB BLACK, CENTER INC., SIDE BLACK,
                  const ListOfColor(),
                  const ListOfClarity(),
                  const ListOfQuickCriteria(),
                  // const ListOfCut(),
                  // const ListOfPolish(),
                  // const ListOfSym(),
                  const ListOfFl(),
                  const ListOfMilky(),
                  const ListOfColorShade(),
                  const ListOfBrown(),
                  const ListOfEyeClean(),
                  const ListTabBlack(),
                  const ListOfCenterInc(),
                  const ListOfSideBack(),
                  // STOCK ID ,RAP  ,PRICE/CTS, LENGTH, WIDTH, WIDTH, TABLE, DEPTH, CA, CH, PA, PH,
                  SizedBox(
                    height: 10.h,
                  ),
                  const ListOfStockIDRap(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ListOfPriceLength(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ListOfWidthDepth(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ListOfTableDepth(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ListOfCaCh(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ListOfPaPh(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class India extends StatefulWidget {
  const India({super.key});

  @override
  State<India> createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          elevation: 3,
          backgroundColor: selectColors == true ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: borderBox, width: 2),
              borderRadius: BorderRadius.circular(4.r)),
        ),
        onPressed: () {
          setState(() {
            selectColors = !selectColors;
          });
        },
        child: Text('INDIA',
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class Hongkong extends StatefulWidget {
  const Hongkong({super.key});

  @override
  State<Hongkong> createState() => _HongkongState();
}

class _HongkongState extends State<Hongkong> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          elevation: 3,
          backgroundColor: selectColors == true ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: borderBox, width: 2),
              borderRadius: BorderRadius.circular(4.r)),
          fixedSize: Size(100.w, 30.h),
        ),
        onPressed: () {
          setState(() {
            selectColors = !selectColors;
          });
        },
        child: Text('HONGKONG',
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

int selectedLabIndex = -1;

class ListOfLab extends StatefulWidget {
  const ListOfLab({super.key});

  @override
  State<ListOfLab> createState() => _ListOfLabState();
}

class _ListOfLabState extends State<ListOfLab> {
  List<String> lab = ["GIA", "IGI", "HRD"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 64.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 3.w),
              color: Colors.black54,
            ),
            Text('LAB',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 64.w,
              margin: EdgeInsets.only(left: 3.w),
              height: 2.h,
              color: Colors.black54,
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 6,
          child: GridView.builder(
            cacheExtent: 10000,
            itemCount: lab.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ColorsLab(
                    list: lab[index],
                    onTap: () {
                      selectedLabIndex = index + 1;
                    },
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class ColorsLab extends StatefulWidget {
  const ColorsLab({super.key, required this.list, required this.onTap});

  final String list;
  final Function onTap;

  @override
  State<ColorsLab> createState() => _ColorsLabState();
}

class _ColorsLabState extends State<ColorsLab> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: selectColors == true ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: borderBox, width: 2),
              borderRadius: BorderRadius.circular(4.r)),
          fixedSize: const Size(0, 25)),
      onPressed: () {
        widget.onTap();
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: FittedBox(
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

// class ColorsIgi extends StatefulWidget {
//   const ColorsIgi({super.key});
//
//   @override
//   State<ColorsIgi> createState() => _ColorsIgiState();
// }
//
// class _ColorsIgiState extends State<ColorsIgi> {
//   bool selectColors = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 4.w),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
//           elevation: 3,
//           backgroundColor: selectColors == true ? Colors.white : Colors.black,
//           shape: RoundedRectangleBorder(
//               side: const BorderSide(color: borderBox, width: 2),
//               borderRadius: BorderRadius.circular(4.r)),
//           minimumSize: Size(48.w, 30.h),
//         ),
//         onPressed: () {
//           setState(() {
//             selectColors = !selectColors;
//           });
//         },
//         child: Text('IGI',
//             style: GoogleFonts.poppins(
//               color: selectColors == true ? hintGridList : Colors.white,
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w400,
//             )),
//       ),
//     );
//   }
// }
//
// class ColorsHRD extends StatefulWidget {
//   const ColorsHRD({super.key});
//
//   @override
//   State<ColorsHRD> createState() => _ColorsHRDState();
// }
//
// class _ColorsHRDState extends State<ColorsHRD> {
//   bool selectColors = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 4.w),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           padding:
//           EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
//           elevation: 3,
//           backgroundColor:
//           selectColors == true ? Colors.white : Colors.black,
//           shape: RoundedRectangleBorder(
//               side: const BorderSide(color: borderBox, width: 2),
//               borderRadius: BorderRadius.circular(4.r)),
//           minimumSize: Size(48.w, 30.h),
//         ),
//         onPressed: () {
//           setState(() {
//             selectColors = !selectColors;
//           });
//         },
//         child: Text('HRD',
//             style: GoogleFonts.poppins(
//               color: selectColors == true ? hintGridList : Colors.white,
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w400,
//             )),
//       ),
//     );
//   }
// }

int selectedColorIndex = -1;

class ListOfColor extends StatefulWidget {
  const ListOfColor({super.key});

  @override
  State<ListOfColor> createState() => _ListOfColorState();
}

class _ListOfColorState extends State<ListOfColor> {
  List<String> colors = [
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O-Z',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Container(
              width: 138.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('COLOR',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              margin: EdgeInsets.only(left: 5.w),
              width: 138.w,
              height: 2.h,
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: colors.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsIndex(
                    list: colors[index],
                    onTap: () {
                      selectedColorIndex = index + 1;
                    }),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsIndex extends StatefulWidget {
  const ColorsIndex({super.key, required this.list, required this.onTap});

  final String list;
  final Function onTap;

  @override
  State<ColorsIndex> createState() => _ColorsIndexState();
}

class _ColorsIndexState extends State<ColorsIndex> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        widget.onTap();
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

int selectedClarityIndex = -1;

class ListOfClarity extends StatefulWidget {
  const ListOfClarity({super.key});

  @override
  State<ListOfClarity> createState() => _ListOfClarityState();
}

class _ListOfClarityState extends State<ListOfClarity> {
  List<String> clarity = [
    'FL',
    'IF',
    'VVS1',
    'VVS2',
    'VS1',
    'VS2',
    'SI1',
    'SI2',
    'I1',
    'I2',
  ];
  bool selectClarity = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 134.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('CLARITY',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              margin: EdgeInsets.only(left: 5.w),
              width: 134.w,
              height: 2.h,
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: clarity.length,
          cacheExtent: 10000,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, crossAxisSpacing: 10.w, mainAxisExtent: 60),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsClarity(
                  list: clarity[index],
                  onTap: () {
                    selectedClarityIndex = index;
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsClarity extends StatefulWidget {
  const ColorsClarity({super.key, required this.list, required this.onTap});

  final String list;
  final Function onTap;

  @override
  State<ColorsClarity> createState() => _ColorsClarityState();
}

class _ColorsClarityState extends State<ColorsClarity> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        widget.onTap();
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

int selectQuickCriteria = -1;

class ListOfQuickCriteria extends StatefulWidget {
  const ListOfQuickCriteria({super.key});

  @override
  State<ListOfQuickCriteria> createState() => _ListOfQuickCriteriaState();
}

class _ListOfQuickCriteriaState extends State<ListOfQuickCriteria> {
  List<String> criteria = [
    '3EX',
    '3VG',
    'GD+',
    'NO-3EX',
    'NO BGM',
    'NO BLACK',
    'EYECLEAN',
  ];
  List<String> cut = [
    'EX',
    'VG',
    'GD',
    'FR',
  ];
  List<String> polish = [
    'EX',
    'VG',
    'GD',
    'FR',
  ];
  List<String> sym = [
    'EX',
    'VG',
    'GD',
    'FR',
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 109.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('QUICK CRITERIA',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 109.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: criteria.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 12.w,
              maxCrossAxisExtent: 120.w,
              mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                QuickCriteriaButton(
                  list: criteria[index],
                  onTap: () {
                    setState(() {
                    selectQuickCriteria = index;
                    });
                  },
                ),
              ],
            );
          },
        ),
        Row(
          children: [
            Container(
              width: 148.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('CUT',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 148.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: cut.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CutButton(list: cut[index],setInd: selectQuickCriteria>index),
              ],
            );
          },
        ),
        Row(
          children: [
            Container(
              width: 138.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('POLISH',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 138.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: polish.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                PolishButton(list: polish[index]),
              ],
            );
          },
        ),
        Row(
          children: [
            Container(
              width: 148.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('SYM',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 148.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: sym.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SymButton(list: sym[index]),
              ],
            );
          },
        ),
      ],
    );
  }
}

class QuickCriteriaButton extends StatefulWidget {
  const QuickCriteriaButton(
      {super.key, required this.list, required this.onTap});

  final String list;
  final Function onTap;

  @override
  State<QuickCriteriaButton> createState() => _QuickCriteriaButtonState();
}

class _QuickCriteriaButtonState extends State<QuickCriteriaButton> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}


class CutButton extends StatefulWidget {
  const CutButton({super.key, required this.list, required this.setInd});

  final String list;
  final bool setInd;

  @override
  State<CutButton> createState() => _CutButtonState();
}

class _CutButtonState extends State<CutButton> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    print('Hello ${selectColors}');
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: !widget.setInd ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}


class PolishButton extends StatefulWidget {
  const PolishButton({super.key, required this.list});

  final String list;

  @override
  State<PolishButton> createState() => _PolishButtonState();
}

class _PolishButtonState extends State<PolishButton> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderBox, width: 2.w),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}


class SymButton extends StatefulWidget {
  const SymButton({super.key, required this.list});

  final String list;

  @override
  State<SymButton> createState() => _SymButtonState();
}

class _SymButtonState extends State<SymButton> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfFl extends StatefulWidget {
  const ListOfFl({super.key});

  @override
  State<ListOfFl> createState() => _ListOfFlState();
}

class _ListOfFlState extends State<ListOfFl> {
  List<String> fl = [
    'NONE',
    'FAINT',
    'VSL',
    'SL',
    'MED',
    'STG',
    'VST',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 154.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('FL',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 154.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: fl.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h, bottom: 10.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsFl(list: fl[index]),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsFl extends StatefulWidget {
  const ColorsFl({super.key, required this.list});

  final String list;

  @override
  State<ColorsFl>
















  createState() => _ColorsFlState();
}

class _ColorsFlState extends State<ColorsFl> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfMilky extends StatefulWidget {
  const ListOfMilky({super.key});

  @override
  State<ListOfMilky> createState() => _ListOfMilkyState();
}

class _ListOfMilkyState extends State<ListOfMilky> {
  List<String> milky = [
    'NONE',
    'LIGHT',
    'MEDIUM',
    'HEAVY',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 142.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('MILKY',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 142.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: milky.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsMilky(
                  list: milky[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsMilky extends StatefulWidget {
  const ColorsMilky({super.key, required this.list});

  final String list;

  @override
  State<ColorsMilky> createState() => _ColorsMilkyState();
}

class _ColorsMilkyState extends State<ColorsMilky> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfColorShade extends StatefulWidget {
  const ListOfColorShade({super.key});

  @override
  State<ListOfColorShade> createState() => _ListOfColorShadeState();
}

class _ListOfColorShadeState extends State<ListOfColorShade> {
  List<String> colorShade = [
    'NONE',
    'LIGHT',
    'MEDIUM',
    'HEAVY',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 114.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('COLOR SHADE',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 114.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: colorShade.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsShade(
                  list: colorShade[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsShade extends StatefulWidget {
  const ColorsShade({super.key, required this.list});

  final String list;

  @override
  State<ColorsShade> createState() => _ColorsShadeState();
}

class _ColorsShadeState extends State<ColorsShade> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfBrown extends StatefulWidget {
  const ListOfBrown({super.key});

  @override
  State<ListOfBrown> createState() => _ListOfBrownState();
}

class _ListOfBrownState extends State<ListOfBrown> {
  List<String> brown = [
    'N',
    'L',
    'M',
    'H',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 135.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('BROWN',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 135.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: brown.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsBrown(
                  list: brown[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsBrown extends StatefulWidget {
  const ColorsBrown({super.key, required this.list});

  final String list;

  @override
  State<ColorsBrown> createState() => _ColorsBrownState();
}

class _ColorsBrownState extends State<ColorsBrown> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfEyeClean extends StatefulWidget {
  const ListOfEyeClean({super.key});

  @override
  State<ListOfEyeClean> createState() => _ListOfEyeCleanState();
}

class _ListOfEyeCleanState extends State<ListOfEyeClean> {
  List<String> eyeClean = [
    'YES',
    'BORDER LINE',
    'NO',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 127.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('EYECLEAN',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 127.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: eyeClean.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsEyeclean(
                  list: eyeClean[index],
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsEyeclean extends StatefulWidget {
  const ColorsEyeclean({super.key, required this.list});

  final String list;

  @override
  State<ColorsEyeclean> createState() => _ColorsEyecleanState();
}

class _ColorsEyecleanState extends State<ColorsEyeclean> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListTabBlack extends StatefulWidget {
  const ListTabBlack({super.key});

  @override
  State<ListTabBlack> createState() => _ListTabBlackState();
}

class _ListTabBlackState extends State<ListTabBlack> {
  List<String> tabBlack = [
    'N',
    'L',
    'M',
    'H',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 124.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('TAB BLACK',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 124.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: tabBlack.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsTabBlack(
                  list: tabBlack[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsTabBlack extends StatefulWidget {
  const ColorsTabBlack({super.key, required this.list});

  final String list;

  @override
  State<ColorsTabBlack> createState() => _ColorsTabBlackState();
}

class _ColorsTabBlackState extends State<ColorsTabBlack> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfCenterInc extends StatefulWidget {
  const ListOfCenterInc({super.key});

  @override
  State<ListOfCenterInc> createState() => _ListOfCenterIncState();
}

class _ListOfCenterIncState extends State<ListOfCenterInc> {
  List<String> centerInc = [
    'N',
    'L',
    'M',
    'H',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 119.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('CENTER INC.',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 119.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: centerInc.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsCenterInc(
                  list: centerInc[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsCenterInc extends StatefulWidget {
  const ColorsCenterInc({super.key, required this.list});

  final String list;

  @override
  State<ColorsCenterInc> createState() => _ColorsCenterIncState();
}

class _ColorsCenterIncState extends State<ColorsCenterInc> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfSideBack extends StatefulWidget {
  const ListOfSideBack({super.key});

  @override
  State<ListOfSideBack> createState() => _ListOfSideBackState();
}

class _ListOfSideBackState extends State<ListOfSideBack> {
  List<String> sideBack = [
    'N',
    'L',
    'M',
    'H',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 121.w,
              height: 2.h,
              margin: EdgeInsets.only(right: 5.w),
              color: Colors.black54,
            ),
            Text('SIDE BLACK',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                )),
            Container(
              width: 121.w,
              height: 2.h,
              margin: EdgeInsets.only(left: 5.w),
              color: Colors.black54,
            ),
          ],
        ),
        GridView.builder(
          itemCount: sideBack.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 12.h),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.w, mainAxisExtent: 60.h),
          itemBuilder: (BuildContext context, int index) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ColorsSideBack(
                  list: sideBack[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ColorsSideBack extends StatefulWidget {
  const ColorsSideBack({super.key, required this.list});

  final String list;

  @override
  State<ColorsSideBack> createState() => _ColorsSideBackState();
}

class _ColorsSideBackState extends State<ColorsSideBack> {
  bool selectColors = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        elevation: 3,
        backgroundColor: selectColors == true ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderBox, width: 2),
            borderRadius: BorderRadius.circular(4.r)),
        fixedSize: Size(0.w, 45.h),
      ),
      onPressed: () {
        setState(() {
          selectColors = !selectColors;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        child: Text(widget.list,
            style: GoogleFonts.poppins(
              color: selectColors == true ? hintGridList : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}

class ListOfStockIDRap extends StatefulWidget {
  const ListOfStockIDRap({super.key});

  @override
  State<ListOfStockIDRap> createState() => _ListOfStockIDRapState();
}

class _ListOfStockIDRapState extends State<ListOfStockIDRap> {
  TextEditingController stockFrom = TextEditingController();
  TextEditingController stockTo = TextEditingController();
  TextEditingController rapFrom = TextEditingController();
  TextEditingController rapTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 3.w),
                  color: Colors.black54,
                ),
                Text('STOCK ID',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 40.w,
                  height: 2.h,
                  margin: EdgeInsets.only(left: 3.w),
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: stockFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 79.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: stockTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 56.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 2.w),
                  color: Colors.black54,
                ),
                Text('RAP %',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 56.w,
                  height: 2.h,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: rapFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 76.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: rapTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ListOfPriceLength extends StatefulWidget {
  const ListOfPriceLength({super.key});

  @override
  State<ListOfPriceLength> createState() => _ListOfPriceLengthState();
}

class _ListOfPriceLengthState extends State<ListOfPriceLength> {
  TextEditingController priceFrom = TextEditingController();
  TextEditingController priceTo = TextEditingController();
  TextEditingController lengthFrom = TextEditingController();
  TextEditingController lengthTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 34.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 3.w),
                  color: Colors.black54,
                ),
                Text('PRICE/CTS',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 34.w,
                  height: 2.h,
                  margin: EdgeInsets.only(left: 3.w),
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: priceFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 79.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: priceTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 2.w),
                  color: Colors.black54,
                ),
                Text('LENGTH',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 48.w,
                  height: 2.h,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: lengthFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 76.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: lengthTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ListOfWidthDepth extends StatefulWidget {
  const ListOfWidthDepth({super.key});

  @override
  State<ListOfWidthDepth> createState() => _ListOfWidthDepthState();
}

class _ListOfWidthDepthState extends State<ListOfWidthDepth> {
  TextEditingController widthFrom = TextEditingController();
  TextEditingController widthTo = TextEditingController();
  TextEditingController depthFrom = TextEditingController();
  TextEditingController depthTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 3.w),
                  color: Colors.black54,
                ),
                Text('WIDTH',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 48.w,
                  height: 2.h,
                  margin: EdgeInsets.only(left: 3.w),
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: widthFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 79.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: widthTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 51.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 2.w),
                  color: Colors.black54,
                ),
                Text('DEPTH',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 51.w,
                  height: 2.h,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: depthFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 76.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: depthTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ListOfTableDepth extends StatefulWidget {
  const ListOfTableDepth({super.key});

  @override
  State<ListOfTableDepth> createState() => _ListOfTableDepthState();
}

class _ListOfTableDepthState extends State<ListOfTableDepth> {
  TextEditingController tableFrom = TextEditingController();
  TextEditingController tableTo = TextEditingController();
  TextEditingController tableDepthFrom = TextEditingController();
  TextEditingController tableDepthTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 45.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 3.w),
                  color: Colors.black54,
                ),
                Text('TABLE %',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 45.w,
                  height: 2.h,
                  margin: EdgeInsets.only(left: 3.w),
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: tableFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 79.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderBox, width: 2),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: TextField(
                      controller: tableTo,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                        border: InputBorder.none,
                        hintText: 'To',
                        hintStyle: GoogleFonts.poppins(
                          color: hintGridList,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 45.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 2.w),
                  color: Colors.black54,
                ),
                Text('DEPTH %',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 45.w,
                  height: 2.h,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                    width: 76.w,
                    height: 30.h,
                    margin: EdgeInsets.only(right: 4.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderBox, width: 2),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: TextField(
                      controller: tableDepthFrom,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                        border: InputBorder.none,
                        hintText: 'From',
                        hintStyle: GoogleFonts.poppins(
                          color: hintGridList,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                Container(
                    width: 76.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderBox, width: 2),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: TextField(
                      controller: tableDepthTo,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                        border: InputBorder.none,
                        hintText: 'To',
                        hintStyle: GoogleFonts.poppins(
                          color: hintGridList,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ListOfCaCh extends StatefulWidget {
  const ListOfCaCh({super.key});

  @override
  State<ListOfCaCh> createState() => _ListOfCaChState();
}

class _ListOfCaChState extends State<ListOfCaCh> {
  TextEditingController caFrom = TextEditingController();
  TextEditingController caTo = TextEditingController();
  TextEditingController chFrom = TextEditingController();
  TextEditingController chTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 63.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 3.w),
                  color: Colors.black54,
                ),
                Text('CA',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 63.w,
                  height: 2.h,
                  margin: EdgeInsets.only(left: 3.w),
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                    width: 76.w,
                    height: 30.h,
                    margin: EdgeInsets.only(right: 4.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderBox, width: 2),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: TextField(
                      controller: caFrom,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                        border: InputBorder.none,
                        hintText: 'From',
                        hintStyle: GoogleFonts.poppins(
                          color: hintGridList,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                Container(
                    width: 79.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderBox, width: 2),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: TextField(
                      controller: caTo,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                        border: InputBorder.none,
                        hintText: 'To',
                        hintStyle: GoogleFonts.poppins(
                          color: hintGridList,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 63.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 2.w),
                  color: Colors.black54,
                ),
                Text('CH',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 63.w,
                  height: 2.h,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                    width: 76.w,
                    height: 30.h,
                    margin: EdgeInsets.only(right: 4.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderBox, width: 2),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: TextField(
                      controller: chFrom,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                        border: InputBorder.none,
                        hintText: 'From',
                        hintStyle: GoogleFonts.poppins(
                          color: hintGridList,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
                Container(
                  width: 76.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: chTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ListOfPaPh extends StatefulWidget {
  const ListOfPaPh({super.key});

  @override
  State<ListOfPaPh> createState() => _ListOfPaPhState();
}

class _ListOfPaPhState extends State<ListOfPaPh> {
  TextEditingController paFrom = TextEditingController();
  TextEditingController paTo = TextEditingController();
  TextEditingController phFrom = TextEditingController();
  TextEditingController phTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 63.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 3.w),
                  color: Colors.black54,
                ),
                Text('PA',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 63.w,
                  height: 2.h,
                  margin: EdgeInsets.only(left: 3.w),
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: paFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 79.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: paTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 63.w,
                  height: 2.h,
                  margin: EdgeInsets.only(right: 2.w),
                  color: Colors.black54,
                ),
                Text('PH',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  width: 63.w,
                  height: 2.h,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  width: 76.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: TextField(
                    controller: phFrom,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 76.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: borderBox, width: 2),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: TextField(
                    controller: phTo,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 9.h, left: 5.w),
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: GoogleFonts.poppins(
                        color: hintGridList,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
