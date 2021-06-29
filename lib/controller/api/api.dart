import 'package:currency/constant/api.dart';
import 'package:http/http.dart' as http;

class API {
  Uri _uri = Uri.parse(
      "https://rest.coinapi.io/v1/exchangerate/USD/BDT?apikey=780FED75-3494-41DD-8CB3-71D24CC7DA7F");
  Future<String> getPrice() async {
    var response = await http.get(_uri);
    return response.body;
  }

  Future<String> getPriceByCoin(String coinName) async {
    String apiString =
        "${ApiConstant.GET_EXCHANGERATE}USD/${coinName}?apikey=${ApiConstant.API_KEY}";
    Uri _uri = Uri.parse(apiString);
    var response = await http.get(_uri);
    return response.body;
  }
}
