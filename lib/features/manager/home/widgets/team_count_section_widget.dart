import 'package:flutter/material.dart';

import '../../../../core/theme/app_paddings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme.dart' show AppThemes;
import '../../../../core/widgets/app_text_widget.dart';

class TeamCountSectionWidget extends StatelessWidget {
  String title;
  String count;

  TeamCountSectionWidget({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppThemes.accentColor,
      ),
      child: Padding(
        padding: AppPaddings.normalPadding2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextWidget(
              data: title,
              textStyle: AppTextStyles.body,
            ),
            AppTextWidget(data: '4/10', textStyle: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }
}
