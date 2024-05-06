import 'package:clubhub/core/constants/app_routes.dart';
import 'package:clubhub/core/design/dimens.dart';
import 'package:clubhub/core/design/text_theme.dart';
import 'package:clubhub/core/extensions/string_extensions.dart';
import 'package:clubhub/presentation/home/cubit/home_cubit.dart';
import 'package:clubhub/presentation/widgets/person_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  GetIt get sl => GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..init(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.home),
        actions: [
          IconButton.filled(
            onPressed: () => context.pushNamed(AppRoutes.search),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => previous.persons != current.persons,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimens.space16),
                  child: Text(context.loc.contacts, style: textTheme.appTitle1),
                ),
                Expanded(
                  child: PersonList(personList: state.persons),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
