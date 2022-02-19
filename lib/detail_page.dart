import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_dance/shared/event.dart';
import 'package:go_dance/shared/utils.dart';
import 'package:go_dance/widgets/svg_asset.dart';
import 'package:url_launcher/url_launcher.dart';

import 'icons.dart';

class DetailPage extends StatefulWidget {
  final Event event;
  var listColor = [
    [0xffE5FCC2, 0xff9DE0AD, 0xff45ADA8, 0xff547980, 0xff594F4F],
    [0xffE1F5C4, 0xffEDE574, 0xffF9D423, 0xffFC913A, 0xffFF4E50],
    [0xff99B898, 0xffFECEAB, 0xffFF847C, 0xffE84A5F, 0xff2A363B],
    [0xffF8B195, 0xffF67280, 0xffC06C84, 0xff6C5B7B, 0xff355C7D],
    [0xffA8A7A7, 0xffE8175D, 0xffE474747, 0xffE474747, 0xff363636]
  ];

  DetailPage(this.event, {Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool? isHeartIconTapped = false;

  @override
  Widget build(BuildContext context) {
    print("ysf");
    print(widget.event);
    var randomColor = new Random().nextInt(4);
    print("randomColor" + randomColor.toString());

    if (!Utils.isNullEmptyOrFalse(widget.event.type)) {
      var dances = widget.event.type.split("-");
      dances.forEach((element) {

      });
    }

    var dances = Utils.isNullEmptyOrFalse(widget.event.type);
    return Scaffold(
      backgroundColor: Color(widget.listColor[randomColor][0]),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 66.h,
                ),
                Hero(
                  tag: "sleepMeditation",
                  child: Material(
                    color: Color(widget.listColor[randomColor][3]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(widget.event.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.w,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  height: 279.w,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 28.w),
                      Container(
                        height: 300.w,
                        width: 320.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/dancing_06.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: priceAndPeriod(),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2, // 20%
                      child: Material(
                        color: Color(widget.listColor[randomColor][2]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 28.w, top: 15.w, bottom: 15.w),
                          child: Text(
                            widget.event.startHour +
                                " - " +
                                widget.event.endHour,
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontSize: 16.w),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2, // 20%
                      child: Material(
                        color: Color(widget.listColor[randomColor][2]),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 28.w, top: 15.w, bottom: 15.w),
                          child: Text(
                            widget.event.date,
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontSize: 16.w),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Material(
                  color: Color(widget.listColor[randomColor][3]),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 28.w, top: 15.w, bottom: 15.w),
                    child: Text(
                      widget.event.type.replaceAll("_", " ").replaceAll("SAC", "Salsa cubaine").replaceAll("KIZ", "Kizomba").replaceAll("BAT", "Batchata"),
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontSize: 16.w),
                    ),
                  ),
                ),
                Material(
                  color: Color(widget.listColor[randomColor][1]),
                  child: Padding(
                    padding:
                    EdgeInsets.only(left: 28.w, top: 15.w, bottom: 15.w),
                    child: Text(
                      widget.event.address,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontSize: 16.w),
                    ),
                  ),
                ),
                Material(
                  color: Color(widget.listColor[randomColor][4]),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 28.w, left: 28.w, right: 28.w, bottom: 50.h),
                    child: Text(
                      widget.event.description,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontSize: 17.w),
                    ),
                  ),
                ),
                SizedBox(height: 46.h)
              ],
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Color(widget.listColor[randomColor][4]),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(360),
                            onTap: onBackIconTapped,
                            child: Container(
                              height: 35.w,
                              width: 35.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Center(
                                child: SvgAsset(
                                  assetName: AssetName.back,
                                  height: 20.w,
                                  width: 20.w,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(360),
                            onTap: onHeartIconTapped,
                            child: Container(
                              height: 35.w,
                              width: 35.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                              ),
                              child: Center(
                                child: SvgAsset(
                                  assetName: AssetName.heart,
                                  height: 24.w,
                                  width: 24.w,
                                  color: isHeartIconTapped!
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 87.h,
                decoration: BoxDecoration(
                    color: Colors.black,
                    gradient: LinearGradient(
                        stops: [
                          0,
                          1
                        ],
                        colors: [
                          Colors.black87,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
                child: Center(
                  child: accessButtonsBotum(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onStartButtonPressed() {}

  void onBackIconTapped() {
    Get.back();
  }

  void onHeartIconTapped() {
    setState(() {
      isHeartIconTapped = !isHeartIconTapped!;
    });
  }

  Widget _buildChip(String label, Color color, IconData icon,
      VoidCallback function) {
    return ActionChip(
      labelPadding: EdgeInsets.all(4.0),
      avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: FaIcon(icon, color: Colors.white)),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
      onPressed: function,
    );
  }

  accessButtonsBotum() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 8.0,
      children: <Widget>[
        _buildChip('Facebook', Color(0xff4267b2), FontAwesomeIcons.facebook,
                () => {_openFacebook()}),
        _buildChip('Phone', Color(0xff99b898), FontAwesomeIcons.phone,
                () => {_launchPhone()}),
        _buildChip('Maps', Color(0xffe83845), FontAwesomeIcons.map,
                () => {_launchMaps()}),
      ],
    );
  }

  _launchMaps() async {
    // https://maps.google.com/?q=term
    const url =
        "https://www.google.com/maps/place/7+All.+des+%C3%89pines,+78180+Montigny-le-Bretonneux/@48.780737,2.0339453,17z/data=!3m1!4b1!4m5!3m4!1s0x47e68132b07453dd:0x1bb350f749e436c4!8m2!3d48.780737!4d2.036134";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Maps';
    }
  }

  _launchPhone() async {
    launch("tel://214324234");
  }

  void _openFacebook() async {
    /* numeric value ကို https://lookup-id.com/ မှာ ရှာပါ */
    String fbProtocolUrl = "fb://page/110486103786309";
    String fallbackUrl = "https://www.facebook.com/HomeMerx-116318213613656";
    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);
      print("launching..." + fbProtocolUrl);
      if (!launched) {
        print("can't launch");
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      print("can't launch exp " + e.toString());
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  priceAndPeriod() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 8.0,
      children: <Widget>[
        _buildChip(widget.event.price.toString(), Color(0xff4267b2),
            FontAwesomeIcons.euroSign, () => {}),
        _buildChip(widget.event.period, Color(0xff288ba8), FontAwesomeIcons.dna,
                () => {}),
      ],
    );
  }
}
