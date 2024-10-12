import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/common/custom_text_styles.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:animation_app/ui/views/search/search_viewmodel.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key, required this.viewModel}) : super(key: key);
  final SearchViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          curve: Curves.easeInOut,
          width: context.widthPercent(70),
          //  width: viewModel.triggerFirstWidget ? context.widthPercent(70) : 0,
          height: viewModel.triggerFirstWidget ? context.heightPercent(5.5) : 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //shape: BoxShape.circle,
            color: Colors.white,
          ),
          duration: const Duration(milliseconds: 500),
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
        AnimatedContainer(
          curve: Curves.easeInOut,
          width: context.widthPercent(12),
          height:
              !viewModel.triggerFirstWidget ? 0 : context.heightPercent(5.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          duration: const Duration(milliseconds: 500),
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
        buildCircleButton(Icons.layers_outlined, model),
        SizedBox(height: context.heightPercent(1)),
        buildCircleButton(Icons.explore_outlined, model),
      ],
    );
  }

  Widget buildCircleButton(IconData icon, SearchViewModel model) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      width: model.triggerFirstWidget ? 50 : 0,
      height: model.triggerFirstWidget ? 50 : 0,
      decoration: BoxDecoration(
        color: Colors.grey.shade700.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 500),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 30),
        onPressed: () {
          print('object');
          model.toggleMenuButton(!model.toggleMenu);
        },
      ),
    );
  }
}

class VariantButton extends StatelessWidget {
  const VariantButton({Key? key, required this.model}) : super(key: key);
  final SearchViewModel model;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: model.triggerFirstWidget ? context.heightPercent(5) : 0,
      width: context.widthPercent(37),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade700.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      duration: const Duration(milliseconds: 500),
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
    return GestureDetector(
      onTap: () {
        model.toggleMenuButtonLayer(!model.changeToLayer);
      },
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        width: context.widthPercent(43),
        height: model.toggleMenu ? context.heightPercent(model.menuHeight) : 0,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          //
          color: model.toggleMenu
              ? Colors.white.withOpacity(0.9)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: Duration(seconds: 1),
        child: AnimatedOpacity(
          opacity: model.toggleMenu ? 1 : 0,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
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
        ),
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
  const PriceTagWidget({Key? key, required this.price, required this.model})
      : super(key: key);
  final String price;
  final SearchViewModel model;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      height: model.showChildren ? context.heightPercent(5) : 0,
      width: model.showChildren
          ? model.changeToLayer
              ? context.widthPercent(11)
              : context.widthPercent(20)
          : 0,
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Appcolor.primary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12)), // Rounded corners
      ),
      duration: const Duration(seconds: 1),
      child: Center(
        child: model.changeToLayer
            ? Icon(Icons.apartment)
            : Text(
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
