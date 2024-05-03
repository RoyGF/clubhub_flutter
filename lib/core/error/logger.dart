class Logger {
  static void logError({required String errorMessage, StackTrace? stackTrace}) {
    // Analytics Tool like Sentry can be implemented here in order to catch all errors in Sentry
    logError(errorMessage: errorMessage, stackTrace: stackTrace);
  }
}
