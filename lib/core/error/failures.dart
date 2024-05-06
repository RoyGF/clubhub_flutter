import 'package:equatable/equatable.dart';

class AppFailure extends Equatable {
  const AppFailure({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
