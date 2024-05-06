import 'package:flutter/foundation.dart';

class AppTracking {
  static void logError({required String errorMessage, StackTrace? stackTrace}) {
    // Analytics Tool like Sentry can be implemented here in order to catch all errors in Sentry
    logError(errorMessage: errorMessage, stackTrace: stackTrace);
  }

  static void trackEvent(
      {required String eventName, Map<String, dynamic>? parameters}) {
    // Analytics Tool like Amplitude can be implemented here in order to track all events in Firebase
    debugPrint("Event: $eventName, Parameters: $parameters");
  }
}
