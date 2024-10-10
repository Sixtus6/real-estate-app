import 'package:animation_app/ui/common/app_colors.dart';
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
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: items,
          ),
        ),
      ),
    );
  }
}
