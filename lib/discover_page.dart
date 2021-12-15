import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/detail_page.dart';
import 'package:meditation/icons.dart';
import 'package:meditation/widgets/category_boxes.dart';
import 'package:meditation/widgets/discover_card.dart';
import 'package:meditation/widgets/discover_small_card.dart';
import 'package:meditation/widgets/svg_asset.dart';

import 'shared/menu_drawer.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/dancing_02.jpg'), fit: BoxFit.cover)),
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 28.w,
                  right: 18.w,
                  top: 36.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("DiscoverxX",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 34.w,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      borderRadius: BorderRadius.circular(360),
                      onTap: onSearchIconTapped,
                      child: Container(
                        height: 35.w,
                        width: 35.w,
                        child: Center(
                          child: SvgAsset(
                            assetName: AssetName.search,
                            height: 24.w,
                            width: 24.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 120.h,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 90.w,
                    ),
                    CategoryBoxes(
                      text: "Salsa",
                      onPressed: (value) => print(value),
                    ),
                    CategoryBoxes(
                      text: "Batchata",
                      onPressed: (value) => print(value),
                    ),
                    CategoryBoxes(
                      text: "Kizomba",
                      onPressed: (value) => print(value),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommendexxxd",
                      style: TextStyle(
                          color: Color(0xff515979),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.w),
                    ),
                    GestureDetector(
                        onTap: onSeeAllTapped,
                        child: Text("See All",
                            style: TextStyle(
                                color: Color(0xff4A80F0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.w)))
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 176.w,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 28.w),
                    DiscoverCard(
                      tag: "sleepMeditation",
                      onTap: onSleepMeditationTapped,
                      title: "Sleep Meditation",
                      subtitle: "7 Day Audio and Video Series",
                    ),
                    SizedBox(width: 20.w),
                    DiscoverCard(
                      onTap: onDepressionHealingTapped,
                      title: "Depression Healing",
                      subtitle: "10 Days Audio and Video Series",
                      gradientStartColor: Color(0xffFC67A7),
                      gradientEndColor: Color(0xffF6815B),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10.w,
                      mainAxisExtent: 125.w,
                      mainAxisSpacing: 10.w),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DiscoverSmallCard(
                      onTap: () {

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage()));
                      },
                      subtitle: 'Carrières sur Seinew',
                      title: "Cours de kizomba",
                      price: 8,
                      startTime: '20h00',
                      gradientStartColor: Color(0xff13DEA0),
                      gradientEndColor: Color(0xff06B782),
                    ),
                    DiscoverSmallCard(
                      onTap: () {},
                      title: "Caribe Noche SBK",
                      subtitle: 'Versailles',
                      price: 12,
                      startTime: '20h30',
                      gradientStartColor: Color(0xffFC67A7),
                      gradientEndColor: Color(0xffF6815B),
                      icon: SvgAsset(
                        assetName: AssetName.tape,
                        height: 24.w,
                        width: 24.w,
                      ),
                    ),
                    DiscoverSmallCard(
                      onTap: () {},
                      title: "Mercredi SBK",
                      subtitle: 'Chambourcy',
                      price: 10,
                      startTime: '20h00',
                      gradientStartColor: Color(0xffFFD541),
                      gradientEndColor: Color(0xffF0B31A),
                    ),
                    DiscoverSmallCard(
                      onTap: onSleepMeditationTapped,
                      title: "Tips For Sleeping",
                      subtitle: 'hellos',
                      startTime: '19h30',
                      icon: SvgAsset(
                        assetName: AssetName.tape,
                        height: 24.w,
                        width: 24.w,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSeeAllTapped() {}

  void onSleepMeditationTapped() {
    print('hellox');
    Get.to(() => DetailPage(), transition: Transition.rightToLeft);
  }

  void onDepressionHealingTapped() {}

  void onSearchIconTapped() {}
}
