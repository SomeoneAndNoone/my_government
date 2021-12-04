import 'package:flutter/material.dart';

enum AppSnackBarGrade { success, warning, error, info }

extension AppSnackBarGradeExt on AppSnackBarGrade {
  Color get color {
    if (this == AppSnackBarGrade.success) {
      return Colors.green;
    } else if (this == AppSnackBarGrade.warning) {
      return Colors.yellow;
    } else if (this == AppSnackBarGrade.info) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}

class AppSnackBar extends SnackBar {
  final String title;
  final String? description;
  final AppSnackBarGrade grade;
  final IconData iconData;

  AppSnackBar({
    Key? key,
    required this.title,
    this.description,
    this.grade = AppSnackBarGrade.warning,
    this.iconData = Icons.warning_rounded,
  }) : super(
          key: key,
          backgroundColor: grade.color,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(18.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          content: Row(
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 36.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title),
                    if (description?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          description!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );

  static void showSuccess(
    ScaffoldMessengerState scaffoldMessenger, {
    required String title,
    String? description,
    IconData? iconData,
  }) =>
      scaffoldMessenger.showSnackBar(
        AppSnackBar(
          title: title,
          description: description,
          grade: AppSnackBarGrade.success,
          iconData: iconData ?? Icons.done,
        ),
      );

  static void showWarning(
    ScaffoldMessengerState scaffoldMessenger, {
    required String title,
    String? description,
    IconData? iconData,
  }) =>
      scaffoldMessenger.showSnackBar(
        AppSnackBar(
          title: title,
          description: description,
          grade: AppSnackBarGrade.warning,
          iconData: iconData ?? Icons.info_rounded,
        ),
      );

  static void showError(
    ScaffoldMessengerState scaffoldMessenger, {
    required String title,
    String? description,
    IconData? iconData,
  }) =>
      scaffoldMessenger.showSnackBar(
        AppSnackBar(
          title: title,
          description: description,
          grade: AppSnackBarGrade.error,
          iconData: iconData ?? Icons.error,
        ),
      );

  static void showInfo(
    ScaffoldMessengerState scaffoldMessenger, {
    required String title,
    String? description,
    IconData? iconData,
  }) =>
      scaffoldMessenger.showSnackBar(
        AppSnackBar(
          title: title,
          description: description,
          grade: AppSnackBarGrade.info,
          iconData: iconData ?? Icons.info,
        ),
      );
}
