import 'package:animation_app/ui/common/custom_text_styles.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:animation_app/ui/widgets/card.dart';
import 'package:animation_app/ui/widgets/scaffold.dart';
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
    return BaseScaffold(
      items: [
        customAppBar(context),
        contextBody(context),
        PropertyCardWidget()
      ],
    );
  }

  Row contextBody(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpace(5, context),
            Text(
              "Hi, Marina",
              style: CustomTextStyles.bodyStyle(
                size: 26,
                // fontWeight: FontWeight.w600
              ),
            ),
            Text(
              "let's select your\nperfect place",
              style: CustomTextStyles.bodyStyle(
                  size: 32,
                  // fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            verticalSpace(4.5, context),
            Row(
              children: [
                Container(
                  width: context.widthPercent(42),
                  height: context.heightPercent(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Appcolor.primary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'BUY',
                        style: CustomTextStyles.bodyStyle(
                            size: 17,
                            // fontWeight: FontWeight.bold,
                            color: Appcolor.white),
                      ),
                      SizedBox(height: context.heightPercent(2)),
                      const Text(
                        '1 034',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: context.heightPercent(0.001)),
                      const Text(
                        'offers',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                //Container().expand(),'
                horizontalSpace(5, context),
                Container(
                  width: context.widthPercent(45),
                  height: context.heightPercent(20),
                  decoration: BoxDecoration(
                    color: Appcolor.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'RENT',
                        style: TextStyle(
                          fontSize: 16,
                          color: Appcolor.primaryShade,
                        ),
                      ),
                      SizedBox(height: context.heightPercent(2)),
                      const Text(
                        '2 212',
                        style: TextStyle(
                          fontSize: 40,
                          color: Appcolor.primaryShade,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: context.heightPercent(0.001)),
                      const Text(
                        'offers',
                        style: TextStyle(
                          fontSize: 16,
                          color: Appcolor.primaryShade,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row customAppBar(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Appcolor.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(2),
                vertical: context.heightPercent(2)),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Appcolor.primaryShade,
                ),
                horizontalSpace(1, context),
                Text(
                  "Saint Petersburg",
                  style: CustomTextStyles.bodyStyle(
                    size: 17,
                  ),
                ).paddingOnly(right: context.widthPercent(2)),
              ],
            ),
          ),
        ),
        Container().expand(),
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Appcolor.profileColor,
                Appcolor.profileColor,
                Appcolor.profileColorLinear,
                Appcolor.profileColorLinear.withOpacity(0.01)
              ],
            ),
            shape: BoxShape.circle,
            color: Colors.orangeAccent,
          ),
          child: Image.asset(
            'assets/image/user.png',
          ),
        ),
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
