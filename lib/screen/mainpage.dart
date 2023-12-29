import 'package:currency_converter_master/components/ConversionList.dart';
import 'package:currency_converter_master/components/ConvertedCurrency.dart';
import 'package:currency_converter_master/components/ExchangeRate.dart';
import 'package:currency_converter_master/components/ReusableCard.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Currency Converter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ReusableCard(cardChild: ConvertedCurrency()),
          SizedBox(
            height: 15,
          ),
          ReusableCard(cardChild: ExchangeRate()),
          SizedBox(
            height: 15,
          ),
          ReusableCard(cardChild: ConversionList()),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150,
                  child: Text(
                    'Designed and built by Hayat',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                width: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/portrait.jpg'),
                maxRadius: 35,
              ),
            ],
          )
        ],
      ),
    );
  }
}
