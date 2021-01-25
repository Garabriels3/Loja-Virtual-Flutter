import 'package:flutter/material.dart';
import 'app/di/setup_locator.dart';
import 'core/market_place_app.dart';

void main() {
  setupLocator();
  runApp(MarketPlaceApp());
}
