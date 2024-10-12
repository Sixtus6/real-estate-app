import 'dart:async';

import 'package:animation_app/ui/common/app_image.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int appbarSecs = 1;
  bool triggerAppbar = false;
  bool showAppbarChildren = false;

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
    rebuildUi();
  }

  init() {
    appBarAnimationFuntion();
  }
}


// Row(
//                   children: [
//                     model.triggerAppbar
//                         ? Container()
//                         : const Icon(
//                             Icons.location_on,
//                             color: Appcolor.primaryShade,
//                           ),
//                     horizontalSpace(1, context),
//                     Text(
//                       // "Saint Petersburg",
//                       model.triggerAppbar ? '' : "Saint Petersburg",
//                       style: CustomTextStyles.bodyStyle(
//                         size: 17,
//                       ),
//                     ).paddingOnly(right: context.widthPercent(2)),
//                   ],
//                 ),