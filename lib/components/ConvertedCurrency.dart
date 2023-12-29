import 'package:currency_converter_master/components/FromCountryCard.dart';
import 'package:currency_converter_master/components/ToCountryCard.dart';
import 'package:flutter/material.dart';

class ConvertedCurrency extends StatelessWidget {
  const ConvertedCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: FromCountryCard(
          image: 'AUSFlag.jpeg',
          currencyAmount: '1000',
          currencyName: 'AUD',
        ),
      ),
      const Icon(
        Icons.arrow_right_alt_outlined,
        size: 80,
        color: Color(0xFF3A7B1E),
      ),
      const ToCountryCard(
          image: 'USFlag.png', currencyAmount: '730', currencyName: 'USD')
    ]);
  }
}
