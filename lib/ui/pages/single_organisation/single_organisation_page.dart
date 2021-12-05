import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/fake_data.dart';
import 'package:my_government/ui/pages/single_person/single_person.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/fake_images.dart';
import 'package:my_government/utils/images.dart';

class SingleOrganisationPage extends StatelessWidget {
  const SingleOrganisationPage({Key? key}) : super(key: key);

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
                  child: Image.asset(
                    FakeImages.ichkiIshlar,
                    fit: BoxFit.fill,
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
                    "Oʻzbekiston Respublikasi\nIchki ishlar vazirligi",
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
              'Tashkilot haqida',
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
            "Oʻzbekiston Respublikasi ijroiya hokimiyati organi hisoblanib, oʻz vakolatlari doirasida fuqaro va inson erkinligi va huquqlarini himoyalashda davlat boshqaruvini amalga oshiradigan, huquq-tartibotni saqlash, jamoat xavfsizligini taʼminlash.",
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Manzil",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 15.h),
          Image.asset(FakeImages.organisationMap),
          SizedBox(height: 15.h),
          Text(
            "Rahbariyat",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 80.h,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: rahbarlarList
                  .map(
                    (e) => Card(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, right: 18.w),
                        child: Row(
                          children: [
                            Image.asset(
                              FakeImages.rahbariyatImage,
                              height: 50.h,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  e.name,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  e.title,
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "Ishchilar",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 10.h),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: ishchilarList
                .map(
                  (e) => ScaleTap(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => SinglePerson()));
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 8.w,
                          top: 40.h,
                          bottom: 40.h,
                        ),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    e.title,
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
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
          Center(
            child: ScaleTap(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  "Sharh qo'shish",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          )
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
