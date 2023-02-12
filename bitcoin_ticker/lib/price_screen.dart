import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'USD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        alignment: Alignment.center,
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: Colors.lightBlue,
      menuMaxHeight: 240.0,
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData(selectedCurrency!);
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        getData(currenciesList[selectedIndex]);
        selectedCurrency = currenciesList[selectedIndex];
      },
      children: pickerItems,
    );
  }

  String BTCValue = '?';
  String ETHValue = '?';
  String LTCValue = '?';

  void getData(String quote) async {
    try {
      double data_0 = await CoinData().getCoinData(quote, cryptoList[0]);
      double data_1 = await CoinData().getCoinData(quote, cryptoList[1]);
      double data_2 = await CoinData().getCoinData(quote, cryptoList[2]);
      setState(() {
        BTCValue = data_0.toStringAsFixed(0);
        ETHValue = data_1.toStringAsFixed(0);
        LTCValue = data_2.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData(selectedCurrency!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CoinCard(
                  coin: cryptoList[0],
                  bitcoinValueInUSD: BTCValue,
                  selectedCurrency: selectedCurrency),
              CoinCard(
                  coin: cryptoList[1],
                  bitcoinValueInUSD: ETHValue,
                  selectedCurrency: selectedCurrency),
              CoinCard(
                  coin: cryptoList[2],
                  bitcoinValueInUSD: LTCValue,
                  selectedCurrency: selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.bitcoinValueInUSD,
    required this.selectedCurrency,
    required this.coin,
  });

  final String bitcoinValueInUSD;
  final String? selectedCurrency;
  final String coin;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 $coin = $bitcoinValueInUSD $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
