// import 'package:dio/dio.dart';
// import 'package:tplatfom/dio/dio_client.dart';
//
// class DioInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // 1. Add userId to private endpoints
//     // Suppose the path contains open is public
//     if (!options.path.contains('open')) {
//       options.queryParameters['userId'] = 'xxx';
//     }
//
//     // 2. Validate the user and append the token
//     // token can be obtained from shared preference
//     options.headers['token'] = 'xxx';
//
//     // 3. Request a refresh token
//     if (options.headers['refreshToken'] == null) {
//       DioClient.dio.lock();
//       Dio _tokenDio = Dio();
//       _tokenDio.get('/token').then((d) {
//         options.headers['refreshToken'] = d.data['data']['token'];
//         handler.next(options);
//       }).catchError((error, stackTrace) {
//         handler.reject(error, true);
//       }).whenComplete(() {
//         DioClient.dio.unlock();
//       }); // unlock the dio
//     } else {
//       options.headers['refreshToken'] = options.headers['refreshToken'];
//     }
//
//     // forward the request
//     return super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if (response.statusCode == 200) {
//     } else {}
//
//     if (response.requestOptions.baseUrl.contains('secret')) {}
//
//     // forward the response
//     return super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     switch (err.type) {
//       case DioErrorType.connectTimeout:
//         {}
//         break;
//       case DioErrorType.receiveTimeout:
//         {}
//         break;
//       case DioErrorType.sendTimeout:
//         {}
//         break;
//       case DioErrorType.cancel:
//         {}
//         break;
//       case DioErrorType.response:
//         {}
//         break;
//     }
//     super.onError(err, handler);
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
