

import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/resources/app_Url/app_urls.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data ) async {
    dynamic response = await _apiServices.postApi(data, AppUrls.loginApi);
    return response;
  }

}