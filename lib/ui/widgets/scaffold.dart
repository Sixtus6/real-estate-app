import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/common/app_image.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  BaseScaffold({
    super.key,
    required this.items,
    this.isHome = false,
    this.isSearch = false,
  });
  final List<Widget> items;
  final bool isHome;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: isSearch
            ? const BoxDecoration(
                //  color: Colors.amber,
                // borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(AppImage.map),
                  fit: BoxFit.fitHeight,
                ),
              )
            : isHome
                ? BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Appcolor.bgwhite.withOpacity(0.49),
                        Appcolor.bgwhite.withOpacity(0.47),
                        Appcolor.bgwhite.withOpacity(0.4),
                        //Appcolor.bgwhite.withOpacity(0.04),
                        Appcolor.primary.withOpacity(0.19),
                        Appcolor.primary.withOpacity(0.19),
                        Appcolor.primary.withOpacity(0.19),
                        Appcolor.primary.withOpacity(0.19),
                        Appcolor.primary.withOpacity(0.19),
                        Appcolor.primary.withOpacity(0.19),
                      ],
                    ),
                  )
                : const BoxDecoration(color: Appcolor.navBarIconColor),
        child: Column(
          children: items,
        ).paddingSymmetric(
            horizontal: context.widthPercent(4),
            vertical: context.heightPercent(5)),
      ),
    );
  }
}
