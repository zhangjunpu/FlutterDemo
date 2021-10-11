import 'package:dio/dio.dart';

import 'http_config.dart';

/// 网络请求库
/// [author] junpu
/// [date] 2020/9/15
class HttpApi {
  /// 全局基础配置
  static final baseOptions = BaseOptions(
    baseUrl: HttpConfig.BASE_URL,
    connectTimeout: HttpConfig.TIME_OUT_MILLS,
    sendTimeout: HttpConfig.TIME_OUT_MILLS,
    receiveTimeout: HttpConfig.TIME_OUT_MILLS,
  );
  static final dio = Dio(baseOptions);

  /// 网络请求
  static Future<T> request<T>(
    String url, {
    String method = 'get',
    Map<String, dynamic> params,
    Interceptor interceptor,
  }) async {
    // 1. 添加单独的配置
    var options = Options(method: method);

    // 2. 添加全局拦截器
    var baseInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
    );
    List<Interceptor> inters = [baseInterceptor];
    if (interceptor != null) inters.add(interceptor);
    dio.interceptors.addAll(inters);

    // 3. 发送网络请求
    try {
      Response response = await dio.request<T>(
        url,
        data: params,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  /// get
  static Future<T> get<T>(
    String url, {
    Map<String, dynamic> params,
    Interceptor interceptor,
  }) {
    return request(url, params: params, interceptor: interceptor);
  }

  /// post
  static Future<T> post<T>(
    String url, {
    Map<String, dynamic> params,
    Interceptor interceptor,
  }) {
    return request(url,
        method: 'post', params: params, interceptor: interceptor);
  }
}
