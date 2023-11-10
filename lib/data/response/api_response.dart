import 'package:mvvm/data/response/status.dart';

//pass generic class with dynamic data
class ApiResponse<T> {
// initialize with status
  Status? status;
  //dynamic data
  T? data;
  String? message;
  //constructor building
  ApiResponse(this.status, this.message, this.data);
// Api loading
  ApiResponse.loading() : status = Status.LOADING;
// api completed to us ma app ka data ay ga
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
//api response error to message ay ga Error k liye
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
