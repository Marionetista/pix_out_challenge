import 'package:flutter/material.dart';

import '../../shared/colors/app_colors.dart';

class OptionsCardWidget extends StatelessWidget {
  const OptionsCardWidget({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            onTap: onTap,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: AppColors.darkPinky,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.darkPinky,
              ),
            ),
          ),
        ),
      );
}
