import 'package:backend/model/currency_models.dart';
import 'package:dio/dio.dart';

class CurrencyService {
  static Future<dynamic> getCurrency() async {
    try {
      Response response = await Dio().get("http://192.168.42.35:3000/");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => Model.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.hashCode.toString();
    }
  }
}
