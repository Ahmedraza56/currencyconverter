import 'dart:developer';

import 'package:currency_converter_master/main.dart';
import 'package:currency_converter_master/variables/Coin_Data.dart';
import 'package:currency_converter_master/variables/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionList extends StatefulWidget {
  const ConversionList({super.key});

  @override
  State<ConversionList> createState() => _ConversionListState();
}

class _ConversionListState extends State<ConversionList> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  String from = 'AUD';
  String to = 'USD';
  String? currencyRate;
  String? inputAmount;

  void getData() async {
    try {
      double rate =
          await CoinData(baseCurrency: from, finalCurrency: to).getCoinData();

      currencyRate = rate.toStringAsFixed(3);
      Provider.of<Data>(context, listen: false).changeRate(currencyRate!);
      log('conversion rate is');
      log(currencyRate.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'From',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: DropdownButton<String>(
                    value: from,
                    items: currenciesList
                        .map(
                            (e) => (DropdownMenuItem(child: Text(e), value: e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        Provider.of<Data>(context, listen: false)
                            .changeInitial(value!);
                        from = value;
                        getData();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'To',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: DropdownButton<String>(
                    value: to,
                    items: currenciesList
                        .map(
                            (e) => (DropdownMenuItem(child: Text(e), value: e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        Provider.of<Data>(context, listen: false)
                            .changeFinal(value!);
                        to = value;
                        getData();
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
            ),
            controller: textController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Amount',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(30)),
            child: TextButton(
              onPressed: () {
                setState(() {
                  log('From: $from');
                  log('To: $to');
                  getData();

                  inputAmount = textController.text;
                  log('amount inputted is');
                  log(inputAmount.toString());
                  Provider.of<Data>(context, listen: false)
                      .enterAmount(inputAmount!);
                  Provider.of<Data>(context, listen: false)
                      .calcConvertedAmount(currencyRate.toString());
                  Provider.of<Data>(context, listen: false)
                      .updateInitialCurDisplay(from);
                  Provider.of<Data>(context, listen: false)
                      .updateFinalCurDisplay(to);
                });
              },
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//lift inputAmount value and From value into CountryCard files
