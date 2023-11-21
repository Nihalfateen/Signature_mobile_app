import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network_logger/network_logger.dart';
import 'package:tawqee3_mobile_app/core/extensions/response_methods.dart';


import '../../common/model/failure_model.dart';
import '../../fileExport.dart';
import '../config/dio_options.dart';

class DioServices {
  Dio dio = Dio();

  Future<dynamic> getRequest(String apiUrl,
      {Map<String, dynamic>? parms, bool? responseByts}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      dio.interceptors.add(DioNetworkLogger());
      Response response = parms == null
          ? await dio.get(apiUrl,
              options: Options(
                  responseType:
                      responseByts == true ? ResponseType.bytes : null))
          : await dio.get(apiUrl,
              queryParameters: parms,
              options: Options(
                  responseType:
                      responseByts == true ? ResponseType.bytes : null));

      if (kDebugMode) {
        Logger().w("${dio.options.baseUrl}${apiUrl}\n\\"
            "Parms ${parms}"
            "Response ||| ${response.requestOptions.method} ||| Status:${response.statusCode}  ${response.statusMessage}\n\n"
            "Headers \n\n ${dio.options.headers}\n\n"
            "Response Body ${response.requestOptions.responseType.name}"
            "Response Body ${response.data}");
      }
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
            message: e.handleDioException(e.type), state: 0, data: "data");
      }
      throw Exception(e);
    }
  }

  /*
   * Post Request Function
   */
  Future<dynamic> postRequest(Map<String, dynamic> body, String apiUrl,
      {bool hasImages = false}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      dio.interceptors.add(DioNetworkLogger());
      Response response = await dio.post(apiUrl,
          data: hasImages == true ? FormData.fromMap(body) : body);
      if (kDebugMode) {
        Logger(printer: PrettyPrinter(), output: ConsoleOutput()).w(
            "${dio.options.baseUrl}${apiUrl}\n\\"
            "${body}\n\n"
            "Response ||| ${response.requestOptions.method} ||| Status:${response.statusCode}  ${response.statusMessage}\n\n"
            "Headers \n\n ${dio.options.headers}\n\n"
            "Response Body ${response.data}");
      }
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
            message: e.handleDioException(e.type), state: 0, data: "data");
      }
      throw Exception(e);
    }
  }

  /*
   * Post Request Function
   */
  Future<dynamic> putRequest(Map<String, dynamic> body, String apiUrl,
      {bool enableToken = false}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      dio.interceptors.add(DioNetworkLogger());

      Response response = await dio.put(apiUrl, data: body);
      if (kDebugMode) {
        Logger(printer: PrettyPrinter(), output: ConsoleOutput()).w(
            "${dio.options.baseUrl}${apiUrl}\n\\"
            "${body}\n\n"
            "Response ||| ${response.requestOptions.method} ||| Status:${response.statusCode}  ${response.statusMessage}\n\n"
            "Headers \n\n ${dio.options.headers}\n\n"
            "Response Body ${response.data}");
      }
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
            message: e.handleDioException(e.type), state: 0, data: "data");
      }
      throw Exception(e);
    }

  }

  Future<dynamic> patchRequest(Map<String, dynamic> body, String apiUrl,
      {bool enableToken = false}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      dio.interceptors.add(DioNetworkLogger());
      Response response = await dio.patch(apiUrl, data: body);
      if (kDebugMode) {
        Logger(printer: PrettyPrinter(), output: ConsoleOutput()).w(
            "${dio.options.baseUrl}${apiUrl}\n\\"
            "${body}\n\n"
            "Response ||| ${response.requestOptions.method} ||| Status:${response.statusCode}  ${response.statusMessage}\n\n"
            "Headers \n\n ${dio.options.headers}\n\n"
            "Response Body ${response.data}");
      }
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
            message: e.handleDioException(e.type), state: 0, data: "data");
      }
      throw Exception(e);
    }
  }

  /*
   * Delete Request Function
   */
  Future<dynamic> deleteRequest(String apiUrl) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      dio.interceptors.add(DioNetworkLogger());
      Response response = await dio.delete(apiUrl);
      if (kDebugMode) {
        Logger().w("${dio.options.baseUrl}${apiUrl}\n\\"
            "Response ||| ${response.requestOptions.method} ||| Status:${response.statusCode}  ${response.statusMessage}\n\n"
            "Headers \n\n ${dio.options.headers}\n\n"
            "Response Body ${response.data}");
      }
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
            message: e.handleDioException(e.type), state: 0, data: "data");
      }
      throw Exception(e);
    }
  }

  // Future download2(Dio dio, String url, String savePath) async {
  //   try {
  //     Response response = await dio.get(
  //       url,
  //       onReceiveProgress: showDownloadProgress,
  //       //Received data with List<int>
  //       options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status < 500;
  //           }),
  //     );
  //     print(response.headers);
  //     File file = File(savePath);
  //     var raf = file.openSync(mode: FileMode.write);
  //     // response.data is List<int> type
  //     raf.writeFromSync(response.data);
  //     await raf.close();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
  Future<dynamic> postRequestWithHeaders(String token,) async {
    try {
      dio.options =BaseOptions(
          baseUrl: "https://tawqeea.com/",
          headers: {
            "Accept": "application/json",
            "Authorization": "Basic ${token} "

          }) ;
      Response response = await dio.post("api/v1/sessions",);
      if (kDebugMode) {
        Logger(printer: PrettyPrinter(), output: ConsoleOutput()).w(


            "Response ||| ${response.requestOptions.method} ||| Status:${response.statusCode}  ${response.statusMessage}\n\n"
                "Headers \n\n ${dio.options.headers}\n\n"
                "Response Body ${response.data}");
      }
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
            message: e.handleDioException(e.type), state: 0, data: "data");
      }
      throw Exception(e);
    }
  }
}
