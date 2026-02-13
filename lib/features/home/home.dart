import 'package:flutter/material.dart';
import '../../core/routing/app_routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_elevated_btn.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              btnTitle: AppStrings.kGold,
              backgroundColor: AppColors.gold,
              onPressed:
                  () async =>
                      await Navigator.of(context).pushNamed(AppRoutes.kGold),
            ),
            CustomElevatedButton(
              btnTitle: AppStrings.kSilver,
              backgroundColor: AppColors.silver,
              onPressed:
                  () async =>
                      await Navigator.of(context).pushNamed(AppRoutes.kSilver),
            ),
          ],
        ),
      ),
    );
  }
}
