import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/images.dart';

class OrganisationView extends StatelessWidget {
  const OrganisationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        _SearchWidget(),
      ],
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(
                  color: AppColors.borderGrey,
                  width: 1.0.w,
                ),
              ),
              child: Container(
                height: 36.h,
                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      AppImages.searchIcon,
                      color: AppColors.searchColor,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Qidiruv',
                      style: TextStyle(color: AppColors.searchTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 18.w),
          SvgPicture.asset(
            AppImages.filtersIcons,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
