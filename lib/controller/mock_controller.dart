import 'package:currency/models/mock_data.dart';

class MockController {
  List<String> getCurrencies (){
    return MockData().getCurrencies();
  }
}