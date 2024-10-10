import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/extension/media_query.dart';
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
              Appcolor.white,
              Appcolor.white.withOpacity(0.47),
              Appcolor.white.withOpacity(0.4),
              Appcolor.white.withOpacity(0.04),
              Appcolor.primary.withOpacity(0.1),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
              Appcolor.primary.withOpacity(0.19),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.widthPercent(4),
              vertical: context.heightPercent(10)),
          child: Column(
            children: items,
          ),
        ),
      ),
    );
  }
}
