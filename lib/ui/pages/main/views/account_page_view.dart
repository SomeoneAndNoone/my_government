import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/fake_images.dart';
import 'package:my_government/utils/images.dart';

class AccountPageView extends StatelessWidget {
  const AccountPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          child: Stack(
            children: [
              Image.asset(
                FakeImages.profileBackgr,
              ),
              Positioned(
                right: 20.w,
                bottom: 30.h,
                child: Container(
                  width: 37.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                    color: AppColors.cameraBackgr,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 140.w,
                bottom: 14.h,
                child: Center(
                  child: SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: Image.asset(
                      FakeImages.profile,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Anonymous',
          style: TextStyle(
            fontFamily: 'Gilroy Bold',
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'ID 00001231',
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 15.h),
        _ButtonWidget('Sharhlar tarixi', AppImages.sharhlarTarixi, AppColors.sharhlarTarixiBackgr),
        _ButtonWidget('Dastur haqida', AppImages.dasturHaqida, AppColors.dasturHaqidaBackgr),
        _ButtonWidget('Yordam', AppImages.yordam, AppColors.sharhlarTarixiBackgr),
        _ButtonWidget('Sozlamalar', AppImages.sozlamalar, AppColors.sozlamalarBackgr),
        _ButtonWidget('Chiqish', AppImages.chiqish, AppColors.chiqishBackgr),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final Color iconCardBackgrColor;
  final String title;
  final String icon;
  const _ButtonWidget(
    this.title,
    this.icon,
    this.iconCardBackgrColor, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 28.w,
          vertical: 8.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
            child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: iconCardBackgrColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                icon,
                // color: Colors.black,
              ),
            ),
            SizedBox(width: 15.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )),
      ),
    );
  }
}
