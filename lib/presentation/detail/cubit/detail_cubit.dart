import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/domain/get_person_by_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit({required this.getPersonByid}) : super(const DetailState());

  final GetPersonById getPersonByid;

  Future<void> init(String id) async {
    emit(state.copyWith(isLoading: true));

    GetPersonByIdParams params = GetPersonByIdParams(id: id);

    final result = await getPersonByid.call(params);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false));
      },
      (person) {
        emit(
          state.copyWith(
            isLoading: false,
            person: person,
          ),
        );
      },
    );
  }
}
