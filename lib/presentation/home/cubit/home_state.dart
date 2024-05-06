part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.persons = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  final List<Person> persons;
  final bool isLoading;
  final String? errorMessage;

  HomeState copyWith({
    List<Person>? persons,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      persons: persons ?? this.persons,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        persons,
        isLoading,
        errorMessage,
      ];
}
