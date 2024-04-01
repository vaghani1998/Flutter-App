import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_temp/Const_Colors/colors.dart';
import 'package:weather_temp/Home/Home_1/temprature.dart';
import 'package:weather_temp/Home/Home_2/searchpage.dart';
import 'package:weather_temp/Home/Home_3/location_find.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        bottomSelectedIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  List<Widget> page = [
    const Temperatures(),
    const SearchPage(),
    const LocationFind(),
  ];

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(microseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {},
        children: page,
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.r), topRight: Radius.circular(6.r)),
        ),
        child: BottomNavigationBar(
          backgroundColor: background,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: bottomSelectedIndex == 0 ? bottomIcons : bottomIcons1,
                  size: 26),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: background,
              icon: Icon(Icons.favorite_outline_sharp,
                  size: 26.w,
                  color: bottomSelectedIndex == 1 ? bottomIcons : bottomIcons1),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: background,
              icon: SvgPicture.asset('assets/Bottom_Icons/more.svg',
                  height: 24.w,
                  color: bottomSelectedIndex == 2 ? bottomIcons : bottomIcons1),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
