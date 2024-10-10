import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
          child: Center(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Appcolor.white,
                Appcolor.white.withOpacity(0.47),
                Appcolor.white.withOpacity(0.4),
                Appcolor.white.withOpacity(0.04),
                Appcolor.primary.withOpacity(0.1),
                Appcolor.primary.withOpacity(0.19),
                Appcolor.primary.withOpacity(0.19),
                Appcolor.primary.withOpacity(0.19),
                Appcolor.primary.withOpacity(0.19),
                Appcolor.primary.withOpacity(0.19),
              ],
            ),
          )),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
