import 'package:animation_app/ui/common/app_image.dart';
import 'package:animation_app/ui/common/app_strings.dart';
import 'package:animation_app/ui/common/custom_text_styles.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:animation_app/ui/widgets/card.dart';
import 'package:animation_app/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    return Stack(
      children: [
        BaseScaffold(
          items: [
            customAppBar(context, viewModel),
            contextBody(context),
          ],
        ),
        stackedBottomSheet(),
        customNavBar(context, viewModel)
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.init());
}

customNavBar(BuildContext context, HomeViewModel model) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.widthPercent(10),
          vertical: context.heightPercent(3)),
      padding: EdgeInsets.symmetric(
          vertical: context.heightPercent(1),
          horizontal: context.widthPercent(1)),
      decoration: BoxDecoration(
        color: Appcolor.navBarColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          model.navIcons.length,
          (index) => CircleAvatar(
            radius: index == 2 ? 30 : 25,
            backgroundColor:
                index == 2 ? Appcolor.primary : Appcolor.navBarIconColor,
            child: Image.asset(
              height: 30,
              width: 30,
              model.navIcons[index],
            ),
          ),
        ),
      ),
    ),
  );
}

Row contextBody(BuildContext context) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(4, context),
          GestureDetector(
            onTap: () {
              print('object');
            },
            child: Text(
              "Hi, Marina",
              style: CustomTextStyles.bodyStyle(
                size: 26,
                // fontWeight: FontWeight.w600
              ),
            ),
          ),
          Text(
            "let's select your\nperfect place",
            style: CustomTextStyles.bodyStyle(
                size: 32,
                // fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          verticalSpace(5.1, context),
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

Row customAppBar(BuildContext context, HomeViewModel model) {
  return Row(
    children: [
      GestureDetector(
          onTap: () {
            model.appBarAnimationFuntion();
          },
          child: AnimatedContainer(
            duration: Duration(seconds: model.appbarSecs),
            curve: Curves.easeInOut,
            width: !model.triggerAppbar ? 0 : 180,
            decoration: BoxDecoration(
              color: Appcolor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(3),
                vertical: context.heightPercent(2),
              ),
              child: AnimatedOpacity(
                opacity: model.showAppbarChildren ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Appcolor.primaryShade,
                    ),
                    horizontalSpace(1, context),
                    Text(
                      "Saint Petersbur",
                      style: CustomTextStyles.bodyStyle(
                        size: 17,
                      ),
                    ).paddingOnly(right: context.widthPercent(2)),
                  ],
                ),
              ),
            ),
          )),
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
          AppImage.user,
        ),
      ),
    ],
  );
}

class stackedBottomSheet extends StatelessWidget {
  const stackedBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.heightPercent(68),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
          children: [
            const PropertyCardWidget(
                imagePath: AppImage.house2,
                address: AppString.house,
                height: 27,
                width: double.infinity),
            verticalSpace(1.3, context),
            Row(
              children: [
                const Column(
                  children: [
                    PropertyCardWidget(
                        imagePath: AppImage.house3,
                        address: AppString.house3,
                        height: 37,
                        width: 45),
                  ],
                ),
                Container().expand(),
                Column(
                  children: [
                    const PropertyCardWidget(
                        imagePath: AppImage.house,
                        address: AppString.house1,
                        height: 18,
                        width: 47),
                    verticalSpace(1.2, context),
                    const PropertyCardWidget(
                        imagePath: AppImage.house1,
                        address: AppString.house2,
                        height: 18,
                        width: 47),
                  ],
                )
              ],
            )
          ],
        ).paddingSymmetric(
            horizontal: context.widthPercent(3),
            vertical: context.heightPercent(1.2)),
      ),
    );
  }
}
