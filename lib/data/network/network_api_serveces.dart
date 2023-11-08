import 'dart:convert';
import 'dart:io';

import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on RequestTimeOutExceptions {
      throw RequestTimeOutExceptions();
    }
    return jsonResponse;
  }

  @override
  Future getPostApiResponse(String url, var data) async{
   dynamic jsonResponse;
    try {
      final response =
          await http.post(Uri.parse(url), 
          body: jsonEncode(data)
          ).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on RequestTimeOutExceptions {
      throw RequestTimeOutExceptions();
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
       case 400:
        throw BadRequestExceptions(response.body.toString());
      case 404:
        throw UnAuthorizedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error Occured While Communicating with Server with Status Code${response.statusCode}');
    }
  }
}
