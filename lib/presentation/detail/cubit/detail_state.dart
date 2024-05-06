part of 'detail_cubit.dart';

class DetailState extends Equatable {
  const DetailState({
    this.isLoading = false,
    this.person,
    this.errorMessage,
  });

  final bool isLoading;
  final Person? person;
  final String? errorMessage;

  DetailState copyWith({
    bool? isLoading,
    Person? person,
    String? errorMessage,
  }) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      person: person ?? this.person,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        person,
        errorMessage,
      ];
}
