import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/services/api_exceptions.dart';
import 'package:hop_pos/src/common/services/auth_token.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) {
  return ApiService(
    goRouter: ref.watch(goRouterProvider),
  );
}

class ApiService {
  static const int timeOutInSeconds = 30;
  final GoRouter goRouter;

  ApiService({
    required this.goRouter,
  });

  Future<Map<String, String>> _getHeaders() async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    String? token = await AuthToken.getAuthToken();
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }

    return header;
  }

  Future<void> _checkInternetConnection() async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    if (!hasInternet) {
      throw const NoInternetError('No internet connection.');
    }
  }

  Future<ApiResponse?> getFromUrl(String url) async {
    try {
      final hasInternet = await InternetConnectionChecker().hasConnection;
      if (!hasInternet) {
        return null;
      }

      final Response response = await Dio().get(url).timeout(const Duration(seconds: timeOutInSeconds));
      return ApiResponse(
        response: response,
        supressError: true,
      );
    } catch (e, stackTrace) {
      ApiExceptions.handle(e, stackTrace, goRouter);
      rethrow;
    }
  }

  Future<ApiResponse?> get(ApiRequest request) async {
    try {
      await _checkInternetConnection();

      final Response response = await Dio()
          .get(
            request.getPath(),
            options: Options(
              headers: await _getHeaders(),
            ),
          )
          .timeout(const Duration(seconds: timeOutInSeconds));

      return ApiResponse(response: response, supressError: request.supressError);
    } catch (e, stackTrace) {
      if (request.supressError) {
        return null;
      }

      ApiExceptions.handle(e, stackTrace, goRouter);
      rethrow;
    }
  }

  Future<ApiResponse?> post(ApiRequest request) async {
    try {
      await _checkInternetConnection();

      Response response = await Dio()
          .post(
            request.getPath(),
            data: request.toJsonData(),
            options: Options(
              validateStatus: (status) {
                return status != null && status < 500;
              },
              headers: await _getHeaders(),
            ),
          )
          .timeout(const Duration(seconds: timeOutInSeconds));

      return ApiResponse(response: response, supressError: request.supressError);
    } catch (e, stackTrace) {
      if (request.supressError) {
        return null;
      }

      ApiExceptions.handle(e, stackTrace, goRouter);
      rethrow;
    }
  }
}
