import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_government/models/news.dart';
import 'package:my_government/ui/pages/main/bloc/main_bloc.dart';
import 'package:my_government/ui/pages/main/bloc/main_state.dart';
import 'package:my_government/utils/colors.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        buildWhen: (p, c) => c is PagesState,
        builder: (context, state) {
          state as NewsPageState;
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
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Havolalar',
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ...state.newsList.map((e) => _NewsCard(e)).toList(),
                ],
              ),
            ),
          );
        });
  }
}

class _NewsCard extends StatelessWidget {
  final News news;
  const _NewsCard(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 18.h),
        width: 200.w,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  news.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.grey.withAlpha(200),
                      Colors.grey.withAlpha(180),
                      Colors.grey.withAlpha(70),
                      Colors.transparent,
                    ],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  height: 500,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              child: Container(
                width: 330.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Center(
                  child: Text(
                    news.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
