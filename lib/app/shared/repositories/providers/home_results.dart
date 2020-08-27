import 'package:flutter/material.dart';

import '../../data/models/quote.dart';

class HomeResultsChanger with ChangeNotifier {
  Future<List<Quote>> _snapshotQuotes;
  Future<List<Quote>> get snapshotQuotes => _snapshotQuotes;

  void updateSnapshot(Future<List<Quote>> future) {
    _snapshotQuotes = future;
    notifyListeners();
  }
}
