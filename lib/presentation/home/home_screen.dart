import 'package:clubhub/core/constants/app_routes.dart';
import 'package:clubhub/core/design/colors.dart';
import 'package:clubhub/core/design/dimens.dart';
import 'package:clubhub/core/design/text_theme.dart';
import 'package:clubhub/core/extensions/string_extensions.dart';
import 'package:clubhub/presentation/home/cubit/home_cubit.dart';
import 'package:clubhub/presentation/widgets/person_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      body: BlocConsumer<HomeCubit, HomeState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.errorMessage != null) {
            Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: AppColors.errorColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        buildWhen: (previous, current) => previous.persons != current.persons,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.persons.isEmpty) {
            return Center(
              child: Text(context.loc.no_search_founds),
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
