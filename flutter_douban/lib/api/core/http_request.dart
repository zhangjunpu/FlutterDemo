import 'package:dio/dio.dart';

import 'http_config.dart';

/// 网络请求库
/// [author] junpu
/// [date] 2020/9/15
class HttpApi {
  /// 全局基础配置
  static final _baseOptions = BaseOptions(
    baseUrl: HttpConfig.BASE_URL,
    connectTimeout: Duration(milliseconds: HttpConfig.TIMEOUT_MILLS),
    sendTimeout: Duration(microseconds: HttpConfig.TIMEOUT_MILLS),
    receiveTimeout: Duration(microseconds: HttpConfig.TIMEOUT_MILLS),
  );
  static final _dio = Dio(_baseOptions);
  static final _baseInterceptor = InterceptorsWrapper(
    onRequest: (options, handler) {
      handler.next(options);
    },
  );
  static final _logInterceptor = LogInterceptor(
    requestBody: true,
    responseBody: true,
  );

  /// 网络请求
  static Future<T?> request<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    // 1. 添加单独的配置
    var option = Options(method: method);

    // 2. 添加全局拦截器
    _dio.interceptors.clear();
    _dio.interceptors.add(_baseInterceptor);
    if (interceptor != null) _dio.interceptors.add(interceptor);
    _dio.interceptors.add(_logInterceptor);

    // 3. 发送网络请求
    try {
      var response = await _dio.request<T>(
        path,
        options: option,
        data: data,
        queryParameters: params,
      );
      return response.data;
    } on DioException catch (e) {
      return Future.error(e);
    }
  }

  /// get 请求
  static Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) {
    return request(path, params: params, interceptor: interceptor);
  }

  /// post 请求
  static Future<T?> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Interceptor? interceptor,
  }) {
    return request(path, method: "POST", data: data, interceptor: interceptor);
  }
}
