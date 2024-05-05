import 'package:clubhub/core/design/colors.dart';
import 'package:clubhub/core/design/dimens.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/presentation/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.space8),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: Dimens.space8),
          CachedImage(imageUrl: person.imageURL),
          const SizedBox(height: Dimens.space8),
          Text(person.name),
          const SizedBox(height: Dimens.space8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: AppColors.primaryColor,
              ),
              Icon(
                Icons.phone,
                color: AppColors.primaryColor,
              ),
              Icon(
                Icons.message,
                color: AppColors.primaryColor,
              ),
              Icon(
                Icons.person,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
