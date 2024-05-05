import 'package:clubhub/core/constants/app_routes.dart';
import 'package:clubhub/presentation/home/cubit/home_cubit.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton.filled(
            onPressed: () {
              context.pushNamed(AppRoutes.search);
            },
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
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: state.persons.length,
              itemBuilder: (context, index) {
                final person = state.persons[index];
                return ListTile(
                  title: Text(person.name),
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
