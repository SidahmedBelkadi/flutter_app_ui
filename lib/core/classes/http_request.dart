// import 'dart:async';
// import 'dart:convert';

// import 'package:course/core/classes/request_status.dart';
// import 'package:course/core/functions/check_intenet_connection.dart';
// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;

// class HttpRequest {
//   Future<Either<RequestStatus, Map>> post(
//       {required String endpoint, required Map data, String token = ''}) async {
//     try {
//       if (await checkInternetConnection()) {
//         final response = await http
//             .post(Uri.parse(endpoint), body: jsonEncode(data), headers: {
//               "accept": "application/json",
//               "Content-Type": "application/json",
//               "Authorization": "Bearer $token",
//             })
//             .timeout(const Duration(seconds: 10))
//             .catchError((error) {
//               // Handle TimeoutException
//               if (error is TimeoutException) {
//                 return http.Response(
//                   jsonEncode({"message": "Request timed out, pease try later"}),
//                   408, // HTTP Status Code for Request Timeout
//                 );
//               }
//               throw error;
//             });

//         Map responseBody = jsonDecode(response.body);
//         print("======== response : \n $responseBody");

//         if (response.statusCode >= 200 && response.statusCode < 300) {
//           return Right(responseBody);
//         } else if (response.statusCode >= 400 && response.statusCode < 500) {
//           return Right(responseBody);
//         } else if (response.statusCode >= 500 && response.statusCode < 600) {
//           return const Left(RequestStatus.serverFailure);
//         } else {
//           return const Left(RequestStatus.serverFailure);
//         }
//       } else {
//         return const Left(RequestStatus.offlineFailure);
//       }
//     } catch (e) {
//       print("================ Exception : \n $e");
//       // Our App code errors but we display it like server erros for the client
//       return const Left(RequestStatus.serverFailure);
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:course/core/classes/request_status.dart';
import 'package:course/core/functions/check_intenet_connection.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  Future<Either<RequestStatus, Map>> sendRequest({
    required String method,
    required String endpoint,
    required Map data,
    Map<String, String>? query,
    String token = '',
  }) async {
    try {
      if (await checkInternetConnection()) {
        Uri uri = query != null
            ? Uri.parse(endpoint).replace(queryParameters: query)
            : Uri.parse(endpoint);

        final response = await _sendHttpRequest(
          method: method,
          uri: uri,
          body: jsonEncode(data),
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ).timeout(const Duration(seconds: 10)).catchError((error) {
          // Handle TimeoutException
          if (error is TimeoutException) {
            return http.Response(
              jsonEncode({"message": "Request timed out, pease try later"}),
              408, // HTTP Status Code for Request Timeout
            );
          }
          throw error;
        });

        Map responseBody = jsonDecode(response.body);
        print("============== Response =============== \n $responseBody");

        if (response.statusCode >= 200 && response.statusCode < 300) {
          return Right(responseBody);
        } else if (response.statusCode >= 400 && response.statusCode < 500) {
          return Right(responseBody);
        } else if (response.statusCode >= 500 && response.statusCode < 600) {
          return const Left(RequestStatus.serverFailure);
        } else {
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        return const Left(RequestStatus.offlineFailure);
      }
    } catch (e) {
      print("================ Exception : \n $e");
      return const Left(RequestStatus.serverFailure);
    }
  }

  Future<http.Response> _sendHttpRequest({
    required method,
    required Uri uri,
    required Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    switch (method.toUpperCase()) {
      case 'GET':
        return await http.get(uri, headers: headers);
      case 'POST':
        return await http.post(uri,
            headers: headers, body: body, encoding: encoding);
      case 'PUT':
        return await http.put(uri,
            headers: headers, body: body, encoding: encoding);
      case 'DELETE':
        return await http.delete(uri, headers: headers);
      // Add more cases for other HTTP methods as needed
      default:
        throw ArgumentError('Unsupported HTTP method: $method');
    }
  }

  post({required String endpoint, required Map<String, String> data}) {}
}
