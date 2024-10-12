import 'package:animation_app/ui/views/home/home_component.dart';
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
        BaseScaffold(
          items: [
            customAppBar(context, viewModel),
            contextBody(context, viewModel),
          ],
        ),
        stackedBottomSheet(
          model: viewModel,
        ),
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
