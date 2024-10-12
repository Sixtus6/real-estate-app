import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:animation_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget(
      {Key? key,
      required this.imagePath,
      required this.address,
      required this.height,
      required this.width,
      required this.model})
      : super(key: key);
  final String imagePath;
  final String address;
  final double height;
  final double width;
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthPercent(width),
      height: context.heightPercent(height),
      decoration: BoxDecoration(
        /// color: Colors.red,
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedContainer(
                width:
                    model.showPropertyScroller ? context.widthPercent(90) : 0,
                height: height == 27
                    ? context.heightPercent(7.6)
                    : context.heightPercent(6.6),
                // height:
                //     model.showPropertyScroller ? context.heightPercent(7) : 0,
                duration: Duration(milliseconds: height == 27 ? 700 : 1500),
                margin: EdgeInsets.symmetric(
                    horizontal: context.widthPercent(2),
                    vertical: context.heightPercent(1.3)),
                decoration: BoxDecoration(
                  color: Appcolor.linearWhitecolor,
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Appcolor.linearWhitecolor,
                  //     // Appcolor.linearGradientGray,
                  //     Appcolor.linearDarkColor
                  //   ],
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  // ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (model.showPropertyScroller) Container().expand(),
                    AnimatedOpacity(
                      opacity: model.showPropertyScroller ? 1.0 : 0.0,
                      duration: const Duration(seconds: 1),
                      child: Text(
                        address,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: height == 27 ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    if (model.showPropertyScroller) Container().expand(),
                    CircleAvatar(
                      radius: height == 27 ? 30 : 23,
                      backgroundColor: Appcolor.white,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ).paddingRight(context.heightPercent(0.5)),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}


   /// width: model.showPropertyScroller ? context.widthPercent(90) : 0,
   /// 
  //  / //.paddingSymmetric(
  //                 horizontal: context.widthPercent(1),
  //                 vertical: context.heightPercent(0.4)),