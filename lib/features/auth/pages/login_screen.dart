import 'package:flutter/material.dart';
import 'package:wingull/core/constants/app_constants.dart';
import 'package:wingull/core/theme/app_text_styles.dart';
import 'package:wingull/core/widgets/app_scaffold_widget.dart';
import 'package:wingull/core/widgets/app_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      paddingLevel: PaddingLevel.large,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextWidget(data: 'Welcome back to ${AppConstants.appName}', textStyle: AppTextStyles.headline1, )
        ],
      ),
    );
  }
}
