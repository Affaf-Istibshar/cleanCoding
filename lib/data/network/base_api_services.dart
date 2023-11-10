abstract class BaseAppServices{
  //abstract class k functions extend ho jaty hain override ho kr
  //Function future as per dynamic data
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(dynamic data, String url);
}