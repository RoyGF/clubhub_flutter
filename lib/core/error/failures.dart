abstract class Failure {
  late String errorMessage;
}

class AppFailure implements Failure {
  @override
  String errorMessage;

  AppFailure({required this.errorMessage});
}
