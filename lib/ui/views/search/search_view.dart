import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/common/custom_text_styles.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:animation_app/ui/widgets/scaffold.dart';
import 'package:flutter/material.dart';
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
          items: const [
            SearchBar(),
          ],
          isSearch: true,
        ),
        Positioned(
          bottom: context.heightPercent(13.5),
          right: context.widthPercent(4),
          child: const VariantButton(),
        ),
        Positioned(
          bottom: context.heightPercent(13.5),
          right: context.widthPercent(85),
          child: StackButtons(
            model: viewModel,
          ),
        ),
        Visibility(
          visible: viewModel.toggleMenu,
          child: Positioned(
              bottom: context.heightPercent(22),
              right: context.widthPercent(41),
              child: OptionsCard(
                model: viewModel,
              )),
        ),
        Positioned(
          top: context.heightPercent(24),
          left: context.widthPercent(20),
          child: PriceTagWidget(price: '10,3 mn ₽'),
        ),
        Positioned(
          top: context.heightPercent(30.5),
          left: context.widthPercent(30),
          child: PriceTagWidget(price: '11 mn ₽'),
        ),
        Positioned(
          top: context.heightPercent(35),
          left: context.widthPercent(58),
          child: PriceTagWidget(price: '7,8 mn ₽'),
        ),
        Positioned(
          top: context.heightPercent(45),
          left: context.widthPercent(60),
          child: PriceTagWidget(price: '13,3 mn ₽'),
        ),
        Positioned(
          top: context.heightPercent(51),
          left: context.widthPercent(23),
          child: PriceTagWidget(price: '8,5 mn ₽'),
        ),
        Positioned(
          top: context.heightPercent(59),
          left: context.widthPercent(60),
          child: PriceTagWidget(price: '6,95 mn ₽'),
        ),
      ],
    );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: context.widthPercent(70),
          height: context.heightPercent(5.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black54),
                onPressed: () {},
              ),
              const Text(
                "Saint Petersburg",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
        ),
        Container().expand(),
        Container(
          width: context.widthPercent(12),
          height: context.heightPercent(5.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Colors.black54),
            onPressed: () {},
          ),
        ),
      ],
    )
        .paddingSymmetric(horizontal: context.widthPercent(4))
        .paddingTop(context.heightPercent(2));
  }
}

class StackButtons extends StatelessWidget {
  const StackButtons({Key? key, required this.model}) : super(key: key);
  final SearchViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () {
              print("object");
            },
            child: buildCircleButton(Icons.layers_outlined)),
        SizedBox(height: context.heightPercent(1)),
        buildCircleButton(Icons.explore_outlined),
      ],
    );
  }

  Widget buildCircleButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade700.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 30),
        onPressed: () {
          // Handle button press
        },
      ),
    );
  }
}

class VariantButton extends StatelessWidget {
  const VariantButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightPercent(5),
      width: context.widthPercent(37),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade700.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //  mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.format_list_bulleted,
                size: 21, color: Colors.white),
            Container().expand(),
            Text(
              "List of variants",
              style: CustomTextStyles.bodyStyle(
                  color: Appcolor.white, size: 12, fontWeight: FontWeight.bold
                  // fontWeight: FontWeight.w600
                  ),
            ),
          ],
        ).paddingSymmetric(horizontal: context.widthPercent(2.5)),
      ),
    );
  }
}

class OptionsCard extends StatelessWidget {
  const OptionsCard({Key? key, required this.model}) : super(key: key);
  final SearchViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthPercent(43),
      height: context.heightPercent(17),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OptionItem(
            icon: Icons.check_circle_outline,
            text: "Cosy areas",
            color: Colors.black,
          ),
          SizedBox(height: context.heightPercent(1.5)),
          const OptionItem(
            icon: Icons.account_balance_wallet_outlined,
            text: "Price",
            color: Appcolor.primary,
          ),
          SizedBox(height: context.heightPercent(1.5)),
          const OptionItem(
            icon: Icons.delete_outline,
            text: "Infrastructure",
            color: Colors.black,
          ),
          SizedBox(height: context.heightPercent(1.5)),
          const OptionItem(
            icon: Icons.layers_outlined,
            text: "Without any layer",
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const OptionItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(width: context.widthPercent(1)),
        Text(
          text,
          style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none),
        ),
      ],
    );
  }
}

class PriceTagWidget extends StatelessWidget {
  const PriceTagWidget({Key? key, required this.price}) : super(key: key);
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightPercent(5),
      width: context.widthPercent(20),
      padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Appcolor.primary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12)), // Rounded corners
      ),
      child: Center(
        child: Text(
          price,
          style: const TextStyle(
              color: Colors.white, // White text color
              fontSize: 11,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
