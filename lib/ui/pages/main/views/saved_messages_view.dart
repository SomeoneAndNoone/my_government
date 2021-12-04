import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/ui/pages/main/bloc/main_bloc.dart';
import 'package:my_government/ui/pages/main/bloc/main_state.dart';
import 'package:my_government/ui/pages/main/components/organisation_card.dart';
import 'package:my_government/utils/images.dart';

class SavedMessagesView extends StatelessWidget {
  const SavedMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        buildWhen: (p, c) => c is PagesState,
        builder: (context, state) {
          state as SavedMessagesPageState;
          return Padding(
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 16.h,
            ),
            child: Center(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 18.h),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImages.backIcon),
                      SizedBox(width: 70.w),
                      Text(
                        'Saqlangan tashkilotlar',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ...state.organisations.map((e) => OrganisationCard(e)).toList(),
                ],
              ),
            ),
          );
        });
  }
}
