import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/fake_images.dart';
import 'package:my_government/utils/images.dart';

class SinglePerson extends StatelessWidget {
  const SinglePerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 300.h,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                    child: Image.asset(
                      FakeImages.ichkiIshlarVaziri,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 20.w,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      AppImages.backIcon,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30.h,
                  left: 20.w,
                  child: Text(
                    "Bobojonov Po'lat\nRazzoqovich",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontFamily: 'Gilroy Bold',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          _OrganisationBottomWidget(),
        ],
      ),
    );
  }
}

class _OrganisationBottomWidget extends StatefulWidget {
  const _OrganisationBottomWidget({Key? key}) : super(key: key);

  @override
  State<_OrganisationBottomWidget> createState() => _OrganisationBottomWidgetState();
}

class _OrganisationBottomWidgetState extends State<_OrganisationBottomWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _SelectedText(
              'Shaxs haqida',
              selectedIndex == 0,
              () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            _SelectedText(
              'Sharhlar',
              selectedIndex == 1,
              () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            )
          ],
        ),
        if (selectedIndex == 0) _InformationWidget(),
        if (selectedIndex == 1) _CommentsWidget(),
      ],
    );
  }
}

class _InformationWidget extends StatelessWidget {
  const _InformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5.h),
          Text(
            "Ma'lumot",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Leonardo di ser Piero da Vinci (Leonardo di ser Pyero da Vinchi, 1452-yil 15-aprel, Vinchi shaharchasi yonidagi Ankiano qishlog'i, Florensiya yaqinida — 1519-yil 2-may, Ambuaz yaqinidagi Klo-Luse qasri, Turen, Fransiya) — buyuk italyan musavviri va olimi, italyan Renessansi ideali - 'mukammal inson' (homo universale) namunasi.",
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}

class _CommentsWidget extends StatelessWidget {
  const _CommentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Text(
            'Foydalanuvchi sharhlari',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 15.h),
          Image.asset(FakeImages.cardImage),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}

class _SelectedText extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;
  const _SelectedText(
    this.text,
    this.isSelected,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$text\n•',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
  }
}
