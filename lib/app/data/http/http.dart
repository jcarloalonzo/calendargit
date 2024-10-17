import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../generated/translations.g.dart';
import '../../domain/either/either.dart';
import 'error_handling.dart';

class Http {
  Http(this._dio);
  final Dio _dio;
  Future<Either<String, R>> request<R>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> bodyRequest = const {},
    Map<String, dynamic>? formBodyRequest,
    required R Function(dynamic responseBody) onSuccess,
  }) async {
    Map<String, dynamic> logs = {};
    StackTrace? stackTrace;
    try {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            logs = {
              'urlpath': options.uri.toString(),
              'startTime': DateTime.now().toString(),
              'method': method.name.toUpperCase(),
              'headers': options.headers,
              'request': bodyRequest,
            };
            return handler.next(options);
          },
        ),
      );
      final response = await _dio.request(path,
          options: Options(
            method: method.name.toUpperCase(),
            headers: headers,
          ),
          queryParameters: queryParameters,
          data: formBodyRequest != null
              ? FormData.fromMap(formBodyRequest)
              : json.encode(bodyRequest));

      final body = json.encode(response.data);
      // log(body);
      // log(body);
      logs = {
        ...logs,
        'statusCode': response.statusCode,
        'responseBody': response.data,
        'IndicatorIcon': '✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅',
      };
      return Either.right(
        onSuccess(response.data),
      );
    } on DioException catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'errorBody': e.response?.data ?? {},
        'statusCode': e.response?.statusCode,
        'IndicatorIcon':
            '🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨',
        'exception': e.toString(),
      };
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Either.left(errorMessage);
    } catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'IndicatorIcon': '💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥',
        'exception': e.toString(),
      };
      // return Either.left(e.toString());
      return Either.left(texts.messages.somethingWentWrongContactAdministrator);
    } finally {
      if (kDebugMode) {
        logs = {
          ...logs,
          'endTime': DateTime.now().toString(),
        };
        if (true) {
          log(
            '''
-----------------------------------------------------------------
${(const JsonEncoder.withIndent(' ').convert(logs))}
-----------------------------------------------------------------
            ''',
            stackTrace: stackTrace,
          );
        }
      }
    }
  }



  Future<Either<String, R>> requestJsonEncode<R>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    String bodyRequest = '',
    Map<String, dynamic>? formBodyRequest,
    required R Function(dynamic responseBody) onSuccess,
  }) async {
    Map<String, dynamic> logs = {};
    StackTrace? stackTrace;
    try {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            logs = {
              'urlpath': options.uri.toString(),
              'startTime': DateTime.now().toString(),
              'method': method.name.toUpperCase(),
              'headers': options.headers,
              'request': bodyRequest,
            };
            return handler.next(options);
          },
        ),
      );
      final response = await _dio.request(path,
          options: Options(
            method: method.name.toUpperCase(),
            headers: headers,
          ),
          queryParameters: queryParameters,
          data: formBodyRequest != null
              ? FormData.fromMap(formBodyRequest)
              : bodyRequest);

      final body = json.encode(response.data);
      // log(body);
      // log(body);
      logs = {
        ...logs,
        'statusCode': response.statusCode,
        'responseBody': response.data,
        'IndicatorIcon': '✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅',
      };
      return Either.right(
        onSuccess(response.data),
      );
    } on DioException catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'errorBody': e.response?.data ?? {},
        'statusCode': e.response?.statusCode,
        'IndicatorIcon':
            '🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨',
        'exception': e.toString(),
      };
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Either.left(errorMessage);
    } catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'IndicatorIcon': '💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥',
        'exception': e.toString(),
      };
      // return Either.left(e.toString());
      return Either.left(texts.messages.somethingWentWrongContactAdministrator);
    } finally {
      if (kDebugMode) {
        logs = {
          ...logs,
          'endTime': DateTime.now().toString(),
        };
        if (true) {
          log(
            '''
-----------------------------------------------------------------
${(const JsonEncoder.withIndent(' ').convert(logs))}
-----------------------------------------------------------------
            ''',
            stackTrace: stackTrace,
          );
        }
      }
    }
  }
}

enum HttpMethod { get, post, patch, delete, put }
