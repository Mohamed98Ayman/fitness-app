import 'package:dio/dio.dart';
import 'package:fitness_app/network/domain/enums/request_method.enum.dart';

typedef BearerToken = String;

class EndpointSignature {
  final String? baseUrl;
  final BearerToken? bearer;
  final Map<String, String>? requestHeaders;
  final HttpRequestMethod requestMethod;
  final String path;
  final Map<String, dynamic>? queryParameters;
  final Object? body;
  final dynamic Function(dynamic)? responseBuilder;
  final Exception Function(Response response)? errorHandler;
  final Duration timeoutDuration;

  EndpointSignature({
    this.baseUrl,
    required this.requestMethod,
    required this.path,
    this.responseBuilder,
    this.errorHandler,
    this.body,
    this.queryParameters,
    this.requestHeaders,
    Duration? timeoutDuration,
    this.bearer,
  }) : timeoutDuration = Duration(seconds: 20);

  @override
  int get hashCode => Object.hash(
    baseUrl,
    requestMethod,
    path,
    body.toString(),
    bearer,
    requestHeaders?.toString(),
    queryParameters?.toString(),

    timeoutDuration.inSeconds,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is EndpointSignature && hashCode == other.hashCode;
  }
}
