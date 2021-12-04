import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/models/organisation.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/images.dart';

class OrganisationCard extends StatelessWidget {
  final Organisation organisation;

  const OrganisationCard(
    this.organisation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        height: 90.h,
        child: Stack(
          children: [
            Container(
              width: 84.w,
              child: Image.asset(
                organisation.image,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 14.w,
              top: 10.h,
              child: SvgPicture.asset(
                organisation.isLiked ? AppImages.heartFilledIcon : AppImages.heartIcon,
              ),
            ),
            Positioned(
              top: 10.h,
              left: 88.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    organisation.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    organisation.address,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    organisation.openCloseTime,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
