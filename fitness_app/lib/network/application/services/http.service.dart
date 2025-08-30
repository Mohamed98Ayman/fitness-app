import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitness_app/network/domain/enums/network_protocol_type.enum.dart';
import 'package:fitness_app/network/domain/models/endpoint_signature.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpClientService {
  static const HttpClientService _instance = HttpClientService._();
  factory HttpClientService() => _instance;
  const HttpClientService._();

  static late Dio _client;
  static late String baseUrl;
  static const String endpointSignatureKey = 'endpointSignature';

  static Future<void> init(String baseUrl) async {
    HttpClientService.baseUrl = baseUrl;

    _client = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        validateStatus:
            (status) => status != null && status >= 200 && status < 300,
        followRedirects: true,

        maxRedirects: 5,
        headers: {
          'x-rapidapi-key': dotenv.env['X_RAPID_API_KEY'],
          'content-security-policy':
              "default-src 'self';base-uri 'self';font-src 'self' https: data:;form-action 'self';frame-ancestors 'self';img-src 'self' data:;object-src 'none';script-src 'self';script-src-attr 'none';style-src 'self' https: 'unsafe-inline';upgrade-insecure-requests",
          'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
        },
      ),
    );
  }

  static Future<dynamic> sendRequest(
    EndpointSignature endpointSignature,
  ) async {
    final uri = Uri.parse(
      '${endpointSignature.baseUrl ?? baseUrl}${endpointSignature.path}',
    ).replace(queryParameters: endpointSignature.queryParameters);

    try {
      Response<dynamic> response;

      response = await _executeStandardRequest(endpointSignature, uri);

      switch (endpointSignature.protocol) {
        case NetworkProtocolType.multiPartHttps:
        case NetworkProtocolType.multiPartHttp:
          response = await _executeMultipartRequest(endpointSignature, uri);
          break;
        case NetworkProtocolType.https:
        case NetworkProtocolType.http:
        case NetworkProtocolType.sse:
          response = await _executeStandardRequest(endpointSignature, uri);
          break;
      }

      final processedResponse = await _processResponse(
        endpointSignature,
        response,
      );

      return processedResponse;
    } on DioException catch (e) {
      if (e.error is Exception) {
        throw e.error as Exception;
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response<dynamic>> _executeStandardRequest(
    EndpointSignature endpointSignature,
    Uri uri,
  ) async {
    return _client.request(
      uri.toString(),
      data: _prepareRequestData(endpointSignature),
      options: Options(
        method: endpointSignature.requestMethod.name,
        extra: {endpointSignatureKey: endpointSignature},
        headers: endpointSignature.requestHeaders,
        sendTimeout: endpointSignature.timeoutDuration,
        receiveTimeout: endpointSignature.timeoutDuration,
      ),
    );
  }

  static dynamic _prepareRequestData(EndpointSignature endpointSignature) {
    if (endpointSignature.body == null) return null;
    if (endpointSignature.body is String) {
      return endpointSignature.body;
    } else if (endpointSignature.body is Map ||
        endpointSignature.body is List) {
      try {
        return jsonEncode(endpointSignature.body);
      } catch (e) {
        return endpointSignature.body.toString();
      }
    } else {
      return endpointSignature.body.toString();
    }
  }

  static Future<dynamic> _processResponse(
    EndpointSignature endpointSignature,
    Response<dynamic> response,
  ) async {
    if (response.data == null) {
      return '';
    }

    final responseString = response.data.toString();

    if (responseString.isEmpty) {
      return '';
    }

    if (endpointSignature.responseBuilder == null) {
      return responseString;
    }

    dynamic processedResponse;
    try {
      processedResponse =
          response.data is String ? json.decode(response.data) : response.data;
    } catch (e) {
      processedResponse = responseString;
    }

    if (processedResponse is String) {
      return processedResponse;
    }

    if (endpointSignature.responseBuilder != null) {
      final result = await compute(
        endpointSignature.responseBuilder!,
        processedResponse,
      );
      return result;
    } else {
      return processedResponse;
    }
  }

  static Future<Response<dynamic>> _executeMultipartRequest(
    EndpointSignature endpointSignature,
    Uri uri,
  ) async {
    FormData formData = FormData();

    if (endpointSignature.body != null &&
        endpointSignature.body is Map<String, String>) {
      final fields = endpointSignature.body as Map<String, String>;
      for (final entry in fields.entries) {
        if (entry.key.isNotEmpty) {
          formData.fields.add(MapEntry(entry.key, entry.value));
        }
      }
    }

    if (endpointSignature.file != null) {
      final file = endpointSignature.file!;
      try {
        formData.files.add(
          MapEntry(
            file.field,
            await MultipartFile.fromFile(
              file.file.path,
              filename: file.file.uri.pathSegments.last,
            ),
          ),
        );
      } catch (e) {
        throw Exception();
      }
    }

    return _client.request(
      uri.toString(),
      data: formData,
      options: Options(
        method: endpointSignature.requestMethod.name,
        extra: {endpointSignatureKey: endpointSignature},
        headers: endpointSignature.requestHeaders,
        sendTimeout: endpointSignature.timeoutDuration,
        receiveTimeout: endpointSignature.timeoutDuration,
      ),
    );
  }
}
