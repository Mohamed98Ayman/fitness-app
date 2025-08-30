import 'package:dio/dio.dart';
import 'package:fitness_app/network/domain/enums/network_protocol_type.enum.dart';
import 'package:fitness_app/network/domain/enums/request_method.enum.dart';
import 'package:fitness_app/network/domain/models/http_file.model.dart';

typedef BearerToken = String;

class EndpointSignature {
  final String? baseUrl;
  final BearerToken? bearer;
  final NetworkProtocolType protocol;
  final Map<String, String>? requestHeaders;
  final HttpRequestMethod requestMethod;
  final String path;
  final Map<String, dynamic>? queryParameters;
  final Object? body;
  final HttpFile? file;
  final dynamic Function(dynamic)? responseBuilder;
  final Exception Function(Response response)? errorHandler;
  final Duration timeoutDuration;

  EndpointSignature({
    this.baseUrl,
    required this.requestMethod,
    required this.path,
    this.protocol = NetworkProtocolType.https,
    this.responseBuilder,
    this.errorHandler,
    this.body,
    this.queryParameters,
    this.file,
    this.requestHeaders,
    Duration? timeoutDuration,
    this.bearer,
  }) : timeoutDuration = Duration(seconds: 20);

  @override
  int get hashCode => Object.hash(
    baseUrl,
    requestMethod,
    protocol,
    path,
    body.toString(),
    bearer,
    requestHeaders?.toString(),
    queryParameters?.toString(),
    file?.hashCode,
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
