import 'package:clubhub/dependency_injection/injections.dart';
import 'package:clubhub/presentation/detail/cubit/detail_cubit.dart';
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
    return Scaffold(
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Text(state.person?.name ?? ''),
                Text(state.person?.age.toString() ?? ''),
                Text(state.person?.email ?? ''),
                Text(state.person?.phone ?? ''),
              ],
            );
          }
        },
      ),
    );
  }
}
