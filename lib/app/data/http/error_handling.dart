import 'dart:io';

import 'package:dio/dio.dart';

import '../../../generated/translations.g.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'The request to the api server was canceled.';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout relative to API server';
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet';
        break;
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          message = 'No internet';
          break;
        }
        message = 'Unexpected error occurred';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
  }
  final textError = 'Error ';

  late String message;

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad Requestxxx';
      case 401:
        return 'Not Authorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['Message'] ??
            texts.messages.somethingWentWrongContactAdministrator;
      case 409:
        return error['Message'] ??
            texts.messages.somethingWentWrongContactAdministrator;
      case 500:
        return error['Message'] ??
            texts.messages.somethingWentWrongContactAdministrator;
      case 502:
        return 'Bad Gateway';
      default:
        return texts.messages.somethingWentWrongContactAdministrator;
    }
  }

  @override
  String toString() => message;
}
