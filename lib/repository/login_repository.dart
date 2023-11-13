import 'package:getx_mvvm/data/network/network_api_serveces.dart';

import '../resources/urls/app_urls.dart';

class LoginRepository {
  final apiservice = NetworkApiServices();

   Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiservice.getPostApiResponse(AppUrls.loginurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
