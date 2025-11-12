import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:wingull/core/constants/app_constants.dart';
import 'package:wingull/core/theme/app_text_styles.dart';
import 'package:wingull/core/widgets/app_animation_wrapper.dart';
import 'package:wingull/core/widgets/app_elevated_button.dart';
import 'package:wingull/core/widgets/app_form_field.dart';
import 'package:wingull/core/widgets/app_scaffold_widget.dart';
import 'package:wingull/core/widgets/app_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      canLooseFocusOnTapOutside: true,
      paddingLevel: PaddingLevel.large,
      body: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppAnimationWrapper(
            child: AppTextWidget(
              data: 'Welcome back to ${AppConstants.appName}',
              textStyle: AppTextStyles.headline1,
            ),
          ),
          AppAnimationWrapper(
            child: AppTextWidget(
              data: '''Let's continue winning''',
              textStyle: AppTextStyles.body,
            ),
          ),
          AppAnimationWrapper(
            animationType: AppAnimationType.appearFromLeftToRight,
            offset: 0.2,
            duration: Duration(milliseconds: 1000),
            child: AppFormField(
              hintText: 'example@domain.com',
              controller: _emailController,

            ),
          ),
          Spacer(),
          AppElevatedButton(
            onPressed: () {},
            title: 'Continue',
            size: AppButtonSize.fullWidth,
            icon: FontAwesome.arrow_right_solid,
          ),
        ],
      ),
    );
  }
}
