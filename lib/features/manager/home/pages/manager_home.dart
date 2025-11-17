import 'package:flutter/material.dart';
import 'package:wingull/core/constants/app_constants.dart';
import 'package:wingull/core/theme/app_paddings.dart';
import 'package:wingull/core/theme/app_text_styles.dart';
import 'package:wingull/core/theme/app_theme.dart';
import 'package:wingull/core/widgets/app_animation_wrapper.dart';
import 'package:wingull/core/widgets/app_scaffold_widget.dart';
import 'package:wingull/core/widgets/app_text_widget.dart';
import 'package:wingull/features/manager/home/widgets/team_count_section_widget.dart';

class ManagerHome extends StatelessWidget {
  const ManagerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      paddingLevel: PaddingLevel.medium,
      scrollable: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          AppAnimationWrapper(
            child: AppTextWidget(
              data: 'Welcome ${AppConstants.appName}',
              textStyle: AppTextStyles.headline1,
            ),
          ),
          TeamCountSectionWidget(title: 'Active Team Members', count: '4/10',)
        ],
      ),
    );
  }
}
