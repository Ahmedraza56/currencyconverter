import 'package:currency_converter_master/main.dart';
import 'package:currency_converter_master/variables/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangeRate extends StatelessWidget {
  const ExchangeRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          const Text(
            'Exchange Rate',
            style: TextStyle(color: secondaryColor, fontSize: 20),
          ),
          Text(
            '1 ${Provider.of<Data>(context).initialCur} = ${(Provider.of<Data>(context).updatedRate == null) ? '...' : Provider.of<Data>(context).updatedRate} ${Provider.of<Data>(context).finalCur}',
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
