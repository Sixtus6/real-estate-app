import 'dart:async';
import 'dart:developer';

import 'package:animation_app/ui/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  PageController pageController = PageController(initialPage: 2);
  int currentPage = 2;
  int appbarSecs = 1;
  int buttomSecs = 2;
  bool triggerAppbar = false;
  bool showAppbarChildren = false;
  bool showButtomSheet = false;
  bool showPropertyScroller = false;
  bool showNavbar = false;

  setCurrentNav(int val) {
    if (val == 0 || val == 2) {
      print('object');
      print('set page to ${val}');
      pageController.animateToPage(val,
          duration: Duration(milliseconds: 900), curve: Curves.ease);
      currentPage = val;
      rebuildUi();
      return;
    }
  }

  List navIcons = <String>[
    AppImage.search,
    AppImage.messg,
    AppImage.home,
    AppImage.heart,
    AppImage.usericon
  ];

  appBarAnimationFuntion() {
    triggerAppbar = true;
    Timer(Duration(seconds: appbarSecs), () {
      showAppbarChildren = triggerAppbar;
      print(showAppbarChildren);
      rebuildUi();
    });
    Timer(const Duration(milliseconds: 1800), () {
      showButtomSheet = triggerAppbar;
      rebuildUi();
    });
    Timer(const Duration(milliseconds: 2000), () {
      showPropertyScroller = triggerAppbar;
      rebuildUi();
    });
    Timer(const Duration(milliseconds: 2500), () {
      showNavbar = triggerAppbar;
      rebuildUi();
    });
    rebuildUi();
  }

  init() {
    log('Init Homescreen');
    appBarAnimationFuntion();
  }
}
