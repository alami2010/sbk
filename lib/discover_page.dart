import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_dance/shared/event.dart';
import 'package:go_dance/widgets/discover_card.dart';
import 'package:go_dance/widgets/discover_small_card.dart';
import 'package:go_dance/widgets/svg_asset.dart';
import 'package:url_launcher/url_launcher.dart';

import 'detail_page.dart';
import 'drop_down.dart';
import 'icons.dart';
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
  TextEditingController textEditingController = TextEditingController();

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
        child: SingleChildScrollView(
          child: Column(
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[Text('Filtres'), Icon(Icons.apps)],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text('Autour de moi'),
                          Icon(Icons.apps)
                        ],
                      ),
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
                      new ListTile(
                        onTap: () {
                          selectVilleFilter(context);
                        },
                        title: new Text('Ville'),
                        trailing: const Icon(Icons.more_vert),
                      ),
                      new ListTile(
                        onTap: () {
                          selectDanceFilter(context);
                        },
                        title: new Text('Dance'),
                        trailing: const Icon(Icons.more_vert),
                      ),
                      new ListTile(
                        onTap: () {
                          _pickDateDialog();
                        },
                        title: new Text('Date'),
                        trailing: const Icon(Icons.more_vert),
                      ),
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

  void selectDanceFilter(BuildContext context) {
    DropDownState(
      DropDown(
        submitButtonText: "Valider",
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        searchHintText: "Selectionnez une dance",
        bottomSheetTitle: "Dances",
        searchBackgroundColor: Colors.blue,
        dataList: [
          SelectedListItem(false, 'SALSA'),
          SelectedListItem(false, 'KIZOMBA'),
          SelectedListItem(false, 'BATCHATA')
        ],
        selectedItems: (List<dynamic> selectedList) {
          print(selectedList.toString());
        },
        selectedItem: (String selected) {
          print(selected);
        },
        enableMultipleSelection: true,
        searchController: textEditingController,
      ),
    ).showModal(context);
  }

  void selectVilleFilter(BuildContext context) {
    DropDownState(
      DropDown(
        submitButtonText: "Valider",
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        searchHintText: "Selectionnez votre ville",
        bottomSheetTitle: "Villes",
        searchBackgroundColor: Colors.blue,
        dataList: [
          SelectedListItem(false, 'Montigny le bretonneux'),
          SelectedListItem(false, 'Poissy'),
          SelectedListItem(false, 'Creteil')
        ],
        selectedItems: (List<dynamic> selectedList) {
          print(selectedList.toString());
        },
        selectedItem: (String selected) {
          print(selected);
        },
        enableMultipleSelection: true,
        searchController: textEditingController,
      ),
    ).showModal(context);
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
}
