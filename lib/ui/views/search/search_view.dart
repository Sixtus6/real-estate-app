import 'package:animation_app/ui/extension/media_query.dart';

import 'package:animation_app/ui/views/search/search_component.dart';
import 'package:animation_app/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        BaseScaffold(
          items: [
            SearchBarWidget(
              viewModel: viewModel,
            ),
          ],
          isSearch: true,
        ),
        Positioned(
          bottom: context.heightPercent(13.5),
          right: context.widthPercent(4),
          child: VariantButton(
            model: viewModel,
          ),
        ),
        Positioned(
          bottom: context.heightPercent(13.5),
          right: context.widthPercent(85),
          child: StackButtons(
            model: viewModel,
          ),
        ),
        Positioned(
            bottom: context.heightPercent(22),
            right: context.widthPercent(41),
            child: OptionsCard(
              model: viewModel,
            )),
        Positioned(
          top: context.heightPercent(24),
          left: context.widthPercent(20),
          child: PriceTagWidget(
            price: '10,3 mn ₽',
            model: viewModel,
          ),
        ),
        Positioned(
          top: context.heightPercent(30.5),
          left: context.widthPercent(30),
          child: PriceTagWidget(price: '11 mn ₽', model: viewModel),
        ),
        Positioned(
          top: context.heightPercent(35),
          left: context.widthPercent(58),
          child: PriceTagWidget(price: '7,8 mn ₽', model: viewModel),
        ),
        Positioned(
          top: context.heightPercent(45),
          left: context.widthPercent(60),
          child: PriceTagWidget(price: '13,3 mn ₽', model: viewModel),
        ),
        Positioned(
          top: context.heightPercent(51),
          left: context.widthPercent(23),
          child: PriceTagWidget(price: '8,5 mn ₽', model: viewModel),
        ),
        Positioned(
          top: context.heightPercent(59),
          left: context.widthPercent(60),
          child: PriceTagWidget(price: '6,95 mn ₽', model: viewModel),
        ),
      ],
    );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
  @override
  void onViewModelReady(SearchViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.init());
}
