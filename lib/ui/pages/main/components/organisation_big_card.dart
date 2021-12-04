import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/models/organisation.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/images.dart';

class OrganisationBigCard extends StatelessWidget {
  final Organisation organisation;
  const OrganisationBigCard(this.organisation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          width: 200.w,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: 267.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    organisation.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 16.w,
                child: SvgPicture.asset(
                  AppImages.heartFilledIcon,
                ),
              ),
              Positioned(
                bottom: 16.h,
                left: 16.h,
                right: 16.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        organisation.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Gilroy Bold',
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          _StarsWidget(organisation.rating),
                          Text(
                            '(${organisation.ratingCount})',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        organisation.openCloseTime,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 10.h),
                    ],
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

class _StarsWidget extends StatelessWidget {
  final double rating;
  const _StarsWidget(
    this.rating, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [0, 1, 2, 3, 4]
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(right: 2.0.w),
              child: SvgPicture.asset(
                AppImages.starIcon,
                color: e < rating ? AppColors.primaryColor : AppColors.borderGrey,
              ),
            ),
          )
          .toList(),
    );
  }
}
