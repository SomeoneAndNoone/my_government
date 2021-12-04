import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_government/ui/pages/main/bloc/main_bloc.dart';
import 'package:my_government/ui/pages/main/bloc/main_event.dart';
import 'package:my_government/ui/pages/main/bloc/main_state.dart';
import 'package:my_government/ui/pages/main/views/account_page_view.dart';
import 'package:my_government/ui/pages/main/views/leaders_view.dart';
import 'package:my_government/ui/pages/main/views/main_view.dart';
import 'package:my_government/ui/pages/main/views/news_view.dart';
import 'package:my_government/utils/colors.dart';
import 'package:my_government/utils/images.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPageView();
  }
}

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  // @override
  // void initState() {
  //   context.read<MainBloc>().stream.listen((state) {
  //     if (state is MessagesPageState) {
  //       AppSnackBar.showInfo(
  //         ScaffoldMessenger.of(context),
  //         iconData: Icons.done,
  //         title: state.message,
  //       );
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double iconSize = 24.r;
    return Scaffold(
      bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
          buildWhen: (prev, cur) => cur is PagesState,
          builder: (context, state) {
            state as PagesState;
            return CurvedNavigationBar(
              backgroundColor: AppColors.screen,
              items: <Widget>[
                SvgPicture.asset(
                  AppImages.homeIcon,
                  color: state.index == 0 ? AppColors.primaryColor : AppColors.grey,
                  semanticsLabel: 'Asosiy',
                ),
                SvgPicture.asset(
                  AppImages.heartIcon,
                  color: state.index == 1 ? AppColors.primaryColor : AppColors.grey,
                  semanticsLabel: 'Saqlangan',
                ),
                SvgPicture.asset(
                  AppImages.userIcon,
                  color: state.index == 2 ? AppColors.primaryColor : AppColors.grey,
                  semanticsLabel: 'Profil',
                ),
              ],
              onTap: (index) => context.read<MainBloc>().add(GetPageEvent(index)),
            );
          }),
      body: BlocBuilder<MainBloc, MainState>(
        buildWhen: (prev, current) => current is PagesState,
        builder: (context, state) {
          state is PagesState;
          print('Khamidjon: new state come: $state');
          if (state is OrganisationsPageState) {
            return MainView();
          } else if (state is NewsPageState) {
            return NewsView();
          } else if (state is LeadersPageState) {
            return LeadersView();
          } else if (state is SavedMessagesPageState) {
            return AccountPageView();
          }
          return Container(
            child: Text('no state'),
          );
        },
      ),
    );
  }
}
