import 'dart:convert';

import 'package:currency/controller/api/api.dart';
import 'package:currency/models/mock_data.dart';
import 'package:currency/models/price_model.dart';

class MockController {
  List<String> getCurrencies() {
    return MockData().getCurrencies();
  }

  API _api = API();

  Future<PriceData> getPriceData() async {
    var res = await _api.getPrice();
    return PriceData.fromJson(jsonDecode(res));
  }

  Future<PriceData> getPriceByCoin(String coinName) async {
    var res = await _api.getPriceByCoin(coinName);
    return PriceData.fromJson(jsonDecode(res));
  }
}
