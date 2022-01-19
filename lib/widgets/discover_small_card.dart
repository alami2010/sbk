import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/icons.dart';
import 'package:meditation/shared/event.dart';
import 'package:meditation/widgets/svg_asset.dart';

class DiscoverSmallCard extends StatelessWidget {
  final Event? event;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final double? borderRadius;
  final Widget? icon;
  final Function? onTap;

  const DiscoverSmallCard(
      {Key? key,
      this.event,
      this.gradientStartColor,
      this.gradientEndColor,
      this.height,
      this.width,
      this.vectorBottom,
      this.vectorTop,
      this.borderRadius,
      this.icon,
      this.onTap})
      : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.5),
            Colors.black,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => onTap!(),
        child: Ink(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 125.w,
                  width: 150.w,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 125.w,
                        width: 150.w,
                        child: SvgAsset(assetName: AssetName.vectorSmallBottom),
                      ),
                      SizedBox(
                        child: SvgAsset(
                            height: 125.w,
                            width: 150.w,
                            fit: BoxFit.fitHeight,
                            assetName: AssetName.vectorSmallTop),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 125.w,
                width: 300.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.w, bottom: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event!.title,
                        style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        event!.phone,
                        style: TextStyle(
                            fontSize: 10.w,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(event!.price.toString() + ' €',
                              style: TextStyle(
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(event!.startHour,
                              style: TextStyle(
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'SALSA',
                            style: TextStyle(
                              fontSize: 15.w,
                              color: Colors.white70,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          Text(
                            'SALSA',
                            style: TextStyle(
                              fontSize: 15.w,
                              color: Colors.white70,
                              backgroundColor: Colors.black,
                            ),
                          ),
                          Text(
                            'SALSA',
                            style: TextStyle(
                              fontSize: 15.w,
                              color: Colors.white70,
                              backgroundColor: Colors.black,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
