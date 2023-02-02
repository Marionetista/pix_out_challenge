import 'package:flutter/material.dart';

import '../../shared/colors/app_colors.dart';

class SubCardWidget extends StatelessWidget {
  const SubCardWidget({
    required this.title,
    required this.icon,
    required this.iconColor,
    super.key,
  });

  final String title;
  final IconData icon;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 9.5,
                    left: 6.5,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
