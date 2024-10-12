import 'dart:async';
import 'dart:developer';

import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {
  bool toggleMenu = false;
  bool triggerFirstWidget = false;
  bool changeToLayer = false;
  bool showChildren = false;
  double menuHeight = 17;
  double menuWidth = 43;

  toggleMenuButton(bool toggle) {
    toggleMenu = toggle;
    menuHeight = toggle ? 17 : 0;
    menuWidth = toggle ? 43 : 0;
    print('settig');
    rebuildUi();
  }

  toggleMenuButtonLayer(bool toggle) {
    changeToLayer = toggle;
    rebuildUi();
  }

  init() {
    log('Init Search');
    appBarAnimationFuntion();
  }

  void appBarAnimationFuntion() {
    triggerFirstWidget = true;
    Timer(Duration(seconds: 1), () {
      showChildren = triggerFirstWidget;
      print(showChildren);
      rebuildUi();
    });
    rebuildUi();
  }
}
