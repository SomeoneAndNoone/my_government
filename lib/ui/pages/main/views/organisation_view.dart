import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/ui/pages/main/bloc/main_bloc.dart';
import 'package:my_government/ui/pages/main/bloc/main_state.dart';
import 'package:my_government/ui/pages/main/components/organisation_big_card.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/images.dart';

class OrganisationView extends StatelessWidget {
  const OrganisationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.w),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(right: 28.w),
            child: const _SearchWidget(),
          ),
          SizedBox(height: 20.h),
          Text(
            'Qaysi tashkilotni\nizlayapsiz ?',
            style: TextStyle(
              fontSize: 28.sp,
              fontFamily: 'Gilroy Bold',
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 12.h),
          _OrganisationsListWidget(),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.only(right: 28.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eng yaxshi reytinglar',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Hammasi',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrganisationsListWidget extends StatelessWidget {
  const _OrganisationsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        buildWhen: (p, c) => c is OrganisationsPageState,
        builder: (context, state) {
          state as OrganisationsPageState;
          return Container(
            height: 250.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.mainOrganisations.length,
              itemBuilder: (c, i) => OrganisationBigCard(state.mainOrganisations[i]),
              scrollDirection: Axis.horizontal,
            ),
          );
        });
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  const Text(
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
    );
  }
}
