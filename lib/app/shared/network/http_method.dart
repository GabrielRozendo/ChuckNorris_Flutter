import '../../helpers/extensions/enum_extension.dart';

class HttpMethod extends Enum<String> {
  const HttpMethod(String value) : super(value);

  static const HttpMethod GET = const HttpMethod('GET');
  static const HttpMethod POST = const HttpMethod('POST');
  static const HttpMethod PUT = const HttpMethod('PUT');
  static const HttpMethod DELETE = const HttpMethod('DELETE');
}
