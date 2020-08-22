import 'package:http/http.dart';
import '../../../constants/app_strings.dart';

import 'network_mappers.dart';

class ErrorResponse implements ErrorMapable, BaseMapable {
  @override
  Response response;

  @override
  String code;

  @override
  String message;

  @override
  String name;

  @override
  String status;

  @override
  ErrorResponse fromJson(Map<String, dynamic> json) {
    this.code = json['code'];
    this.name = json['name'];
    this.message = json['message'];
    this.status = json['status'];

    return this;
  }

  ErrorResponse genericError({String message = 'Generic Error'}) {
    this.name = AppStrings.genericError;
    this.message = message;
    return this;
  }
}
