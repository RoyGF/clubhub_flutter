part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.persons = const [],
    this.isLoading = false,
  });

  final List<Person> persons;
  final bool isLoading;

  HomeState copyWith({
    List<Person>? persons,
    bool? isLoading,
  }) {
    return HomeState(
      persons: persons ?? this.persons,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        persons,
        isLoading,
      ];
}
