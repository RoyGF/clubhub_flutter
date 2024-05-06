part of 'search_cubit.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final List<Person> persons;
  final String? errorMessage;

  const SearchState({
    this.isLoading = false,
    this.persons = const [],
    this.errorMessage,
  });

  SearchState copyWith({
    bool? isLoading,
    List<Person>? persons,
    String? errorMessage,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      persons: persons ?? this.persons,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        persons,
        errorMessage,
      ];
}
