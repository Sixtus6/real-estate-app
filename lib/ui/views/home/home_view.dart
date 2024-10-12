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
import 'package:countup/countup.dart' as counter;
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
            contextBody(context, viewModel),
          ],
        ),
        stackedBottomSheet(
          model: viewModel,
        ),
        //customNavBar(context, viewModel)
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

Row contextBody(BuildContext context, HomeViewModel model) {
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
            child: AnimatedOpacity(
              opacity: model.showAppbarChildren ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                "Hi, Marina",
                style: CustomTextStyles.bodyStyle(
                  size: 26,
                  // fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: model.showAppbarChildren ? 1.0 : 0.0,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                0,
                model.showAppbarChildren ? 0 : 50,
                0,
              ),
              child: const Text(
                "let's select your\nperfect place",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          verticalSpace(5.1, context),
          Row(
            children: [
              cardsWidget(model, context, buyCard: true),
              //Container().expand(),'
              horizontalSpace(6, context),
              cardsWidget(model, context),
            ],
          ),
        ],
      ),
    ],
  );
}

AnimatedContainer cardsWidget(HomeViewModel model, BuildContext context,
    {bool buyCard = false}) {
  return AnimatedContainer(
    curve: Curves.ease,
    duration: Duration(seconds: model.appbarSecs),
    width: model.showAppbarChildren ? context.widthPercent(43) : 0,
    height: model.showAppbarChildren ? context.heightPercent(20) : 0,
    decoration: buyCard
        ? BoxDecoration(
            shape: BoxShape.circle,
            color: !buyCard ? Appcolor.white : Appcolor.primary,
          )
        : BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.circular(20),
          ),
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Visibility(
          visible: model.showAppbarChildren,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                buyCard ? 'BUY' : 'RENT',
                style: CustomTextStyles.bodyStyle(
                  size: constraints.maxWidth * 0.1,
                  color: buyCard ? Appcolor.white : Appcolor.primaryShade,
                ),
              ),
              SizedBox(
                  height: context.heightPercent(constraints.maxWidth * 0.008)),
              counter.Countup(
                begin: 0,
                end: buyCard ? 1034 : 2212,
                duration: const Duration(seconds: 1),
                separator: ' ',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.2,
                  color: buyCard ? Colors.white : Appcolor.primaryShade,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'offers',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.09,
                  color: buyCard ? Appcolor.white : Appcolor.primaryShade,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Row customAppBar(BuildContext context, HomeViewModel model) {
  return Row(
    children: [
      AnimatedContainer(
        duration: Duration(seconds: model.appbarSecs),
        curve: Curves.easeInOut,
        width: !model.triggerAppbar ? 0 : context.widthPercent(42),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
      Container().expand(),
      AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(seconds: model.appbarSecs),
        width: model.triggerAppbar ? 55 : 0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Appcolor.profileColor,
              Appcolor.profileColor,
              Appcolor.profileColorLinear,
              Appcolor.profileColorLinear.withOpacity(0.4),
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: model.triggerAppbar
            ? Image.asset(
                AppImage.user,
                fit: BoxFit.cover,
              )
            : const SizedBox.shrink(),
      )
    ],
  );
}

class stackedBottomSheet extends StatelessWidget {
  const stackedBottomSheet({
    super.key,
    required this.model,
  });
  final HomeViewModel model;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        height: model.showButtomSheet ? context.heightPercent(68) : 0,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        duration: Duration(milliseconds: 700),
        child: SingleChildScrollView(
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
      ),
    );
  }
}




              // AnimatedContainer(
              //   curve: Curves.easeInOut,
              //   duration: Duration(seconds: model.appbarSecs),
              //   width: model.showAppbarChildren ? context.widthPercent(43) : 0,
              //   height:
              //       model.showAppbarChildren ? context.heightPercent(20) : 0,
              //   decoration: BoxDecoration(
              //     color: Appcolor.white,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: LayoutBuilder(
              //     builder: (BuildContext context, BoxConstraints constraints) {
              //       return Visibility(
              //         visible: model.showAppbarChildren,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Text('RENT',
              //                 style: CustomTextStyles.bodyStyle(
              //                   size: constraints.maxWidth * 0.1,
              //                 )),
              //             SizedBox(
              //                 height: context
              //                     .heightPercent(constraints.maxWidth * 0.008)),
              //             const Text(
              //               '2 212',
              //               style: TextStyle(
              //                 fontSize: 40,
              //                 color: Appcolor.primaryShade,
              //                 fontWeight: FontWeight.w800,
              //               ),
              //             ),
              //             SizedBox(height: context.heightPercent(0.001)),
              //             const Text(
              //               'offers',
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 color: Appcolor.primaryShade,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
          