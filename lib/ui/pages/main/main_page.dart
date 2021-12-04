import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/images.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double iconSize = 24.r;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        items: <Widget>[
          SvgPicture.asset(
            AppImages.homeIcon,
            color: _selectedIndex == 0 ? AppColors.primaryColor : AppColors.grey,
            semanticsLabel: 'Asosiy',
          ),
          SvgPicture.asset(
            AppImages.heartIcon,
            color: _selectedIndex == 1 ? AppColors.primaryColor : AppColors.grey,
            semanticsLabel: 'Saqlangan',
          ),
          SvgPicture.asset(
            AppImages.userIcon,
            color: _selectedIndex == 2 ? AppColors.primaryColor : AppColors.grey,
            semanticsLabel: 'Profil',
          ),
        ],
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
          //Handle button tap
        },
      ),
      body: Container(color: Colors.blueAccent),
    );
  }
}
