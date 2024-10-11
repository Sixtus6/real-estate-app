import 'package:animation_app/ui/common/app_colors.dart';
import 'package:animation_app/ui/extension/media_query.dart';
import 'package:animation_app/ui/extension/widget_extention.dart';
import 'package:flutter/material.dart';

class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget(
      {Key? key, required this.imageUrl, required this.address})
      : super(key: key);
  final String imageUrl;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Set appropriate width for the card
      height: 200, // Set appropriate height for the card
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20), // Rounded corners
        image: DecorationImage(
          image: NetworkImage(imageUrl), // Network image
          fit: BoxFit.cover, // Ensure image covers the container
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
                  Text(
                    address,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8), // Space between the text and the button
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Appcolor.white,
                    child: Icon(
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
