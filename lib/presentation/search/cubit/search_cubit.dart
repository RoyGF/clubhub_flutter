import 'package:clubhub/core/analytics/app_tracking.dart';
import 'package:clubhub/core/analytics/event_names.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/domain/search_persons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchPersons}) : super(const SearchState());

  final SearchPersons searchPersons;

  Future<void> search(String query) async {
    AppTracking.trackEvent(
        eventName: EventNames.searchBar, parameters: {"query": query});
    emit(state.copyWith(isLoading: true));

    SearchPersonsParams params = SearchPersonsParams(query: query);

    final result = await searchPersons.call(params);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.errorMessage,
        ));
      },
      (persons) {
        emit(state.copyWith(
          isLoading: false,
          persons: persons,
        ));
      },
    );
  }
}
