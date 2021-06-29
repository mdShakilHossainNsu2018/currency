import 'package:currency/controller/mock_controller.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  MockController _mockController;
  List<DropdownMenuItem<String>> _currencyList;

  String selectedCurrency;

  @override
  void initState() {
    super.initState();
    _mockController = MockController();
    _currencyList = [];
    _getCurrencyList();
  }
  

  void _getCurrencyList(){

    //by using foreach loop
    for(String currency in _mockController.getCurrencies()){
      var newItem = DropdownMenuItem(
          child: Text(currency),
        value: currency,
      );
      _currencyList.add(newItem);
    }

//by using map
    /*_currencyList = _mockController.getCurrencies().map((String value){
      return DropdownMenuItem<String>(
        value : value,
        child:Text(value)
      );
    }).toList();*/
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 USD = ? BDT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 90.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              hint: Center(
                child: Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              isExpanded: false,
              value: selectedCurrency,
              onChanged: (value){
                setState(() {
                  selectedCurrency = value;
                });
              },
              items: _currencyList,

            ),
          ),
        ],
      ),
    );
  }
}
