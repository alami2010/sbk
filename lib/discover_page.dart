import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/detail_page.dart';
import 'package:meditation/icons.dart';
import 'package:meditation/shared/event.dart';
import 'package:meditation/widgets/category_boxes.dart';
import 'package:meditation/widgets/discover_card.dart';
import 'package:meditation/widgets/discover_small_card.dart';
import 'package:meditation/widgets/svg_asset.dart';
import 'package:url_launcher/url_launcher.dart';

import 'shared/menu_drawer.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<Event> events = [];
  DateTime _selectedDate = DateTime.now();
  WhyFarther? _selection;

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime.now(),
            lastDate: DateTime(
                2030)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
        print(_selectedDate);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readJson(); //running initialisation code; getting prefs etc.
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/event.json');
    final data = await json.decode(response);

    List<Event> myModels =
        (json.decode(response) as List).map((i) => Event.fromJson(i)).toList();
    print('youssef');
    print(myModels);

    setState(() {
      this.events = myModels;
    });
  }

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
                  top: 0.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 100,
                        child: Image.asset('assets/logo.png')),
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
                child: Container(
                  color: Colors.white70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // This is the type used by the popup menu below.
                      popupMenu,
                      PopupMenuButton<WhyFarther>(
                        onSelected: (WhyFarther result) {
                          setState(() {
                            _selection = result;
                          });
                        },
                        color: Colors.white70,
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<WhyFarther>>[
                          const PopupMenuItem<WhyFarther>(
                            value: WhyFarther.harder,
                            child: Text('Working a lot harder'),
                          ),
                          const PopupMenuItem<WhyFarther>(
                            value: WhyFarther.smarter,
                            child: Text('Being a lot smarter'),
                          ),
                          const PopupMenuItem<WhyFarther>(
                            value: WhyFarther.selfStarter,
                            child: Text('Being a self-starter'),
                          ),
                          const PopupMenuItem<WhyFarther>(
                            value: WhyFarther.tradingCharter,
                            child: Text('Placed in charge of trading charter'),
                          ),
                        ],
                      ),
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
                      onTap: () {
                        onSleepMeditationTapped();
                      },
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
                  children: buildDiscoverSmallCard(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DiscoverSmallCard> buildDiscoverSmallCard() {
    List<DiscoverSmallCard> cards = [];

    this.events.forEach((element) {
      cards.add(DiscoverSmallCard(
          event: element,
          onTap: () {
            goToDetail(element);
          },
          icon: SvgAsset(
            assetName: AssetName.tape,
            height: 24.w,
            width: 24.w,
          )));
    });

    return cards;
  }

  void onSeeAllTapped() {
    _pickDateDialog();

// This menu button widget updates a _selection field (of type WhyFarther,
// not shown here).
  }

  void onSleepMeditationTapped() {
    print('hellox');
  }

  void goToDetail(Event event) {
    print('hellox' + event.toString());
    Get.to(() => DetailPage(event), transition: Transition.rightToLeft);
  }

  void onDepressionHealingTapped() {}

  void onSearchIconTapped() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white12,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _doSomething(String value) {
    print(value);
  }

  _launchMaps() async {
    const url =
        "https://www.google.com/maps/search/?api=1&query=LATITUDE,LONGITUDE,17&query_place_id=PLACE_ID";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Maps';
    }
  }

  late final popupMenu = new PopupMenuButton(
    child: new ListTile(
      title: new Text('Doge or lion?'),
      trailing: const Icon(Icons.more_vert),
    ),
    itemBuilder: (_) => <PopupMenuItem<String>>[
      new PopupMenuItem<String>(child: new Text('Doge'), value: 'Doge'),
      new PopupMenuItem<String>(child: new Text('Lion'), value: 'Lion'),
    ],
    onSelected: (value) => _doSomething(value),
  );
}
