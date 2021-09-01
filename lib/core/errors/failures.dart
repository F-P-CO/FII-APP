import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Failure extends Equatable {
  final String? message;
  final Exception? exception;

  Failure({
    this.message,
    this.exception,
  }) {
    if (kDebugMode && !Platform.environment.containsKey('FLUTTER_TEST')) {
      String printMessage = '''
A failure has occured.
Failure exception: $exception''';

      if (message != null) {
        printMessage += '\nFailure message: $message';
      }

      // ignore: avoid_print
      print(printMessage);
    }
  }

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({
    String? message,
    Exception? exception,
  }) : super(message: message, exception: exception);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({
    String? message,
    Exception? exception,
  }) : super(message: message, exception: exception);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({
    String? message,
    Exception? exception,
  }) : super(message: message, exception: exception);
}
