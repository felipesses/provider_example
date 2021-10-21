import 'package:flutter/material.dart';
import 'package:provider_example/models/coin_model.dart';

class CoinProvider with ChangeNotifier {
  CoinModel model = CoinModel();
  bool canBuy = false;

  void addValue() {
    model.value += 1;
    notifyListeners();
  }

  buyProduct(double value) {
    canBuy = model.value >= value;
    if (canBuy) {
      model.value -= value;
    }
    notifyListeners();
  }
}
