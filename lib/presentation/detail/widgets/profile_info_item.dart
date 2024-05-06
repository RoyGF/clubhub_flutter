import 'package:clubhub/core/design/colors.dart';
import 'package:clubhub/core/design/dimens.dart';
import 'package:clubhub/core/design/text_theme.dart';
import 'package:flutter/material.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.iconData,
  });

  final String title;
  final String value;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
        ),
        const SizedBox(
          width: Dimens.space16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.appBody1.copyWith(
                  color: AppColors.textColor2,
                ),
              ),
              Text(value, style: theme.appTitle2),
            ],
          ),
        ),
      ],
    );
  }
}
