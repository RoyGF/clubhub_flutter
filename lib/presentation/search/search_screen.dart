import 'package:clubhub/presentation/search/cubit/search_cubit.dart';
import 'package:clubhub/presentation/search/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        onSearch: (value) {
          cubit.search(value);
        },
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        buildWhen: (previous, current) => previous.persons != current.persons,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: state.persons.length,
              itemBuilder: (context, index) {
                final person = state.persons[index];
                return ListTile(
                  title: Text('${person.name} ${person.surname}'),
                  subtitle: Text(person.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
