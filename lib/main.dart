import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: const Color(0xFF00142F),
        ),
        home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: MainPage(),
        ),
      ),
    );
  }
}

class Data extends ChangeNotifier {
  String initialCur = 'AUD';
  String finalCur = 'USD';
  String? updatedRate;
  String? inputAmount;
  String? outputAmount;
  String? initialCurDisplay;
  String? finalCurDisplay;

  void changeInitial(String newInitial) {
    initialCur = newInitial;
    notifyListeners();
  }

  void changeFinal(String newFinal) {
    finalCur = newFinal;
    notifyListeners();
  }

  void changeRate(String newRate) {
    updatedRate = newRate;
    notifyListeners();
  }

  void enterAmount(String newInput) {
    inputAmount = newInput;
    notifyListeners();
  }

  void updateInitialCurDisplay(String newInput) {
    initialCurDisplay = newInput;
  }

  void updateFinalCurDisplay(String newInput) {
    finalCurDisplay = newInput;
  }

  void calcConvertedAmount(String rate) {
    outputAmount = (double.parse(inputAmount!) * double.parse(updatedRate!))
        .toStringAsFixed(2);
    notifyListeners();
  }
}
