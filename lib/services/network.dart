// Import required packages
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Import custom classes
import '../global/globals.dart';
import '../utils/api_exception.dart';

// Define a class for handling network requests
class Network {
  // Define the base URL for all requests
  static const String baseUrl = 'https://api.openai.com/v1';

  // Define common headers for all requests
  static Map<String, String> commonHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${Globals.openAiApiKey}'
  };

  // Define a Dio instance to use for all requests
  static final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  // Define a function to make a GET request
  static Future<Map<String, dynamic>> fetchRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    // Merge common headers with any custom headers
    final allHeaders = {...commonHeaders, ...?headers};

    // Print request details for debugging purposes
    _printRequest('GET URL: $url', allHeaders, null);

    try {
      // Send the GET request using the Dio instance
      final response = await _dio.get(
        url,
        options: Options(headers: allHeaders),
      );

      // Print response details for debugging purposes
      _printResponse(response.statusCode!, response.data.toString());

      // If the response is successful, return the response data
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data ?? {};
      } else {
        // If the response is not successful, throw an ApiException
        throw ApiException(
          message: 'Request failed with status code ${response.statusCode}',
          response: response,
          error: getParsedResponseError(response.data.toString()),
        );
      }
    } catch (e) {
      // Print error details for debugging purposes
      debugPrint('Error fetching URL: $url\n$e');
      rethrow; // Rethrow the error to the calling function
    }
  }

  // Define a function to make a POST request
  static Future<Map<String, dynamic>> postRequest({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    // Merge common headers with any custom headers
    final allHeaders = {...commonHeaders, ...?headers};

    // Print request details for debugging purposes
    _printRequest('POST URL: $url', allHeaders, body);

    try {
      // Send the POST request using the Dio instance
      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: allHeaders),
      );

      // Print response details for debugging purposes
      _printResponse(response.statusCode!, response.data.toString());

      // If the response is successful, return the response data
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data ?? {};
      } else {
        // If the response is not successful, throw an ApiException
        throw ApiException(
          message: 'Request failed with status code ${response.statusCode}',
          response: response,
          error: getParsedResponseError(response.data.toString()),
        );
      }
    } catch (e) {
      // Print error details for debugging purposes
      debugPrint('Error posting URL: $url\n$e');
      rethrow; // Rethrow the error to the calling function
    }
  }

  // Helper function to print request details
  static void _printRequest(
    String urlString,
    Map<String, String> headers,
    dynamic body,
  ) {
    debugPrint('---------');
    debugPrint(urlString);
    debugPrint(headers.toString());
    if (body != null) {
      debugPrint(body.toString());
    }
    debugPrint('---------');
  }

  // Helper function to print response details
  static void _printResponse(int statusCode, String body) {
    debugPrint('statusCode: $statusCode and body: $body');
  }
}
