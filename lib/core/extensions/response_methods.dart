import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import '../../common/model/failure_model.dart';
import '../services/preference_services.dart';

extension ResponseHandler on Response {
  dynamic handleResponse() async {
    if (statusCode == 500 ) {
      throw FailureModel(message:"Internal Server Error",state:statusCode,data: "data" );
    }else if (statusCode == 404 && statusMessage == "Not Found") {
      return {};
    }
    else if (statusCode! >201) {
      throw FailureModel(message:data,state:statusCode,data: data );
    }
    else {
      return data;
    }
  }
}

extension DioExceptionHandler on DioException {
  String handleDioException(DioExceptionType dioExceptionType)  {
    switch (dioExceptionType) {
      case DioExceptionType.connectionTimeout:
        return "error";
      case DioExceptionType.sendTimeout:
        return "error";
      case DioExceptionType.receiveTimeout:
        return "error";
      case DioExceptionType.badCertificate:
        return "error";
      case DioExceptionType.badResponse:
        return "${response?.statusMessage}";
      case DioExceptionType.cancel:
        return "error";
      case DioExceptionType.connectionError:
        return "error";
      case DioExceptionType.unknown:
        return "error";

    }

  }
}
