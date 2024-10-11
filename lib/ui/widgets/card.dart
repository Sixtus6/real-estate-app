import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:flutter/material.dart';

class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget(
      {Key? key,
      required this.imagePath,
      required this.address,
      required this.height,
      required this.width})
      : super(key: key);
  final String imagePath;
  final String address;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthPercent(width),
      height: context.heightPercent(height),
      decoration: BoxDecoration(
        color: Colors.black,
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
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: context.widthPercent(2.5),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.widthPercent(1),
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  CircleAvatar(
                    radius: height == 27 ? 30 : 20,
                    backgroundColor: Appcolor.white,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ).paddingSymmetric(
                  horizontal: context.widthPercent(1),
                  vertical: context.heightPercent(0.4)),
            ),
          ),
        ],
      ),
    );
  }
}
