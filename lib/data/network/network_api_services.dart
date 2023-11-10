
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiServices extends BaseAppServices{
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
  dynamic responseJson ;
    try{

    final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds:  10));
     responseJson = returnResponse(response);
  }
     on SocketException{
         throw InternetExceptions('');
      }
      on RequestExceptions{
    throw RequestExceptions('');
      }
return responseJson;
  }
  @override
  Future<dynamic> postApi(var data, String url)async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson ;
    try{
      final response = await http.post(Uri.parse(url), body: 
     data
      ).
      timeout(const Duration(seconds:  10));
      responseJson = returnResponse(response);
    }
    on SocketException{
      throw InternetExceptions('');
    }
    on RequestExceptions{
      throw RequestExceptions('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch(response.statusCode) {

      case 200:
        dynamic responseJson = jsonDecode(response.body);
    return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      //  throw InvalidUrl('');
      default :
            throw FetchDataException('${response.statusCode}');
    }
    }
}
//403 for invalid tokens