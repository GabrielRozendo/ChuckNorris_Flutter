import 'package:http/http.dart';

extension ResponseExtension on Response {
  String description(Duration duration) {
    final prefix = '${duration.toString()}\t${this.request.toString()}';
    final sufix = '- ${this.statusCode} ${this.reasonPhrase}';
    return '$prefix $sufix';
  }
}
