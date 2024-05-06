import 'package:clubhub/core/design/colors.dart';
import 'package:clubhub/core/extensions/string_extensions.dart';
import 'package:clubhub/presentation/search/cubit/search_cubit.dart';
import 'package:clubhub/presentation/search/widgets/search_app_bar.dart';
import 'package:clubhub/presentation/widgets/person_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  GetIt get sl => GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return Scaffold(
      appBar: SearchAppBar(
        title: context.loc.search,
        onSearch: (value) {
          cubit.search(value);
        },
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
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
            return PersonList(personList: state.persons);
          }
        },
      ),
    );
  }
}
