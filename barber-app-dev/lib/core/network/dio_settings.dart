import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../data/local/token_storage.dart';

class AppDioClient {
  final TokenStorage tokenStorage;

  AppDioClient({required this.tokenStorage});

  Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) => status != null && status < 500 && status != 401,
    ));

    // Logger interceptor qo'shish
    dio.interceptors.add(TalkerDioLogger(

      settings: const TalkerDioLoggerSettings(
        enabled:kDebugMode,

        printErrorHeaders:kDebugMode,
        printRequestData:kDebugMode,
        printErrorData:kDebugMode,
        printErrorMessage:kDebugMode,
        printRequestHeaders:kDebugMode,
        printResponseData:kDebugMode,
        printResponseHeaders:kDebugMode,
        printResponseMessage:kDebugMode,
        printResponseRedirects:kDebugMode,

      ),
    ));

    // Auth token interceptor qo'shish
    dio.interceptors.add(AppInterceptors(dio, tokenStorage));

    return dio;
  }
}

class AppInterceptors extends QueuedInterceptorsWrapper {
  final Dio dio;
  final TokenStorage tokenStorage;

  AppInterceptors(this.dio, this.tokenStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = tokenStorage.getToken();
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      pPrint('Request: ${options.uri} token $token', 1);
      handler.next(options);
    } catch (error) {
      pPrint('Request interceptor error: $error', 4);
      handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          message: 'Error in request interceptor',
        ),
      );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // pPrint('Response: ${response.data}', 2);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    pPrint('onError: ${err.message}', 4);

    // Token muddati tugagan bo'lsa, yangilash logikasi
    if (_isTokenExpiredError(err)) {
      try {
        final updatedRequest = await _refreshTokenAndUpdateRequest(err.requestOptions);
        // Token yangilangandan so'ng, so'rovni qayta yuborish
        final response = await dio.fetch(updatedRequest);
        return handler.resolve(response);
      } catch (refreshError) {
        // Token yangilash muvaffaqiyatsiz bo'lsa, xatoni qaytarish
        pPrint('Token refresh failed: $refreshError', 4);
        return handler.next(err);
      }
    }

    // Boshqa xatoliklar uchun xatoni uzatish
    return handler.next(err);
  }

  /// Token muddati tugagan xatoni tekshirish
  bool _isTokenExpiredError(DioException err) {
    return err.response?.statusCode == 401;
  }

  /// Token yangilash va so'rovni yangilangan token bilan yangilash
  Future<RequestOptions> _refreshTokenAndUpdateRequest(RequestOptions requestOptions) async {
    // Bu yerda token yangilash logikasini qo'shing
    // Masalan:
    // final newToken = await authService.refreshToken();
    // await tokenStorage.saveToken(newToken);

    // Demo maqsadida, hozircha mavjud tokenni olish
    final token = tokenStorage.getToken();

    // So'rovni yangilangan token bilan yangilash
    final updatedRequestOptions = requestOptions;
    updatedRequestOptions.headers['Authorization'] = 'Bearer $token';

    return updatedRequestOptions;
  }
}

/*
class AppInterceptors extends QueuedInterceptorsWrapper {
  final Dio dio;
  final TokenStorage tokenStorage;

  AppInterceptors(this.dio, this.tokenStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenStorage.getToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    pPrint('Request: ${options.uri}', 1);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    pPrint('Response: ${response.data}', 2);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    pPrint('onError: ${err.message}', 4);
    handler.next(err);
  }
}*/
