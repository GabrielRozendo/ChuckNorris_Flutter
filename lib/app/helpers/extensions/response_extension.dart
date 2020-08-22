import 'package:http/http.dart';

extension ResponseExtension on Response {
  String description(Duration duration) =>
      '${duration.toString()}\t${this.request.toString()} - ${this.statusCode} ${this.reasonPhrase}';
}
