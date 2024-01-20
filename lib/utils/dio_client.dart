import 'package:dio/dio.dart';
import 'package:stripe_todo_list/constants/api_keys.dart';

class DioClient {
  final Dio dio;

  const DioClient(this.dio);

  static Dio _initDio() => Dio(
        BaseOptions(
          baseUrl: ApiKeys.hostUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // if (jwt != null) ...{
            //   'Authorization': _auth,
            // },
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Response> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Response failed: ${response.data}");
      }
    } catch (error) {
      throw Exception("DioException: $error");
    }
  }

  Future<Response> post<T>(
    String url, {
    required Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Response failed: ${response.data}");
      }
    } catch (error) {
      throw Exception("DioException: $error");
    }
  }

  Future<Response> delete<T>(
    String url, {
    required Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.delete(url, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Response failed: ${response.data}");
      }
    } catch (error) {
      throw Exception("DioException: $error");
    }
  }

  Future<Response> put<T>(
    String url, {
    required Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.put(url, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Response failed: ${response.data}");
      }
    } catch (error) {
      throw Exception("DioException: $error");
    }
  }
}
