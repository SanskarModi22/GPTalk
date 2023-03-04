import 'dart:convert';

import 'package:dio/dio.dart';

class ApiError {
  final int? code;
  final String? message;
  final String? cause;

  ApiError({required this.code, required this.message, required this.cause});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
        code: json['code'] as int?,
        message: json['message'] as String?,
        cause: json['cause'] as String?);
  }

  @override
  toString() {
    return 'code: $code, message: $message, cause: $cause';
  }
}

class ApiException implements Exception {
  final String message;
  final Response response;
  final ApiError error;

  ApiException(
      {required this.message, required this.response, required this.error});

  @override
  toString() {
    return 'message: $message, error: "$error"';
  }
}

getParsedResponseError(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<String, dynamic>();
  return ApiError.fromJson(parsed['error']);
}

// final dio = Dio();

// class Api {
//   static Future<dynamic> get(String url) async {
//     try {
//       final response = await dio.get(url);
//       return response.data;
//     } on DioError catch (e) {
//       throw ApiException(
//         message: e.message,
//         response: e.response!,
//         error: getParsedResponseError(e.response!.data),
//       );
//     }
//   }

//   static Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
//     try {
//       final response = await dio.post(url, data: data);
//       return response.data;
//     } on DioError catch (e) {
//       throw ApiException(
//         message: e.message,
//         response: e.response!,
//         error: getParsedResponseError(e.response!.data),
//       );
//     }
//   }
// }
