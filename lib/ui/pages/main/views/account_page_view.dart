import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/fake_images.dart';

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
      ],
    );
  }
}
