import 'package:clubhub/core/design/colors.dart';
import 'package:clubhub/core/design/dimens.dart';
import 'package:clubhub/core/design/text_theme.dart';
import 'package:clubhub/core/extensions/string_extensions.dart';
import 'package:clubhub/dependency_injection/injections.dart';
import 'package:clubhub/presentation/detail/cubit/detail_cubit.dart';
import 'package:clubhub/presentation/detail/widgets/profile_info_item.dart';
import 'package:clubhub/presentation/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.personId});

  final String personId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DetailCubit>()..init(personId),
      child: const _DetailView(),
    );
  }
}

class _DetailView extends StatelessWidget {
  const _DetailView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    child: Column(
                      children: [
                        CachedImage(imageUrl: state.person?.imageURL ?? ''),
                        const SizedBox(
                          width: double.infinity,
                          height: Dimens.space32,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: Dimens.space16),
                  Center(
                    child: Text(state.person?.getFullName() ?? '',
                        style: textTheme.appTitle1),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.space20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileInfoItem(
                            title: context.loc.name,
                            value: state.person?.email ?? '',
                            iconData: Icons.email,
                          ),
                          ProfileInfoItem(
                            title: context.loc.age,
                            value: state.person?.age.toString() ?? '',
                            iconData: Icons.cake,
                          ),
                          ProfileInfoItem(
                            title: context.loc.phone,
                            value: state.person?.phone ?? '',
                            iconData: Icons.phone,
                          ),
                          ProfileInfoItem(
                            title: context.loc.cell,
                            value: state.person?.cell ?? '',
                            iconData: Icons.phone_android,
                          ),
                          const SizedBox(),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
