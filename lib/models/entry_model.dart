import 'dart:collection';

import 'package:flutter/foundation.dart';

class EntryModel extends ChangeNotifier {
  /// State of Pain diary entries
  final Map<int, int> _entries = HashMap();

  /// Unmodifiable view of the entries
  UnmodifiableMapView<int, int> get entries => UnmodifiableMapView(_entries);

  void update(int question, int value) {
    _entries.update(question, (v) => value, ifAbsent: () => value);
    notifyListeners();
  }

  void submit() {
    removeAll();
  }

  void removeAll() {
    _entries.clear();
    notifyListeners();
  }
}
