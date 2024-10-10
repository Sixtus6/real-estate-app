import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.items,
  });
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Appcolor.bgwhite.withOpacity(0.49),
              Appcolor.bgwhite.withOpacity(0.47),
              Appcolor.bgwhite.withOpacity(0.4),
              Appcolor.bgwhite.withOpacity(0.04),
              Appcolor.primary.withOpacity(0.1),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
            ],
          ),
        ),
        child: Column(
          children: items,
        ).paddingSymmetric(
            horizontal: context.widthPercent(4),
            vertical: context.heightPercent(5)),
      ),
    );
  }
}
