part of 'search_cubit.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final List<Person> persons;

  const SearchState({
    this.isLoading = false,
    this.persons = const [],
  });

  SearchState copyWith({
    bool? isLoading,
    List<Person>? persons,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      persons: persons ?? this.persons,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        persons,
      ];
}
