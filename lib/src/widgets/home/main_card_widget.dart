import 'package:flutter/material.dart';

import '../../shared/colors/app_colors.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.titleColor,
    required this.iconColor,
    super.key,
  });

  final String title;
  final String subTitle;
  final IconData icon;
  final Color titleColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onTap: () {},
          child: ListTile(
            minLeadingWidth: 1,
            title: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: titleColor,
              ),
            ),
            subtitle: Text(
              subTitle,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: AppColors.blacky,
              ),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: -3,
                  child: Icon(
                    icon,
                    size: 23.84,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
