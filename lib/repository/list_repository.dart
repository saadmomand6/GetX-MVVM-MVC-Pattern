import 'package:getx_mvvm/data/network/network_api_serveces.dart';

import '../models/list_model.dart';
import '../resources/urls/app_urls.dart';

class ListRepository {
  final apiservice = NetworkApiServices();

   Future<ListModel> listApi() async {
    try {
      dynamic response =
          await apiservice.getGetApiResponse(AppUrls.getlisturl);
      return ListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
