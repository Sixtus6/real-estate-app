import 'package:animation_app/ui/views/home/home_widget.dart';
import 'package:animation_app/ui/views/search/search_view.dart';
import 'package:animation_app/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
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
        PageView(
          controller: viewModel.pageController,
          onPageChanged: (value) {
            // viewModel.setCurrentNav(value);
          },
          children: [
            const SearchView(),
            BaseScaffold(items: const []),
            Stack(
              children: [
                BaseScaffold(
                  isHome: true,
                  items: [
                    customAppBar(context, viewModel),
                    contextBody(context, viewModel),
                  ],
                ),
                viewModel.currentPage == 2
                    ? stackedBottomSheet(
                        model: viewModel,
                      )
                    : Container(),
              ],
            ),
            BaseScaffold(items: const []),
            BaseScaffold(items: const []),
          ],
        ),
        // viewModel.currentPage == 2
        //     ? stackedBottomSheet(
        //         model: viewModel,
        //       )
        //     : Container(),
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
