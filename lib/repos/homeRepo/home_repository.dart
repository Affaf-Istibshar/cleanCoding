



import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/models/home/UserListModel.dart';
import 'package:mvvm/resources/app_Url/app_urls.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiServices.getApi(AppUrls.user_list);
    return UserListModel.fromJson(response);
  }

}