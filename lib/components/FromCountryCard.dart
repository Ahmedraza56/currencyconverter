import 'package:currency_converter_master/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FromCountryCard extends StatelessWidget {
  final String image;
  final String currencyAmount;
  final String currencyName;

  const FromCountryCard(
      {super.key,
      required this.image,
      required this.currencyAmount,
      required this.currencyName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage('assets/$image'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${(Provider.of<Data>(context).inputAmount == null) ? '0' : Provider.of<Data>(context).inputAmount} ${(Provider.of<Data>(context).initialCurDisplay == null) ? 'AUD' : Provider.of<Data>(context).initialCurDisplay}',
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
