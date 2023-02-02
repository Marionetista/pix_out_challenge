import 'package:flutter/material.dart';
import '../../shared/colors/app_colors.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) => Container(
        height: 200.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkPinky,
              AppColors.pinky,
            ],
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(200, 20),
          ),
        ),
      );
}
