import 'package:animation_app/ui/common/custom_text_styles.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
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
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Appcolor.white,
                  borderRadius: BorderRadius.circular(10)),
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
                          size: 16, fontWeight: FontWeight.w600),
                    ).paddingOnly(right: context.widthPercent(2)),
                  ],
                ),
              ),
            ),
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Circular shape
                color: Colors.orangeAccent, // Background color
              ),
              child: Image.network(
                  'assets/images/profile.jpg'), // Profile image path
            ),
          ],
        )
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
