
import 'package:flutter/material.dart';

class StateChangesViewModel extends ChangeNotifier {
  bool commentary = false;
  bool question = true;
  bool notice = false;

  void changeState(bool commentary1,bool question1, bool notice1) {
    print('kirdi ichigaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    commentary = commentary1;
    // notifyListeners();
    question = question1;
    // notifyListeners();
    notice = notice1;
    notifyListeners();
  }
}
