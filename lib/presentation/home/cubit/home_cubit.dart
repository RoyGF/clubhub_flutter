import 'package:clubhub/core/base/base_use_case.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/domain/get_persons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getPersons,
  }) : super(const HomeState());

  final GetPersons getPersons;

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final result = await getPersons.call(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (persons) => emit(state.copyWith(persons: persons, isLoading: false)),
    );
  }
}
