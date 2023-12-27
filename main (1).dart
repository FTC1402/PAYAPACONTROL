//import 'package:file_picker/file_picker.dart';
//import 'package:farm/notify.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
//import 'dart:collection';
//import 'dart:isolate';
import 'dart:async';
import 'package:shamsi_date/shamsi_date.dart' as shamsi;
//import 'package:path/path.dart';
//import 'package:get/get.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_launcher_icons/abs/icon_generator.dart';
// import 'package:flutter_launcher_icons/android.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:flutter/cupertino.dart' as cuper;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sms/flutter_sms.dart';

//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Route Menu_device_route =
    MaterialPageRoute(builder: (context) => const Menu_device());
// Route Main_page_route2 = MaterialPageRoute(builder: (context) => const Main_page2());
// Route Actuator_route1 = MaterialPageRoute(builder: (context) => const Actuator1());
// Route Actuator_route2 = MaterialPageRoute(builder: (context) => const Actuator1());
// Main_page dev0 = Main_page(0);
// Main_page dev1 = Main_page(1);
// Main_page dev2 = Main_page(2);
// Main_page dev3 = Main_page(3);
// Main_page dev4 = Main_page(4);
// Main_page dev5 = Main_page(5);
// Main_page dev6 = Main_page(6);
// Main_page dev7 = Main_page(7);
// int index0 = 0;
// int index1 = 0;
// int index2 = 0;
// int index3 = 0;
// int index4 = 0;
// int index5 = 0;
// int index6 = 0;
// int index7 = 0;
bool firstLogin = true;
int active_menu_dev = 0;
int count_menu = 0;
int zone_name = 1;
List<String> values_sensor = List.filled(4, 'nan');
bool menu_device_active = false;
int count_pin_images = 2;
bool created_Actuator1 = false;
bool created_Actuator2 = false;
final myScrollController = ScrollController();
var defaultTabController;
//bool first_text_edit1 = true;
String logged_id = '';
List<String> address_images = ["images/key.jpeg","images/relay.jpeg","images/led-removebg-preview.png"];
List<String> address_images_sensors = [
  "images/humid-removebg-preview.png",
  "images/temp-removebg-preview.png"
];
// int count_Main_page1 = 0;
// int count_Main_page2 = 0;
SalesData s = new SalesData('Feb', 35);
List<SalesData> received_data = [s];
List<Tab> tabs = [];
List<Main_page> zones = [];
List<String> zones_sensors = [];
List<String> tab_names = [];
List<List<String>> onoff_scenarios = [];
List<List<bool>> active_scenarios = [];
List<List<bool>> visibilities = [];
List<List<Duration?>> _selectedTimes = [];
List<List<Jalali?>> _selectedDates = [];
List<List<int>> num_outputs = [];
List<int> count_scheduling = [];
List<List<String>> onoff_button_outputs = List<List<String>>.filled(
    8, List<String>.filled(2, 'off.png', growable: false),
    growable: true);
//List<Color> colors1 = List<Color>.filled(4, Colors.grey, growable: false)
//List<List<Color>> colors = List<List<Color>>.filled(8, List<Color>.filled(4, Colors.grey, growable: false), growable: true);
//List<String> onoff_button_outputs2 = List<String>.filled(4, 'off', growable: false);
//List<Color> colors2 = List<Color>.filled(4, Colors.grey, growable: false);
//List<String> onoff_scenario1 = List<String>.filled(20, 'off', growable: false);

//List<List<String>> onoff_scenarios = List<List<String>>.filled(1, List<String>.filled(20, 'off', growable: false), growable: true);
//List<bool> active_scenario1 = List<bool>.filled(20, false, growable: false);
//List<List<bool>> active_scenarios = List<List<bool>>.filled(1, List<bool>.filled(20, false, growable: false), growable: true);
List<List<int>> active_images = List<List<int>>.filled(
    8, List<int>.filled(2, 0, growable: false),
    growable: true);
List<List<int>> active_images_sensors = List<List<int>>.filled(
    8, List<int>.filled(6, 0, growable: false),
    growable: true);
List<String> notifs_txt = ["", "", "", "", "", "", "", "", "", "", "", "", ""];
List<String> notifs_time = ["", "", "", "", "", "", "", "", "", "", "", "", ""];
//List<List<String>> notifs_txts = List<List<String>>.filled(8, notifs_txt, growable: true);
//List<List<String>> notifs_times = List<List<String>>.filled(8, notifs_time, growable: true);

//List<int> num_output = List<int>.filled(20, 1, growable: false);
//List<List<int>> num_outputs = List<List<int>>.filled(1, List<int>.filled(20, 1, growable: false), growable: true);
//TextEditingController on_hour_controller = TextEditingController();
// List<TextEditingController> on_hour_controller1 = List<TextEditingController>.filled(20, TextEditingController(), growable: false);
// List<TextEditingController> on_minute_controller1 = List<TextEditingController>.filled(20, TextEditingController(), growable: false);
// List<TextEditingController> output_controller1 = List<TextEditingController>.filled(20, TextEditingController(), growable: false);
// List<TextEditingController> off_hour_controller1 = List<TextEditingController>.filled(20, TextEditingController(), growable: false);
// List<TextEditingController> off_minute_controller1 = List<TextEditingController>.filled(20, TextEditingController(), growable: false);
//List<bool> visibility1 = List<bool>.filled(20, false, growable: false);
//List<List<bool>> visibilities = List<List<bool>>.filled(1, List<bool>.filled(20, false, growable: false), growable: true);
//List<List<Duration?>> _selectedTimes = List<List<Duration?>>.filled(1, List<Duration?>.filled(20, null, growable: false), growable: false);
//List<List<Jalali?>> _selectedDates = List<List<Jalali?>>.filled(1, List<Jalali?>.filled(20, null, growable: false), growable: false);
var devices = [''];
// int count_scheduling0 = 0;
// int count_scheduling2 = 0;
// int count_scheduling3 = 0;
// int count_scheduling4 = 0;
// int count_scheduling5 = 0;
// int count_scheduling6 = 0;
// int count_scheduling7 = 0;
//List<Color> color_scenario1 = List<Color>.filled(20, Colors.grey, growable: false);
//List<List<Color>> color_scenarios = List<List<Color>>.filled(1, List<Color>.filled(20, Colors.grey, growable: false), growable: true);
int current_device = 0;
int current_tab = 0;
int current_pin = 0;
int current_sensor = 0;
File? _backgroundImage;
String room1 = 'zone1';
String room2 = 'zone2';
String room3 = 'zone3';
String room4 = 'zone4';
String room5 = 'zone5';
String room6 = 'zone6';
String room7 = 'zone7';
String room8 = 'zone8';
String room9 = 'zone9';
String room10 = 'zone10';
TextEditingController controllerRoom1 = TextEditingController();
TextEditingController controllerRoom2 = TextEditingController();
TextEditingController controllerRoom3 = TextEditingController();
TextEditingController controllerRoom4 = TextEditingController();
TextEditingController controllerRoom5 = TextEditingController();
TextEditingController controllerRoom6 = TextEditingController();
TextEditingController controllerRoom7 = TextEditingController();
TextEditingController controllerRoom8 = TextEditingController();
TextEditingController controllerRoom9 = TextEditingController();
TextEditingController controllerRoom10 = TextEditingController();
Future<void> _pickImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    // setState(() {
    _backgroundImage = File(pickedImage.path);
    // });
  }
}

//final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// Notify.initialize(flutterLocalNotificationsPlugin);

//elements.add(s);
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // void mydelay()
  // {
  //     Future.delayed(Duration(seconds: 3)).then((_)
  //             {

  //                 onoff_button_outputs1[3] = 'Ali';
  //                 print('ali');
  //             });
  // }
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 8; i++) {
      active_images[i] = List<int>.filled(2, 0, growable: false);
      active_images_sensors[i] = List<int>.filled(6, 0, growable: false);
      onoff_button_outputs[i] =
          List<String>.filled(2, 'off.png', growable: false);
    }

    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        //responsive
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      title: 'Localizations Sample App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'),
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavigationDrawer(),
        //appBar: AppBar(title: const Text('منو'),
        //backgroundColor: Colors.red),
        appBar: null,
        body: const Login(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "Roya",
      ),
    );
  }
}

/*class Chart1 extends StatefulWidget
{
  const Chart1({Key? key}) : super(key: key);
 
  @override
  State<Chart1> createState() => _Chart1();
}*/
class EnglishStyle extends StatelessWidget {
  final Color color_;
  final double size_;
  final String text_;
  //const EnglishStyle(this.text_, {Key? key, this.size_ = 15, this.color_ =  Colors.white}) : super(key: key);
  const EnglishStyle(
    this.text_,
    this.color_, {
    Key? key,
    this.size_ = 15,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Text(
        text_,
        style: TextStyle(
            color: color_,
            fontWeight: FontWeight.bold,
            fontFamily: "Open_Sans",
            fontSize: size_),
      );
}

class PersianStyle extends StatelessWidget {
  final Color color_;
  final double size_;
  final String text_;
  const PersianStyle(this.text_,
      {Key? key, this.size_ = 15, this.color_ = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text_,
        style: TextStyle(
            color: color_,
            fontWeight: FontWeight.w500,
            fontFamily: "Roya",
            fontSize: size_),
      );
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

/*class _Chart1 extends State<Chart1>
{

  
@override
  Widget build(BuildContext context) 
  {
    received_data = <SalesData>[
                    SalesData('Jan', 35),
                    SalesData('Feb', 28),
                    SalesData('Mar', 34),
                    SalesData('Apr', 32),
                    SalesData('May', 40),
                    SalesData('Sep', 65)
                  ];
    received_data.add(SalesData('Aug', 65));
    return Scaffold(
      body: Center(
          child: Container(
            child: SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),

              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // Bind data source
                  dataSource:  received_data,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales
                )
              ]
            )
          )
        )
    );
  }
}*/

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('تنظیمات'),
          // backgroundColor: Color.fromARGB(255, 201, 196, 196),
          // foregroundColor: Colors.black,
          // leading: new IconButton
          // (
          //       icon: new Icon(Icons.arrow_back),
          //       onPressed: ()
          //       {
          //
          //       }
          // ),
        ),
        body: ListView(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              width: _mediaQueryData.size.width * 0.7,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                    //primary: Color.fromARGB(255, 201, 196, 196),
                    ),
                child: const Text(
                  'انتخاب عکس',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              width: _mediaQueryData.size.width * 0.7,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ZoneName()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    //primary: Color.fromARGB(255, 201, 196, 196),
                    ),
                child: const Text(
                  'تغییر اسم اتاق‌ها',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ]),
        ]));
  }
}

class Images_of_pin extends StatefulWidget {
  const Images_of_pin({Key? key}) : super(key: key);
  @override
  State<Images_of_pin> createState() => _Images_of_pin();
}

class _Images_of_pin extends State<Images_of_pin> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    bool active_image0 = false;
    bool active_image1 = false;
    bool active_image2 = false;
    if (active_images[current_device][current_pin] == 0) {
      active_image0 = true;
    } else if (active_images[current_device][current_pin] == 1) {
      active_image1 = true;
    } else if (active_images[current_device][current_pin] == 2) {
      active_image2 = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('منوی انتخاب عکس خروجی'),
        // backgroundColor: Color.fromARGB(255, 201, 196, 196),
        // foregroundColor: Colors.black,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()))
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Menu_device()));
            }),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   alignment: Alignment.center,
                //   padding: const EdgeInsets.all(5), //distance from up and down
                //   child: const Text(
                //     '',
                //     style: TextStyle(
                //         color: Colors.black54,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 0),
                //   ),
                // ),
                Container(
                  width: _mediaQueryData.size.width * 0.3,
                  // padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "images/key.jpeg",
                    fit: BoxFit.cover,
                    // height: _mediaQueryData.size.height * 0.13,
                    // width: _mediaQueryData.size.width * 0.13,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  width: _mediaQueryData.size.width * 0.15,
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.only(right: 30),
                  child: const Text(
                    'کلید',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 16, 203),
                        fontWeight: FontWeight.w200,
                        fontSize: 20),
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  width: _mediaQueryData.size.width * 0.4,
                  // padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                  child: CheckboxListTile(
                    title: const Text(
                      "فعالسازی",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 172, 6),
                      ),
                    ),
                    activeColor: Colors.purple,
                    value: active_image0,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (newValue) {
                      setState(
                        () {
                          // if(active_image0)
                          // {
                          //     active_image0 = false;
                          // }

                          if (active_image0 == false) {
                            active_image0 = true;
                            active_image1 = false;
                            active_image2 = false;
                            active_images[current_device][current_pin] = 0;
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   alignment: Alignment.center,
                //   // padding: const EdgeInsets.all(5),
                //   child: const Text(
                //     '',
                //     style: TextStyle(
                //         color: Colors.black54,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 0),
                //   ),
                // ),
                Container(
                  width: _mediaQueryData.size.width * 0.3,
                  // padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "images/relay.jpeg",
                    fit: BoxFit.cover,
                    // height: _mediaQueryData.size.height * 0.13,
                    // width: _mediaQueryData.size.width * 0.07,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  alignment: Alignment.center,
                  width: _mediaQueryData.size.width * 0.15,
                  // padding: const EdgeInsets.only(
                  //   right: 30
                  // ),
                  child: const Text(
                    'رله',
                    style: TextStyle(
                        color: Color.fromARGB(255, 54, 58, 180),
                        fontWeight: FontWeight.w200,
                        fontSize: 20),
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  width: _mediaQueryData.size.width * 0.4,
                  // padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                  //         child: Expanded
                  // (
                  child: CheckboxListTile(
                    title: const Text(
                      "فعالسازی",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 172, 6),
                      ),
                    ),
                    activeColor: Colors.purple,
                    value: active_image1,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (newValue) {
                      setState(
                        () {
                          if (active_image1 == false) {
                            active_image1 = true;
                            active_image0 = false;
                            active_image2 = false;
                            active_images[current_device][current_pin] = 1;
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   alignment: Alignment.center,
                //   // padding: const EdgeInsets.all(5),
                //   child: const Text(
                //     '',
                //     style: TextStyle(
                //         color: Colors.black54,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 0),
                //   ),
                // ),
                Container(
                  width: _mediaQueryData.size.width * 0.3,
                  //alignment: Alignment.,
                  // padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "images/led-removebg-preview.png",
                    fit: BoxFit.cover,
                    // height: _mediaQueryData.size.height * 0.13,
                    // width: _mediaQueryData.size.width * 0.07,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  width: _mediaQueryData.size.width * 0.15,
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.fromLTRB(
                  //     0, 0, 38, 0),
                  child: const Text(
                    'لامپ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 16, 203),
                        fontWeight: FontWeight.w200,
                        fontSize: 20),
                  ),
                ),
                Container(
                    // color: Colors.yellow,
                    width: _mediaQueryData.size.width * 0.4,
                    // padding: const EdgeInsets.fromLTRB(0, 5, 52, 5),
                    //child: Expanded
                    //(
                    child: CheckboxListTile(
                      title: const Text(
                        "فعالسازی",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 172, 6),
                        ),
                      ),
                      activeColor: Colors.purple,
                      value: active_image2,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (newValue) {
                        setState(
                          () {
                            // if(active_image0)
                            // {
                            //     active_image0 = false;
                            // }

                            if (active_image2 == false) {
                              active_image2 = true;
                              active_image1 = false;
                              active_image0 = false;
                              active_images[current_device][current_pin] = 2;
                            }
                          },
                        );
                      },
                    )
                    //)
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Images_of_sensor extends StatefulWidget {
  const Images_of_sensor({Key? key}) : super(key: key);
  @override
  State<Images_of_sensor> createState() => _Images_of_sensor();
}

class _Images_of_sensor extends State<Images_of_sensor> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    bool active_image0 = false;
    bool active_image1 = false;
    if (active_images_sensors[current_device][current_sensor] == 0) {
      active_image0 = true;
    } else if (active_images_sensors[current_device][current_sensor] == 1) {
      active_image1 = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('منوی انتخاب عکس سنسور'),
        // backgroundColor: Color.fromARGB(255, 201, 196, 196),
        // foregroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()))
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Menu_device()));
            }),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(5), //distance from up and down
                //     child: const Text(
                //       '',
                //       style: TextStyle(
                //           color: Colors.black54,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 0),
                //     ),),
                Container(
                  //alignment: Alignment.,
                  width: _mediaQueryData.size.width * 0.3,
                  // padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "images/humid-removebg-preview.png",
                    fit: BoxFit.cover,
                    // height: _mediaQueryData.size.height * 0.13,
                    // width: _mediaQueryData.size.width * 0.07,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  width: _mediaQueryData.size.width * 0.15,
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.all(5),
                  child: const Text(
                    'رطوبت',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 16, 203),
                        fontWeight: FontWeight.w200,
                        fontSize: 20),
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  width: _mediaQueryData.size.width * 0.4,
                  // padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                  child: CheckboxListTile(
                    title: const Text(
                      "فعالسازی",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 172, 6),
                      ),
                    ),
                    activeColor: Colors.purple,
                    value: active_image0,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (newValue) {
                      setState(() {
                        // if(active_image0)
                        // {
                        //     active_image0 = false;
                        // }

                        if (active_image0 == false) {
                          active_image0 = true;
                          active_image1 = false;
                          active_images_sensors[current_device]
                              [current_sensor] = 0;
                        }
                      });
                    },
                  ),
                  //)
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //     alignment: Alignment.center,
                //     // padding: const EdgeInsets.all(5),
                //     child: Text(
                //       '',
                //       style: TextStyle(
                //           color: Colors.black54,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 0),
                //     )),
                Container(
                  //alignment: Alignment.,
                  width: _mediaQueryData.size.width * 0.2,
                  margin: EdgeInsets.symmetric(
                      horizontal: _mediaQueryData.size.width * 0.05),
                  child: Image.asset(
                    "images/temp-removebg-preview.png",
                    fit: BoxFit.cover,
                    // height: _mediaQueryData.size.height * 0.13,
                    // width: _mediaQueryData.size.width * 0.07,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  alignment: Alignment.center,
                  width: _mediaQueryData.size.width * 0.15,
                  // padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: const Text(
                    'دما',
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 16, 203),
                        fontWeight: FontWeight.w200,
                        fontSize: 20),
                  ),
                ),
                Container(
                    // color: Colors.yellow,
                    width: _mediaQueryData.size.width * 0.4,
                    // padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
                    child: CheckboxListTile(
                      title: const Text(
                        "فعالسازی",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 172, 6),
                        ),
                      ),
                      activeColor: Colors.purple,
                      value: active_image1,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (newValue) {
                        setState(
                          () {
                            if (active_image1 == false) {
                              active_image1 = true;
                              active_image0 = false;
                              active_images_sensors[current_device]
                                  [current_sensor] = 1;
                            }
                          },
                        );
                      },
                    )
                    //)
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Add_zone extends StatefulWidget {
  const Add_zone({Key? key}) : super(key: key);
  @override
  State<Add_zone> createState() => _Add_zone();
}

class _Add_zone extends State<Add_zone> {
  bool active_d1p1 = false;
  bool active_d1p2 = false;
  bool active_d2p1 = false;
  bool active_d2p2 = false;
  bool active_d3p1 = false;
  bool active_d3p2 = false;
  bool active_d4p1 = false;
  bool active_d4p2 = false;
  bool active_d5p1 = false;
  bool active_d5p2 = false;
  bool active_d6p1 = false;
  bool active_d6p2 = false;
  bool active_d7p1 = false;
  bool active_d7p2 = false;
  bool active_d8p1 = false;
  bool active_d8p2 = false;
  bool active_d1s1 = false;
  bool active_d1s2 = false;
  bool active_d1s3 = false;
  bool active_d1s4 = false;
  bool active_d1s5 = false;
  bool active_d1s6 = false;
  bool active_d2s1 = false;
  bool active_d2s2 = false;
  bool active_d2s3 = false;
  bool active_d2s4 = false;
  bool active_d2s5 = false;
  bool active_d2s6 = false;
  bool active_d3s1 = false;
  bool active_d3s2 = false;
  bool active_d3s3 = false;
  bool active_d3s4 = false;
  bool active_d3s5 = false;
  bool active_d3s6 = false;
  bool active_d4s1 = false;
  bool active_d4s2 = false;
  bool active_d4s3 = false;
  bool active_d4s4 = false;
  bool active_d4s5 = false;
  bool active_d4s6 = false;
  bool active_d5s1 = false;
  bool active_d5s2 = false;
  bool active_d5s3 = false;
  bool active_d5s4 = false;
  bool active_d5s5 = false;
  bool active_d5s6 = false;
  bool active_d6s1 = false;
  bool active_d6s2 = false;
  bool active_d6s3 = false;
  bool active_d6s4 = false;
  bool active_d6s5 = false;
  bool active_d6s6 = false;
  bool active_d7s1 = false;
  bool active_d7s2 = false;
  bool active_d7s3 = false;
  bool active_d7s4 = false;
  bool active_d7s5 = false;
  bool active_d7s6 = false;
  bool active_d8s1 = false;
  bool active_d8s2 = false;
  bool active_d8s3 = false;
  bool active_d8s4 = false;
  bool active_d8s5 = false;
  bool active_d8s6 = false;

  void notifyButtom(notificationText) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text(
        notificationText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      // backgroundColor: notificationBgColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('اضافه کردن ناحیه'),
            // backgroundColor: Color.fromARGB(255, 201, 196, 196),
            // foregroundColor: Colors.black,
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()))
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()));
                  Menu_device_route = MaterialPageRoute(
                      builder: (context) => const Menu_device());
                  Navigator.push(context, Menu_device_route);
                }),
            actions: [
              IconButton(
                  icon: new Icon(Icons.add_home),
                  //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()))
                  onPressed: () async {
                    //create zone
                    String pins_sens = '';
                    if (active_d1p1) {
                      pins_sens += '0-0,';
                    }
                    if (active_d1p2) {
                      pins_sens += '0-1,';
                    }
                    if (active_d2p1) {
                      pins_sens += '1-0,';
                    }
                    if (active_d2p2) {
                      pins_sens += '1-1,';
                    }
                    if (active_d3p1) {
                      pins_sens += '2-0,';
                    }
                    if (active_d3p2) {
                      pins_sens += '2-1,';
                    }
                    if (active_d4p1) {
                      pins_sens += '3-0,';
                    }
                    if (active_d4p2) {
                      pins_sens += '3-1,';
                    }
                    if (active_d5p1) {
                      pins_sens += '4-0,';
                    }
                    if (active_d5p2) {
                      pins_sens += '4-1,';
                    }
                    if (active_d6p1) {
                      pins_sens += '5-0,';
                    }
                    if (active_d6p2) {
                      pins_sens += '5-1,';
                    }
                    if (active_d7p1) {
                      pins_sens += '6-0,';
                    }
                    if (active_d7p2) {
                      pins_sens += '6-1,';
                    }
                    if (active_d8p1) {
                      pins_sens += '7-0,';
                    }
                    if (active_d8p2) {
                      pins_sens += '7-1,';
                    }
                    //add sensor
                    pins_sens += '&';
                    if (active_d1s1) {
                      pins_sens += '0-0,';
                    }
                    if (active_d1s2) {
                      pins_sens += '0-1,';
                    }
                    if (active_d1s3) {
                      pins_sens += '0-2,';
                    }
                    if (active_d1s4) {
                      pins_sens += '0-3,';
                    }
                    if (active_d1s5) {
                      pins_sens += '0-4,';
                    }
                    if (active_d1s6) {
                      pins_sens += '0-5,';
                    }
                    if (active_d2s1) {
                      pins_sens += '1-0,';
                    }
                    if (active_d2s2) {
                      pins_sens += '1-1,';
                    }
                    if (active_d2s3) {
                      pins_sens += '1-2,';
                    }
                    if (active_d2s4) {
                      pins_sens += '1-3,';
                    }
                    if (active_d2s5) {
                      pins_sens += '1-4,';
                    }
                    if (active_d2s6) {
                      pins_sens += '1-5,';
                    }
                    if (active_d3s1) {
                      pins_sens += '2-0,';
                    }
                    if (active_d3s2) {
                      pins_sens += '2-1,';
                    }
                    if (active_d3s3) {
                      pins_sens += '2-2,';
                    }
                    if (active_d3s4) {
                      pins_sens += '2-3,';
                    }
                    if (active_d3s5) {
                      pins_sens += '2-4,';
                    }
                    if (active_d3s6) {
                      pins_sens += '2-5,';
                    }
                    if (active_d4s1) {
                      pins_sens += '3-0,';
                    }
                    if (active_d4s2) {
                      pins_sens += '3-1,';
                    }
                    if (active_d4s3) {
                      pins_sens += '3-2,';
                    }
                    if (active_d4s4) {
                      pins_sens += '3-3,';
                    }
                    if (active_d4s5) {
                      pins_sens += '3-4,';
                    }
                    if (active_d4s6) {
                      pins_sens += '3-5,';
                    }
                    if (active_d5s1) {
                      pins_sens += '4-0,';
                    }
                    if (active_d5s2) {
                      pins_sens += '4-1,';
                    }
                    if (active_d5s3) {
                      pins_sens += '4-2,';
                    }
                    if (active_d5s4) {
                      pins_sens += '4-3,';
                    }
                    if (active_d5s5) {
                      pins_sens += '4-4,';
                    }
                    if (active_d5s6) {
                      pins_sens += '4-5,';
                    }
                    if (active_d6s1) {
                      pins_sens += '5-0,';
                    }
                    if (active_d6s2) {
                      pins_sens += '5-1,';
                    }
                    if (active_d6s3) {
                      pins_sens += '5-2,';
                    }
                    if (active_d6s4) {
                      pins_sens += '5-3,';
                    }
                    if (active_d6s5) {
                      pins_sens += '5-4,';
                    }
                    if (active_d6s6) {
                      pins_sens += '5-5,';
                    }
                    if (active_d7s1) {
                      pins_sens += '6-0,';
                    }
                    if (active_d7s2) {
                      pins_sens += '6-1,';
                    }
                    if (active_d7s3) {
                      pins_sens += '6-2,';
                    }
                    if (active_d7s4) {
                      pins_sens += '6-3,';
                    }
                    if (active_d7s5) {
                      pins_sens += '6-4,';
                    }
                    if (active_d7s6) {
                      pins_sens += '6-5,';
                    }
                    if (active_d8s1) {
                      pins_sens += '7-0,';
                    }
                    if (active_d8s2) {
                      pins_sens += '7-1,';
                    }
                    if (active_d8s3) {
                      pins_sens += '7-2,';
                    }
                    if (active_d8s4) {
                      pins_sens += '7-3,';
                    }
                    if (active_d8s5) {
                      pins_sens += '7-4,';
                    }
                    if (active_d8s6) {
                      pins_sens += '7-5,';
                    }
                    zones.add(Main_page(pins_sens));
                    zones_sensors.add(pins_sens.split('&')[1]);
                    tab_names.add('zone' + zone_name.toString());
                    tabs.add(Tab(
                      icon: EnglishStyle
                      (
                          'zone' + zone_name.toString(), Colors.white),
                    ));
                    zone_name++;
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Menu_device_route = MaterialPageRoute(
                        builder: (context) => const Menu_device());
                    Navigator.push(context, Menu_device_route);
                    notifyButtom("اتاق ${zone_name - 1} ایجاد شد");
                    onoff_button_outputs.add(
                        List<String>.filled(2, 'off.png', growable: false));
                    onoff_scenarios
                        .add(List<String>.filled(20, 'off', growable: false));
                    active_scenarios
                        .add(List<bool>.filled(20, false, growable: false));
                    visibilities
                        .add(List<bool>.filled(20, false, growable: false));
                    _selectedTimes
                        .add(List<Duration?>.filled(20, null, growable: false));
                    _selectedDates
                        .add(List<Jalali?>.filled(20, null, growable: false));
                    num_outputs.add(List<int>.filled(20, 1, growable: false));
                    count_scheduling.add(0);

                    //save zones
                    Directory directory3 =
                        await getApplicationDocumentsDirectory();
                    File file3 = File('${directory3.path}/zones.txt');

                    //print(file);
                    String content_file3 = '';
                    for (int i = 0; i < zones.length - 1; i++) 
                    {
                      content_file3 +=
                          zones[i].pin_sen + '%' + tab_names[i] + '^';
                    }
                    int l = zones.length - 1;
                    if (l > -1)
                    {
                      content_file3 += zones[l].pin_sen + '%' + tab_names[l];
                      await file3.writeAsString(content_file3);
                    }
                  }),
            ]),
        body: ListView(children: <Widget>[
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(
                    0, 8, 5, 0), //distance from up and down
                child: EnglishStyle('Device${1}', Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // width: _mediaQueryData.size.width * 0.14,
                    // color: Colors.red,
                    width: 150,
                    padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                    child: CheckboxListTile(
                      title: EnglishStyle(
                        "Pin #2",
                        Color.fromARGB(255, 0, 172, 6),
                      ),
                      activeColor: Colors.purple,
                      value: active_d1p2,
                      controlAffinity: ListTileControlAffinity.leading,
                      // contentPadding: EdgeInsets.zero,
                      onChanged: (newValue) 
                      {
                        setState(
                          () {
                            if (active_d1p2) {
                              active_d1p2 = false;
                            } else {
                              active_d1p2 = true;
                            }
                          },
                        );
                      },
                    ),
                  ),
                  // Spacer(),
                  Container(
                    // width: _mediaQueryData.size.width * 0.14,
                    width: 150,
                    padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                    child: CheckboxListTile(
                      title: EnglishStyle(
                        "Pin  #1",
                        Color.fromARGB(255, 0, 172, 6),
                      ),
                      activeColor: Colors.purple,
                      value: active_d1p1,
                      controlAffinity: ListTileControlAffinity.leading,
                      // contentPadding: EdgeInsets.zero,
                      onChanged: (newValue) {
                        setState(
                          () {
                            if (active_d1p1) {
                              active_d1p1 = false;
                            } else {
                              active_d1p1 = true;
                            }
                          },
                        );
                      },
                    ),
                    //)
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}

class Delete_zone extends StatefulWidget {
  const Delete_zone({Key? key}) : super(key: key);
  @override
  State<Delete_zone> createState() => _Delete_zone();
}

class _Delete_zone extends State<Delete_zone> {
  void notifyButtom(notificationText) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text(
        notificationText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      // backgroundColor: notificationBgColor,
      action: SnackBarAction(
        label: "بستن",
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    var rows = [];
    for (int i = 0; i < tabs.length; i++) {
      rows.add(
        const SizedBox(height: 20),
      );
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: _mediaQueryData.size.width * 0.3,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 54, 109, 211),
                borderRadius: BorderRadius.circular(5),
              ),
              child: EnglishStyle(
                tab_names[i],
                Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              // width: _mediaQueryData.size.width * 0.7,
              // padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () async {
                  notifyButtom("اتاق ${tab_names[i]} حذف شد.");
                  zones.removeAt(i);
                  zones_sensors.removeAt(i);
                  tabs.removeAt(i);
                  tab_names.removeAt(i);
                  onoff_button_outputs.removeAt(i);
                  onoff_scenarios.removeAt(i);
                  active_scenarios.removeAt(i);
                  current_tab = 0;
                  //save zones
                  Directory directory3 =
                      await getApplicationDocumentsDirectory();
                  File file3 = File('${directory3.path}/zones.txt');

                  //print(file);
                  String content_file3 = '';
                  for (int i = 0; i < zones.length - 1; i++) {
                    content_file3 +=
                        zones[i].pin_sen + '%' + tab_names[i] + '^';
                  }
                  int l = zones.length - 1;
                  if (l > -1) {
                    content_file3 += zones[l].pin_sen + '%' + tab_names[l];
                    await file3.writeAsString(content_file3);
                  }
                },
                child: const Text('Delete'),
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('نام اتاق ها'),
        // backgroundColor: const Color.fromARGB(255, 201, 196, 196),
        // foregroundColor: Colors.black,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()))
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              //Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()));
              Menu_device_route =
                  MaterialPageRoute(builder: (context) => const Menu_device());
              Navigator.push(context, Menu_device_route);
            }),
      ),
      body: ListView(
        children: [...rows],
      ),
    );
  }
}

class ZoneName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    var rows = [];
    List<TextEditingController> new_names = [];
    for (int i = 0; i < tabs.length; i++) {
      new_names.add(TextEditingController());
      rows.add(
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5), //distance from up and down
              child: Text(
                '',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 0),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10), //distance from up and down
              child: EnglishStyle(
                tab_names[i],
                Colors.black,
              )),
          Container(
            width: _mediaQueryData.size.width * 0.5,
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: new_names[i],
              decoration: const InputDecoration(
                border: OutlineInputBorder(), //frame
                labelText: 'zone name',
              ),
            ),
          ),
          Container(
            //width:  _mediaQueryData.size.width * 0.7,
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () {
                tab_names[i] = new_names[i].text;
                tabs[i] = Tab(
                  icon: EnglishStyle(new_names[i].text, Colors.black),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Success_change_zone_name()),
                );
              },
              child: const Text('Apply'),
            ),
          )
        ]),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('نام اتاق ها'),
          // backgroundColor: Color.fromARGB(255, 201, 196, 196),
          // foregroundColor: Colors.black,
        ),
        body: ListView(children: <Widget>[...rows]));
  }
}

class Serials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int containerCount = devices.length;
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    List<Widget> rows = [];
    for (int i = 0; i < containerCount; i++) {
      rows.add(
        Container(
          // color: Colors.purple,
          alignment: Alignment.topRight,
          margin: const EdgeInsets.only(right: 30),
          padding: const EdgeInsets.all(10),
          child: Text(
            'سریال دستگاه' +
                (i + 1).toString() +
                ': ' +
                devices[i].split(':')[1],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('شماره سریال ها'),
          // backgroundColor: Color.fromARGB(255, 201, 196, 196),
          // foregroundColor: Colors.black,
        ),
        body: ListView(children: <Widget>[...rows]));
  }
}

class Wifi extends StatefulWidget {
  const Wifi({Key? key}) : super(key: key);
  @override
  State<Wifi> createState() => _Wifi();
}

class _Wifi extends State<Wifi> {
  String get_wifi = '';
  List<Widget> rows = [];
  @override
  void initState() {
    super.initState();
    get_wifi = 'ali&ali2';
    var all_wifi = get_wifi.split('&');
    int index_of_clicked_wifi = -1;
    //MediaQueryData _mediaQueryData = MediaQuery.of(context);
    for (int i = 0; i < all_wifi.length; i++) {
      rows.add(
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          width: 200,
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (index_of_clicked_wifi != -1) {
                  rows.removeAt(index_of_clicked_wifi);
                }
                index_of_clicked_wifi = i + 1;
                rows.insert(
                  i + 1,
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextField(
                      //controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), //frame
                        labelText: 'رمز وای فای',
                      ),
                    ),
                  ),
                );
              });
            },
            child: Text(all_wifi[i]),
          ),
        )
      ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    // var all_wifi = get_wifi.split('&');
    // for(int i=0 ; i < all_wifi.length ; i++)
    // {
    //     rows.add
    //     (
    //         Row
    //         (
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children:<Widget>
    //           [
    //             Container
    //             (
    //               width:  _mediaQueryData.size.width * 0.7,
    //               padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
    //               child: ElevatedButton
    //               (
    //                   onPressed: ()
    //                   {

    //                   },
    //                   child: Text(all_wifi[i]),
    //               ),
    //             )
    //           ]
    //         )
    //     );
    // }
    // Future<void> add_pass_field(int x) async
    // {
    //     rows.insert(x, Container
    //         (
    //         padding: const EdgeInsets.all(10),
    //           child: TextField
    //           (
    //             //controller: nameController,
    //             decoration: const InputDecoration
    //             (
    //             border: OutlineInputBorder(), //frame
    //             labelText: 'نام',
    //             ),
    //           ),
    //         ),);
    // }

    return Scaffold(
        appBar: AppBar(
          title: const Text('شبکه وای فای'),
          // backgroundColor: Color.fromARGB(255, 201, 196, 196),
          // foregroundColor: Colors.black,
        ),
        body: Stack(children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.03),
              BlendMode.srcOver,
            ),
            child: Image.asset(
              "images/wifi.png",
              fit: BoxFit.cover,
              height: _mediaQueryData.size.height * 1,
              width: _mediaQueryData.size.width * 1,
            ),
          ),
          ListView(children: <Widget>[...rows])
        ]));
  }
}

class Menu_device extends StatefulWidget {
  const Menu_device({Key? key}) : super(key: key);

  @override
  State<Menu_device> createState() => _Menu_device();
}

class _Menu_device extends State<Menu_device> {
  int index = 0;
  void myreceive_dev2() async {
    try {
      var all_sen = zones_sensors[current_tab].split(',');
      if (zones_sensors[current_tab].length > 2) {
        //print(zones_sensors[current_tab]);
        final response = await http.post(
          Uri.parse('http://185.255.90.31:10000/receive_d0'),
          body: zones_sensors[current_tab],
        );
        zones[current_tab].updateContent(response.body);
        // var get_sensors = response.body.split('&');
        // setState(() {
        //   for (int i = 0; i < get_sensors.length; i++) {
        //     values_sensor[i] = get_sensors[i];
        //   }
        // });
      }
    } catch (error) {
      // Notify.showNotification(
      //   title: "خطا",
      //   body: "اتصال برقرار نیست",
      //   flnp: flutterLocalNotificationsPlugin,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('builddd');
    count_menu++;
    index = count_menu;
    if (Menu_device_route.isCurrent && index == count_menu) {
      myreceive_dev2();
    }

    // Timer _everySecond = Timer.periodic(Duration(seconds: 5), (Timer t) async
    // {
    //   // print(Menu_device_route.isCurrent);
    //   if (Menu_device_route.isCurrent && index == count_menu)
    //   {
    //     try
    //     {
    //       var all_sen = zones_sensors[current_tab].split(',');
    //       if (zones_sensors[current_tab].length > 2)
    //       {
    //         // print(zones_sensors[current_tab]);
    //         final response = await http.post(
    //           Uri.parse('http://185.255.90.31:10000/receive_d0'),
    //           body: zones_sensors[current_tab],
    //         );
    //         // var get_sensors = response.body.split('&');

    //         //for(int i = 0 ; i < get_sensors.length ; i++)
    //         //{
    //         //values_sensor[i] = get_sensors[i];
    //         // values_sensor[0] = c.toString();

    //         zones[current_tab].updateContent(response.body);
    //         // c++;
    //         // }

    //         // c++;
    //         // print(c);
    //       }
    //     } catch (error) {
    //       // Notify.showNotification(
    //       //   title: "خطا",
    //       //   body: "اتصال برقرار نیست",
    //       //   flnp: flutterLocalNotificationsPlugin,
    //       // );
    //     }
    //   }
    // });
    int containerCount = devices.length;
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    menu_device_active = true;
    List<Widget> rows = [];
    // for (int i=0 ; i<zones.length ; i++)
    // {
    //     tabs.add(Tab
    //                 (
    //                   icon: EnglishStyle('room' + i.toString(), Colors.black),
    //                 ));
    // }
    int rowCount = (containerCount + 1) ~/ 2;

    for (int i = 0; i < rowCount; i++) {
      List<Widget> containers = [];
      for (int j = 0; j < 2; j++) {
        int containerIndex = i * 2 + j + 1;
        if (containerIndex <= containerCount) {
          containers.add(
            Container(
              width: 170.0,
              height: 190.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.all(10), //distance from up and down
                    child: Text(
                      "دستگاه $containerIndex",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   padding:
                  //       const EdgeInsets.all(10), //distance from up and down
                  //   child: Text(
                  //     devices[containerIndex - 1].split(':')[1],
                  //     style: TextStyle(
                  //         color: Colors.black54,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 15),
                  //   ),
                  // ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child:
                          EnglishStyle('device $containerIndex', Colors.white),
                      onPressed: () {
                        //print(Main_page_route.isCurrent);
                        current_device = containerIndex - 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
      if (containers.length == 1) {
        containers.add(
          Container(
            width: 170.0,
            height: 200.0,
            //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(''),
          ),
        );
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: containers,
        ),
      );
    }
    defaultTabController = new DefaultTabController(
        length: zones.length,
        initialIndex: current_tab,
        child: Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()))
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Directory directory2 =
                        await getApplicationDocumentsDirectory();
                    File file2 =
                        File('${directory2.path}/history_actuator.txt');

                    //print(file);
                    String content_file = '';
                    for (int i = 0; i < 10; i++) {
                      content_file +=
                          notifs_txt[i] + '%' + notifs_time[i] + '&';
                    }
                    await file2.writeAsString(content_file);
                  }),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Delete_zone()),
                      );
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red[500],
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Add_zone()),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Color.fromARGB(255, 17, 24, 216),
                      size: 30,
                    )),
              ],
              // backgroundColor: Color.fromARGB(255, 201, 196, 196),
              // foregroundColor: Colors.black,
              bottom: TabBar(
                isScrollable: true,
                onTap: (index) {
                  current_tab = index;
                  myreceive_dev2();
                },
                tabs: [
                  ...tabs
                  // Tab
                  // (
                  //   icon: EnglishStyle(room1, Colors.black),
                  // ),
                ],
              ),
              title: const Text('منو اتاق ها'),
              //     actions:
              //     [
              // // At here you have to get `context` from Builder.
              // // If you are not sure about this, check InheritedWidget document.
              //       Builder(builder: (BuildContext context)
              //       {
              //         if(DefaultTabController.of(context).index != null)
              //         {
              //             var index = DefaultTabController.of(context).index;
              //         }
              //         // use index at here...
              //       })
              //     ]
            ),
            //drawer: const NavigationDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // if (_backgroundImage != null)
                  //     ColorFiltered(
                  //       colorFilter: ColorFilter.mode(
                  //         Colors.black.withOpacity(0.3),
                  //         BlendMode.srcOver,
                  //       ),
                  //       child: Image.file(
                  //         _backgroundImage!,
                  //         fit: BoxFit.cover,
                  //         height: MediaQuery.of(context).size.height * 1,
                  //         width: MediaQuery.of(context).size.width * 1,
                  //       ),
                  //     )
                  //   else
                  //     ColorFiltered(
                  //       colorFilter: ColorFilter.mode(
                  //         Colors.black.withOpacity(0.3),
                  //         BlendMode.srcOver,
                  //       ),
                  //       child: Image.asset(
                  //         "images/farm.jpg",
                  //         fit: BoxFit.cover,
                  //         height: _mediaQueryData.size.height * 1,
                  //         width: _mediaQueryData.size.width * 1,
                  //       ),
                  //     ),
                  // // ColorFiltered(
                  // //   colorFilter: ColorFilter.mode(
                  // //     Colors.black.withOpacity(0.3),
                  // //     BlendMode.srcOver,
                  // //   ),
                  // //   child: Image.asset(
                  // //     "images/farm.jpg",
                  // //     fit: BoxFit.cover,
                  // //     height: _mediaQueryData.size.height * 1,
                  // //     width: _mediaQueryData.size.width * 1,
                  // //   ),
                  // // ),
                  // /*Icon
                  // (
                  //   Icons.star,
                  //   color: Colors.red[500],
                  //   size: 600,
                  // ),*/

                  // ListView(
                  //   scrollDirection: Axis.vertical,
                  //   children: <Widget>[
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children:
                  //       [

                  //         Container
                  //         (
                  //           //alignment: Alignment.,
                  //           padding:
                  //               const EdgeInsets.all(10), //distance from up and down
                  //           child: Image.asset
                  //           ("images/logo1 (1)_prev_ui.png",
                  //               fit: BoxFit.cover,
                  //               // height: _mediaQueryData.size.height * 0.16,
                  //               // width: _mediaQueryData.size.width * 0.12,
                  //               height: _mediaQueryData.size.height * 0.10,
                  //               width: _mediaQueryData.size.width * 0.20,
                  //           )
                  //         ),
                  //       ],
                  //     ),
                  //     ...rows,

                  //   ],
                  // ),

                  //Expanded(

                  // cccuu = DefaultTabController.of(context)?.index;

                  /*child: */ TabBarView(
                    children: [...zones],
                  )

                  //)
                ],
              ),
            )));
    return defaultTabController;
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
        appBar: new AppBar(
          title: Text('خانه'),
          // backgroundColor: Color.fromARGB(255, 201, 196, 196),
          // foregroundColor: Colors.black,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Login()))
              onPressed: () {
                while (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              }),
        ),
        //drawer: const NavigationDrawer(),
        body: new Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(alignment: Alignment.center, children: <Widget>[
              if (_backgroundImage != null)
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcOver,
                  ),
                  child: Image.file(
                    _backgroundImage!,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                )
              else
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcOver,
                  ),
                  child: Image.asset(
                    "images/farm.jpg",
                    fit: BoxFit.cover,
                    height: _mediaQueryData.size.height * 1,
                    width: _mediaQueryData.size.width * 1,
                  ),
                ),
              // ColorFiltered
              // (
              //     colorFilter: ColorFilter.mode
              //     (
              //       Colors.black.withOpacity(0.3),
              //       BlendMode.srcOver,
              //     ),
              //     child: Image.asset
              //     (
              //       "images/farm.jpg",
              //       fit: BoxFit.cover,
              //       height: _mediaQueryData.size.height * 1,
              //       width: _mediaQueryData.size.width * 1,
              //     ),
              //   ),
              /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
              // Positioned
              // (
              //   top: 0,
              //   right:5,
              //   child: TextButton
              //     (
              //       child: Icon
              //       (
              //         Icons.help,
              //         color: Colors.black,
              //         size: 30,
              //       ),
              //       onPressed: ()
              //       {
              //         Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),);
              //       },
              //     ),
              // ),
              ListView(
                  //scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      TextButton(
                        child: Icon(
                          Icons.help,
                          //color: Color.fromARGB(255, 201, 196, 196),
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutUs()),
                          );
                        },
                      ),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            '',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )),
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 170.0,
                            height: 200.0,
                            //padding:EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: Column(children: <Widget>[
                              //   Container
                              // (
                              //   //alignment: Alignment.,
                              //   padding: const EdgeInsets.all(10), //distance from up and down
                              //     child: Image.asset("images/device.jpg",
                              //     fit: BoxFit.cover,
                              //     height: _mediaQueryData.size.height * 0.06,
                              //     width: _mediaQueryData.size.width * 0.04,
                              //   )
                              // ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(
                                      10), //distance from up and down
                                  child: Icon(
                                    Icons.house_siding,
                                    color: Colors.black,
                                    size: 30,
                                  )),

                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(
                                      10), //distance from up and down
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 0),
                                  )),

                              Container(
                                  height: 50,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton(
                                      child:
                                          EnglishStyle('zones', Colors.white),
                                      // style: ElevatedButton.styleFrom(
                                      //   //primary:
                                      //       //Color.fromARGB(255, 201, 196, 196),
                                      // ),
                                      onPressed: () async {
                                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Menu_device()));
                                        //final response = await http.post(Uri.parse('http://185.255.90.31:10000/pin1_on'));
                                        Menu_device_route = MaterialPageRoute(
                                            builder: (context) =>
                                                const Menu_device());
                                        Navigator.push(
                                            context, Menu_device_route);
                                      })),
                            ]),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                color: Colors.black,
                                width: 3.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 170.0,
                            height: 200.0,
                            child: Column(children: <Widget>[
                              //   Container
                              // (
                              //   //alignment: Alignment.,
                              //   padding: const EdgeInsets.all(10), //distance from up and down
                              //     child: Image.asset("images/device.jpg",
                              //     fit: BoxFit.cover,
                              //     height: _mediaQueryData.size.height * 0.06,
                              //     width: _mediaQueryData.size.width * 0.04,
                              //   )
                              // ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(
                                      10), //distance from up and down
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.black,
                                    size: 30,
                                  )),

                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(
                                      10), //distance from up and down
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 0),
                                  )),

                              Container(
                                  height: 50,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: ElevatedButton(
                                      child: EnglishStyle(
                                          'settings', Colors.white),
                                      // style: ElevatedButton.styleFrom(
                                      //   primary:
                                      //      // Color.fromARGB(255, 201, 196, 196),
                                      // ),
                                      onPressed: ()
                                          //async
                                          {
                                        //final response = await http.post(Uri.parse('http://185.255.90.31:10000/pin1_off'));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Settings()));
                                      }))
                            ]),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                color: Colors.black,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ]),
                    //             Row
                    //             (
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children:
                    //               [
                    //               Container
                    //           (
                    //             width: 170.0,
                    //             height: 200.0,
                    //             child: Column
                    //             (
                    //                 children: <Widget>
                    //                 [
                    //                   //   Container
                    //                   // (
                    //                   //   //alignment: Alignment.,
                    //                   //   padding: const EdgeInsets.all(10), //distance from up and down
                    //                   //     child: Image.asset("images/device.jpg",
                    //                   //     fit: BoxFit.cover,
                    //                   //     height: _mediaQueryData.size.height * 0.06,
                    //                   //     width: _mediaQueryData.size.width * 0.04,
                    //                   //   )
                    //                   // ),
                    //                     Container
                    //                     (

                    //                     alignment: Alignment.center,
                    //                     padding: const EdgeInsets.all(10), //distance from up and down
                    //                     child: const Text
                    //                     (
                    //                       'تاریخچه',
                    //                        style: TextStyle
                    //                        (
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w500,
                    //                         fontSize: 20
                    //                        ),
                    //                     )
                    //                     ),

                    //                     Container
                    //                     (

                    //                     alignment: Alignment.center,
                    //                     padding: const EdgeInsets.all(10), //distance from up and down
                    //                     child: Text
                    //                     (
                    //                       '',
                    //                        style: TextStyle
                    //                        (
                    //                         color: Colors.black54,
                    //                         fontWeight: FontWeight.w500,
                    //                         fontSize: 0),
                    //                     )
                    //                     ),

                    //             Container
                    //             (
                    //               height: 50,
                    //               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //               child: ElevatedButton
                    //               (
                    //                 child: const Text('history'),
                    //                 onPressed: ()
                    //                 {
                    //                     Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryActuator()));

                    //                 }
                    //               )
                    //             )
                    //                 ]
                    //             ),
                    //             decoration: BoxDecoration
                    //             (
                    //               color: Colors.white70,
                    //               borderRadius: BorderRadius.only
                    //               (
                    //                 topLeft: Radius.circular(20),
                    //                 topRight: Radius.circular(20),
                    //                 bottomLeft: Radius.circular(20),
                    //                 bottomRight: Radius.circular(20)
                    //               ),
                    //               boxShadow: [
                    //               BoxShadow
                    //               (
                    //                 color: Colors.grey.withOpacity(0.5),
                    //                 spreadRadius: 5,
                    //                 blurRadius: 7,
                    //                 offset: Offset(0, 3), // changes position of shadow
                    //               ),
                    // ],
                    //               border: Border.all
                    //               (
                    //                 color: Colors.black,
                    //                 width: 3.0,
                    //               ),
                    //            ),
                    //         ),
                    //             ]
                    //         ),
                  ])
            ])));
  }
}

class Menu_act_sensor2 extends StatefulWidget {
  const Menu_act_sensor2({Key? key}) : super(key: key);

  @override
  State<Menu_act_sensor2> createState() => _Menu_act_sensor2();
}

class _Menu_act_sensor2 extends State<Menu_act_sensor2> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
        appBar: new AppBar(
          title: Text('منوی  حسگر/عملگر'),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Menu_device()))),
        ),
        //drawer: const NavigationDrawer(),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(alignment: Alignment.center, children: <Widget>[
              if (_backgroundImage != null)
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcOver,
                  ),
                  child: Image.file(
                    _backgroundImage!,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                )
              else
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcOver,
                  ),
                  child: Image.asset(
                    "images/farm.jpg",
                    fit: BoxFit.cover,
                    height: _mediaQueryData.size.height * 1,
                    width: _mediaQueryData.size.width * 1,
                  ),
                ),
              // ColorFiltered
              // (
              //     colorFilter: ColorFilter.mode
              //     (
              //       Colors.black.withOpacity(0.3),
              //       BlendMode.srcOver,
              //     ),
              //     child: Image.asset
              //     (
              //       "images/farm.jpg",
              //       fit: BoxFit.cover,
              //       height: _mediaQueryData.size.height * 1,
              //       width: _mediaQueryData.size.width * 1,
              //     ),
              //   ),
              /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/

              ListView(scrollDirection: Axis.vertical, children: <Widget>[
                // Row
                // (
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children:
                //     [
                //         Container
                //         (
                //       //alignment: Alignment.,
                //           padding: const EdgeInsets.all(20), //distance from up and down
                //           child: Image.asset
                //           ("images/logo1 (1)_prev_ui.png",
                //             fit: BoxFit.cover,
                //             // height: _mediaQueryData.size.height * 0.16,
                //             // width: _mediaQueryData.size.width * 0.12,
                //             height: _mediaQueryData.size.height * 0.10,
                //             width: _mediaQueryData.size.width * 0.20,
                //           )
                //         ),
                //     ]
                // ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 170.0,
                        height: 200.0,
                        child: Column(children: <Widget>[
                          //   Container
                          // (
                          //   //alignment: Alignment.,
                          //   padding: const EdgeInsets.all(10), //distance from up and down
                          //     child: Image.asset("images/device.jpg",
                          //     fit: BoxFit.cover,
                          //     height: _mediaQueryData.size.height * 0.06,
                          //     width: _mediaQueryData.size.width * 0.04,
                          //   )
                          // ),
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(
                                  10), //distance from up and down
                              child: const Text(
                                'عملگر ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              )),

                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(
                                  10), //distance from up and down
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 0),
                              )),

                          Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                  child: const Text('actuator'),
                                  onPressed: () {
                                    //Navigator.push(context, Actuator_route1);
                                    //  if(created_Actuator2)
                                    //  {
                                    //     while(Actuator_route2.isCurrent == false)
                                    //     {
                                    //         Navigator.pop(context);
                                    //     }
                                    //  }
                                    //  else
                                    //  {
                                    //     Navigator.push(context, Actuator_route2);
                                    //     created_Actuator2 = true;
                                    //  }
                                  }))
                        ]),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 170.0,
                        height: 200.0,
                        child: Column(children: <Widget>[
                          //   Container
                          // (
                          //   //alignment: Alignment.,
                          //   padding: const EdgeInsets.all(10), //distance from up and down
                          //     child: Image.asset("images/device.jpg",
                          //     fit: BoxFit.cover,
                          //     height: _mediaQueryData.size.height * 0.06,
                          //     width: _mediaQueryData.size.width * 0.04,
                          //   )
                          // ),
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(
                                  10), //distance from up and down
                              child: const Text(
                                'سنسور',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              )),

                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(
                                  10), //distance from up and down
                              child: Text(
                                '',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 0),
                              )),

                          Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                  child: const Text('sensor'),
                                  onPressed: () {
                                    // count_Main_page2 ++;
                                    // Main_page_route2 = MaterialPageRoute(builder: (context) => const Main_page2());
                                    // Navigator.push(context, Main_page_route2);
                                  }))
                        ]),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 170.0,
                    height: 200.0,
                    child: Column(children: <Widget>[
                      //   Container
                      // (
                      //   //alignment: Alignment.,
                      //   padding: const EdgeInsets.all(10), //distance from up and down
                      //     child: Image.asset("images/device.jpg",
                      //     fit: BoxFit.cover,
                      //     height: _mediaQueryData.size.height * 0.06,
                      //     width: _mediaQueryData.size.width * 0.04,
                      //   )
                      // ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            'history',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )),

                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: Text(
                            '',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 0),
                          )),

                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              child: const Text('history'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HistoryActuator()));
                              }))
                    ]),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                ]),
              ])
            ])));
  }
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text('تاریخچه'),
      ),
      body: new Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
              Positioned(
                right: 5,
                top: 10,
                left: 0.0,
                bottom: 0.0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'داشبورد',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
              Positioned(
                right: 10,
                top: 0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'داشبورد/',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    )),
              ),
              Positioned(
                right: 50,
                top: 0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'صفحه اصلی',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    )),
              ),
              Positioned(
                top: 0,
                right: 110,
                child: SizedBox(
                  height: 50,
                  width: 240,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(fontSize: 12),
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), //frame
                        labelText: 'جستجو...',
                      ),
                    ),
                  ),
                ),
              ),
              Center //Table
                  (
                child: Container(
                  width: _mediaQueryData.size.width * 0.5,
                  height: _mediaQueryData.size.height * 0.5,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          width: _mediaQueryData.size.width * 0.9,
                          height: _mediaQueryData.size.height * 0.05,
                          child: ListView(children: <Widget>[
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.all(
                                  10), //distance from up and down
                              child: Text(
                                'history',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ]),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black,
                              width: 0.0,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: [
                            DataColumn(
                                label: Text('عنوان',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('زمان',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('وضعیت',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('تاریخ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                          ], rows: [
                            DataRow(cells: [
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 4 روشن شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '7:20 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: Image.asset("images/download.jpg",
                                      fit: BoxFit.cover,
                                      height:
                                          _mediaQueryData.size.height * 0.03))),

                              /*DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/03/22',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),*/

                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 4 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '9:34 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/21',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 2 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '9:34 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/21',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 1 روشن شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '2:20 بامداد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/20',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'دستگاه آنلاین شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '6:54 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/18',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'دستگاه آفلاین شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '7:20 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'OFFLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/17',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 2 روشن شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '3:28 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/16',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 1 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '1:28 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/12',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'خروجی 1 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '8:19 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/10',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'خروجی 2 روشن شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '4:28 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/08',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 3 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '2:46 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/05',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ])
                          ]),
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.black,
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class Get_Device extends StatefulWidget {
  const Get_Device({Key? key}) : super(key: key);

  @override
  State<Get_Device> createState() => _Get_Device();
}

class _Get_Device extends State<Get_Device> {
  bool check_box_value = true;
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text('تاریخچه'),
      ),
      body: new Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
              Positioned(
                right: 5,
                top: 10,
                left: 0.0,
                bottom: 0.0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'داشبورد',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
              Positioned(
                right: 10,
                top: 0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'داشبورد/',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    )),
              ),
              Positioned(
                right: 50,
                top: 0,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'صفحه اصلی',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    )),
              ),
              Positioned(
                top: 0,
                right: 110,
                child: SizedBox(
                  height: 50,
                  width: 240,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), //frame
                        labelText: 'جستجو...',
                      ),
                    ),
                  ),
                ),
              ),
              Center //Table
                  (
                child: Container(
                  width: _mediaQueryData.size.width * 0.5,
                  height: _mediaQueryData.size.height * 0.5,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                          width: _mediaQueryData.size.width * 0.9,
                          height: _mediaQueryData.size.height * 0.05,
                          child: ListView(children: <Widget>[
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.all(
                                  10), //distance from up and down
                              child: Text(
                                'history',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ]),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black,
                              width: 0.0,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: [
                            DataColumn(
                                label: Text('عنوان',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('زمان',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('وضعیت',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('تاریخ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold))),
                          ], rows: [
                            DataRow(cells: [
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'aa',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '7:20 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: Image.asset("images/download.jpg",
                                      fit: BoxFit.cover,
                                      height:
                                          _mediaQueryData.size.height * 0.03))),

                              /*DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/03/22',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),*/

                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 4 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '9:34 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/21',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 2 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '9:34 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/21',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 1 روشن شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '2:20 بامداد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/20',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'دستگاه آنلاین شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '6:54 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/18',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'دستگاه آفلاین شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '7:20 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'OFFLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/17',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 2 روشن شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '3:28 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/16',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 1 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '1:28 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/12',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'خروجی 1 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '8:19 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/10',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'خروجی 2 روشن شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '4:28 ق.ب',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/08',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ]),
                            DataRow(cells: [
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'ورودی 3 خاموش شد',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ))),
                              DataCell(Container(
                                  padding: const EdgeInsets.all(
                                      2), //distance from up and down
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '2:46 ب.ظ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(
                                Container(
                                  width: 50.0,
                                  height: 20.0,
                                  child: ListView(children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(
                                            5), //distance from up and down
                                        child: const Text(
                                          'ONLINE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8),
                                        )),
                                  ]),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      0), //distance from up and down
                                  child: const Text(
                                    '00/02/05',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ))),
                              DataCell(Container(
                                  //alignment: Alignment.,
                                  padding: const EdgeInsets.all(
                                      5), //distance from up and down
                                  child: TextButton(
                                    child: const Text(
                                      'جزئیات',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    onPressed: () {
                                      //details of history
                                    },
                                  ))),
                            ])
                          ]),
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.black,
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  void read_userpass_file() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/login.txt');
      user_pass = await file.readAsString();
      var split_user_pass = user_pass.split('^');
      usernameController.text = split_user_pass[0];
      passwordController.text = split_user_pass[1];
    } catch (error) {
      print('errorrrr');
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  String user_pass = '';

  @override
  void initState() {
    super.initState();
    read_userpass_file();
    // Notify.initialize(flutterLocalNotificationsPlugin);
  }

  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
        appBar: new AppBar(
          toolbarHeight: _mediaQueryData.size.height * 0.1,
          // backgroundColor: Color.fromARGB(255, 201, 196, 196),
          // foregroundColor: Colors.black,
          title: new Text('ورود'),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if (_backgroundImage != null)
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcOver,
                  ),
                  child: Image.file(
                    _backgroundImage!,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                )
              else
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcOver,
                  ),
                  child: Image.asset(
                    "images/farm.jpg",
                    fit: BoxFit.cover,
                    height: _mediaQueryData.size.height * 1,
                    width: _mediaQueryData.size.width * 1,
                  ),
                ),
              /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/

              // Positioned
              // (
              //   bottom: 0,
              //   right: 0,
              //   child: ElevatedButton(
              //     onPressed: _pickImage,
              //     child: const Text('انتخاب عکس'),
              //   ),
              // ),
              // Positioned
              // (
              //     top: 0,
              //     left: 0,
              //     //height: _mediaQueryData.size.height * 0.07,
              //     //width: _mediaQueryData.size.width * 0.16,
              //     child: Container(
              //       // color: Colors.red,
              //       padding: const EdgeInsets.all(10), //distance from up and down
              //       child: Image.asset(
              //         "images/logo1 (1)_prev_ui.png",
              //         fit: BoxFit.cover,
              //         // height: _mediaQueryData.size.height * 0.16,
              //         // width: _mediaQueryData.size.width * 0.12,
              //         height: _mediaQueryData.size.height * 0.10,
              //         width: _mediaQueryData.size.width * 0.20,
              //       ),
              //     ),
              //   ),
              Positioned(
                bottom: 5,
                left: 10,
                child: TextButton(
                  child: const Text(
                    'درباره ما',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 5,
                left: 90,
                child: TextButton(
                  child: const Text(
                    'پشتیبانی',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    );
                  },
                ),
              ),

              // Positioned
              // (
              //     top: 5,
              //     right: 0,
              //     child: Container(
              //       width: _mediaQueryData.size.width * 0.65,
              //       height: 50.0,
              //       decoration: BoxDecoration(
              //         color: Colors.white10,
              //         // color: Colors.cyan,
              //         borderRadius: const BorderRadius.only(
              //             topLeft: Radius.circular(10),
              //             topRight: Radius.circular(10),
              //             bottomLeft: Radius.circular(10),
              //             bottomRight: Radius.circular(10)),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 5,
              //             blurRadius: 7,
              //             offset:
              //                 const Offset(0, 3), // changes position of shadow
              //           ),
              //         ],
              //         border: Border.all(
              //           color: Colors.black,
              //           width: 3.0,
              //         ),
              //       ),
              //       child: Stack(
              //         children: <Widget>[
              //           Positioned(
              //             top: 0,
              //             right: 0,
              //             child: Container(
              //               height: 45,
              //               // color: Colors.red,
              //               alignment: Alignment.center,
              //               padding: const EdgeInsets.all(
              //                   10), //distance from up and down
              //               child: const Text(
              //                 'داشبورد انحصاری فناوران شریف',
              //                 style: TextStyle
              //                 (
              //                     color: Colors.black,
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 20
              //                 ),
              //               ),
              //             ),
              //           ),
              //           // Container(
              //           //   // color: Colors.purple,
              //           //   alignment: Alignment.center,
              //           //   margin: const EdgeInsets.only(right: 30),
              //           //   padding: const EdgeInsets.all(10),
              //           //   child: const Text(
              //           //     'پشتیبانی',
              //           //     style: TextStyle(
              //           //       color: Colors.black,
              //           //       fontWeight: FontWeight.w500,
              //           //       fontSize: 12,
              //           //     ),
              //           //   ),
              //           // ),

              //           // Positioned
              //           // (
              //           //   top: 3,
              //           //   bottom: 3,
              //           //   left: 5,
              //           //   child: SizedBox(
              //           //     height: _mediaQueryData.size.height / 20,
              //           //     width: _mediaQueryData.size.width / 5,
              //           //     //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //           //     child: ElevatedButton(
              //           //       onPressed: () {},
              //           //       style: ElevatedButton.styleFrom(
              //           //           shape: RoundedRectangleBorder(
              //           //             borderRadius: BorderRadius.circular(12),
              //           //           ),
              //           //           primary: Colors.black,
              //           //           side: const BorderSide(
              //           //             width: 2,
              //           //             color: Colors.black,
              //           //           )),
              //           //       child: const Text('آشنایی با ما',
              //           //           style: TextStyle(
              //           //               color: Colors.white,
              //           //               fontWeight: FontWeight.w500,
              //           //               fontSize: 10)),
              //           //     ),
              //           //   ),
              //           // ),
              //         ],
              //       ),
              //     ),
              //   ),

              //scrollDirection: Axis.vertical,
              Positioned(
                top: 10,
                child: Container(
                  width: _mediaQueryData.size.width * 0.9,
                  height: _mediaQueryData.size.height * 0.5,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text('')),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(), //frame
                              labelText: ' نام کاربری',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(), //frame
                              labelText: 'رمز عبور',
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          title: Text("من را به یاد داشته باش"),
                          activeColor: Colors.green,
                          value: check_box_value,
                          onChanged: (newValue) 
                          {
                            setState(() {
                              if (check_box_value == false) 
                              {
                                check_box_value = true;
                              } else {
                                check_box_value = false;
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text('ورود',
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                  //primary: Color.fromARGB(255, 201, 196, 196),
                                  ),
                              onPressed: () async {
                                if (usernameController.text == '' &&
                                    passwordController.text == '') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserNotFound()),
                                  );
                                } else {
                                  try {
                                    final response = await http.post(
                                      Uri.parse(
                                          'http://185.255.90.31:10000/login'),
                                      //headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                                      body: jsonEncode(<String, String>{
                                        'username': usernameController.text,
                                        'password': passwordController.text,
                                      }),
                                    );

                                    if (response.body == 'n') //not found e
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserNotFound()),
                                      );
                                    } else if (response.body == 'e') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IncorrectPass()),
                                      );
                                    } 
                                    else if (response.body == '1')
                                     {
                                      try 
                                      {
                                        Directory directory =
                                            await getApplicationDocumentsDirectory();
                                        File file = File(
                                            '${directory.path}/history_actuator.txt');
                                        String contents =
                                            await file.readAsString();
                                        var txt_time = contents.split('&');
                                        for (int i = 0; i < 10; i++) {
                                          notifs_txt[i] =
                                              txt_time[i].split('%')[0];
                                          notifs_time[i] =
                                              txt_time[i].split('%')[1];
                                        }
                                      } catch (error) 
                                      {
                                        print('hstry err');
                                      }
                                      try 
                                      {
                                        if(firstLogin)
                                        {
                                            Directory directory = await getApplicationDocumentsDirectory();
                                            File file3 = File('${directory.path}/zones.txt');
                                            String contents3 = await file3.readAsString();
                                            var saved_zones = contents3.split('^');
                                            for (int i = 0; i < saved_zones.length; i++) 
                                            {
                                              String zone = saved_zones[i];
                                              String pin_sen_zone = zone.split('%')[0];
                                              String tab_zone = zone.split('%')[1];
                                              zones.add(Main_page(pin_sen_zone));
                                              zones_sensors
                                                  .add(pin_sen_zone.split('&')[1]);
                                              tab_names.add(tab_zone);
                                              tabs.add(Tab(
                                                icon: EnglishStyle(
                                                    tab_zone, Colors.white),
                                              ));
                                              zone_name++;
                                              onoff_button_outputs.add(
                                                  List<String>.filled(2, 'off.png',
                                                      growable: false));
                                              onoff_scenarios.add(
                                                  List<String>.filled(20, 'off',
                                                      growable: false));
                                              active_scenarios.add(
                                                  List<bool>.filled(20, false,
                                                      growable: false));
                                              visibilities.add(List<bool>.filled(
                                                  20, false,
                                                  growable: false));
                                              _selectedTimes.add(
                                                  List<Duration?>.filled(20, null,
                                                      growable: false));
                                              _selectedDates.add(
                                                  List<Jalali?>.filled(20, null,
                                                      growable: false));
                                              num_outputs.add(List<int>.filled(
                                                  20, 1,
                                                  growable: false));
                                              count_scheduling.add(0);
                                            }
                                            firstLogin = false;
                                        }
                                        
                                      } 
                                      catch (error) 
                                      {
                                        print('zone err');
                                      }
                                      // final date = shamsi.Jalali.now();
                                      // final f = date.formatter;
                                      // final current_time = '${f.wN} ${f.d} ${f.mN} ${f.yyyy} - ${date.hour}:${date.minute}';
                                      // notifs_times[current_device].insert(0, current_time);
                                      // notifs_txts[current_device].insert(0, usernameController.text + 'وارد شد');
                                      // if(notifs_times[current_device].length > 10)
                                      // {
                                      //     notifs_times[current_device].removeLast();
                                      //     notifs_txts[current_device].removeLast();
                                      // }
                                      // Directory directory2 = await getApplicationDocumentsDirectory();
                                      // File file2 = File('${directory2.path}/history_actuator' + (current_device + 1).toString() + '.txt');

                                      // //print(file);
                                      // String content_file = '';
                                      // for (int i = 0; i < 10; i++)
                                      // {
                                      //     content_file += notifs_txts[current_device][i] + '%' + notifs_times[current_device][i] + '&';
                                      // }
                                      // await file2.writeAsString(content_file);
                                      try 
                                      {
                                        if (check_box_value) 
                                        {
                                          Directory directory =
                                              await getApplicationDocumentsDirectory();
                                          File file = File(
                                              '${directory.path}/login.txt');
                                          await file.writeAsString(
                                              usernameController.text +
                                                  '^' +
                                                  passwordController.text);
                                        }
                                        logged_id = '1';
                                        for (int i = 0; i < 8; i++) 
                                        {
                                          active_images[i] = List<int>.filled(
                                              2, 0,
                                              growable: false);
                                          active_images_sensors[i] =
                                              List<int>.filled(6, 0,
                                                  growable: false);
                                          onoff_button_outputs[i] =
                                              List<String>.filled(2, 'off.png',
                                                  growable: false);
                                          //colors[i] = List<Color>.filled(4, Colors.grey, growable: false);
                                        }
                                      } catch (error) {}
                                      // final device_response = await http.get(Uri.parse('http://185.255.90.31:10000/get_device'),);
                                      // devices = device_response.body.split('&');
                                      // //devices = '1:ser1&4:ser2'.split('&');
                                      // if(device_response.body == '')
                                      // {
                                      //     devices = [];
                                      // }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()),
                                      );
                                    } 
                                    else 
                                    {
                                      try 
                                      {
                                        Directory directory =
                                            await getApplicationDocumentsDirectory();
                                        File file = File(
                                            '${directory.path}/history_actuator.txt');
                                        String contents =
                                            await file.readAsString();
                                        var txt_time = contents.split('&');
                                        for (int i = 0; i < 10; i++) {
                                          notifs_txt[i] =
                                              txt_time[i].split('%')[0];
                                          notifs_time[i] =
                                              txt_time[i].split('%')[1];
                                        }
                                      } catch (error) {
                                        print('hstry err');
                                      }
                                      try 
                                      {
                                        if(firstLogin)
                                        {
                                            Directory directory =await getApplicationDocumentsDirectory();
                                            File file3 = File('${directory.path}/zones.txt');
                                            String contents3 = await file3.readAsString();
                                            var saved_zones = contents3.split('^');
                                            for (int i = 0; i < saved_zones.length; i++) 
                                            {
                                              String zone = saved_zones[i];
                                              String pin_sen_zone = zone.split('%')[0];
                                              String tab_zone = zone.split('%')[1];
                                              zones.add(Main_page(pin_sen_zone));
                                              zones_sensors.add(pin_sen_zone.split('&')[1]);
                                              tab_names.add(tab_zone);
                                              tabs.add(Tab(
                                                icon: EnglishStyle(
                                                    tab_zone, Colors.white),
                                              ));
                                              zone_name++;
                                              onoff_button_outputs.add(
                                                  List<String>.filled(2, 'off.png',
                                                      growable: false));
                                              onoff_scenarios.add(
                                                  List<String>.filled(20, 'off',
                                                      growable: false));
                                              active_scenarios.add
                                              (
                                                  List<bool>.filled(20, false,
                                                      growable: false));
                                              visibilities.add(List<bool>.filled(
                                                  20, false,
                                                  growable: false));
                                              _selectedTimes.add(
                                                  List<Duration?>.filled(20, null,
                                                      growable: false));
                                              _selectedDates.add
                                              (
                                                  List<Jalali?>.filled(20, null,
                                                      growable: false));
                                              num_outputs.add(List<int>.filled(
                                                  20, 1,
                                                  growable: false));
                                              count_scheduling.add(0);
                                            }
                                            firstLogin = false;
                                        }
                                      
                                      } 
                                      catch (error) 
                                      {
                                        print('zone err');
                                      }
                                      // final date = shamsi.Jalali.now();
                                      // final f = date.formatter;
                                      // final current_time = '${f.wN} ${f.d} ${f.mN} ${f.yyyy} - ${date.hour}:${date.minute}';
                                      // notifs_times[current_device].insert(0, current_time);
                                      // notifs_txts[current_device].insert(0, usernameController.text + 'وارد شد');
                                      // if(notifs_times[current_device].length > 10)
                                      // {
                                      //     notifs_times[current_device].removeLast();
                                      //     notifs_txts[current_device].removeLast();
                                      // }
                                      // Directory directory2 = await getApplicationDocumentsDirectory();
                                      // File file2 = File('${directory2.path}/history_actuator' + (current_device + 1).toString() + '.txt');

                                      // //print(file);
                                      // String content_file = '';
                                      // for (int i = 0; i < 10; i++)
                                      // {
                                      //     content_file += notifs_txts[current_device][i] + '%' + notifs_times[current_device][i] + '&';
                                      // }
                                      // await file2.writeAsString(content_file);
                                      try {
                                        if (check_box_value) {
                                          Directory directory =
                                              await getApplicationDocumentsDirectory();
                                          File file = File(
                                              '${directory.path}/login.txt');
                                          await file.writeAsString(
                                              usernameController.text +
                                                  '^' +
                                                  passwordController.text);
                                        }
                                        logged_id = response.body;
                                        for (int i = 0; i < 8; i++) {
                                          active_images[i] = List<int>.filled(
                                              2, 0,
                                              growable: false);
                                          active_images_sensors[i] =
                                              List<int>.filled(6, 0,
                                                  growable: false);
                                          onoff_button_outputs[i] =
                                              List<String>.filled(2, 'off.png',
                                                  growable: false);
                                          //colors[i] = List<Color>.filled(4, Colors.grey, growable: false);
                                        }
                                      } 
                                      catch (error) {}
                                      // final device_response = await http.get(Uri.parse('http://185.255.90.31:10000/get_device'),);
                                      // devices = device_response.body.split('&');
                                      // //devices = '1:ser1&4:ser2'.split('&');
                                      // if(device_response.body == '')
                                      // {
                                      //     devices = [];
                                      // }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()),
                                      );
                                      // onoff_button_outputs = List<List<String>>.filled(8, List<String>.filled(2, 'off.png', growable: false), growable: true);
                                      // //colors = List<List<Color>>.filled(8, List<Color>.filled(4, Colors.grey, growable: false), growable: true);
                                      // onoff_scenarios = List<List<String>>.filled(8, List<String>.filled(20, 'off', growable: false), growable: true);
                                      // active_scenarios = List<List<bool>>.filled(8, List<bool>.filled(20, false, growable: false), growable: true);
                                      // active_images = List<List<int>>.filled(8, List<int>.filled(2, 0, growable: false), growable: true);
                                      // active_images_sensors = List<List<int>>.filled(8, List<int>.filled(6, 0, growable: false), growable: true);
                                      // notifs_txts = List<List<String>>.filled(8, notifs_txt, growable: true);
                                      // notifs_times = List<List<String>>.filled(8, notifs_time, growable: true);
                                      // num_outputs = List<List<int>>.filled(8, List<int>.filled(20, 1, growable: false), growable: true);
                                      // visibilities = List<List<bool>>.filled(8, List<bool>.filled(20, false, growable: false), growable: true);
                                      // color_scenarios = List<List<Color>>.filled(8, List<Color>.filled(20, Colors.grey, growable: false), growable: true);
                                      // _selectedTimes = List<List<Duration?>>.filled(8, List<Duration?>.filled(20, null, growable: false), growable: false);
                                      // _selectedDates = List<List<Jalali?>>.filled(8, List<Jalali?>.filled(20, null, growable: false), growable: false);
                                      // for(int d=0 ; d<8 ; d++)
                                      // {
                                      //     onoff_button_outputs[d] = List<String>.filled(2, 'off.png', growable: false);
                                      //     //colors[d] = List<Color>.filled(4, Colors.grey, growable: false);
                                      //     onoff_scenarios[d] = List<String>.filled(20, 'off', growable: false);
                                      //     active_scenarios[d] = List<bool>.filled(20, false, growable: false);
                                      //     active_images[d] = List<int>.filled(2, 0, growable: false);
                                      //     active_images_sensors[d] = List<int>.filled(6, 0, growable: false);
                                      //     notifs_txts[d] = List<String>.filled(10, '', growable: true);
                                      //     notifs_times[d] = List<String>.filled(10, '', growable: true);
                                      //     num_outputs[d] = List<int>.filled(20, 1, growable: false);
                                      //     visibilities[d] = List<bool>.filled(20, false, growable: false);
                                      //     color_scenarios[d] = List<Color>.filled(20, Colors.grey, growable: false);
                                      //     _selectedTimes[d] = List<InactiveConnectionDuration?>.filled(20, null, growable: false);
                                      //     _selectedDates[d] = List<Jalali?>.filled(20, null, growable: false);
                                      // }
                                    }
                                  } catch (error) {
                                    // Notify.showNotification(
                                    //   title: "خطا",
                                    //   body: "اتصال برقرار نیست",
                                    //   flnp: flutterLocalNotificationsPlugin,
                                    // );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           InactiveConnection()),
                                    // );
                                  }
                                }

                                //final response_get = await http.get(Uri.parse('http://185.255.90.31:10000/get_device'));
                                //print(response_get.body);
                                //devices_of_logged_user = response_get.body.split('-');
                                //print(devices_of_logged_user);
                              },
                            )),
                        Row(
                          children: <Widget>[
                            const Text('حساب کاربری ندارید؟'),
                            TextButton(
                              child: const Text(
                                'ثبت نام',
                                // style: TextStyle(
                                //     fontSize: 20,
                                //color: Color.fromARGB(255, 201, 196, 196)),
                              ),
                              onPressed: () {
                                //signup screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sign_in()),
                                );
                              },
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ]),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                ),
              ),

              /*Positioned
            (
             top: _mediaQueryData.size.width * 0.14,
             right: _mediaQueryData.size.width * 0.18,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.6,
                height: _mediaQueryData.size.height * 0.15,
                child: ListView
                (
                    children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'به پلتفرم فناوران شریف خوش آمدید',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 10),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.pink,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            ),*/
            ],
          ),
        ));
  }
}

class Main_page extends StatefulWidget {
  String pin_sen = '';
  var m;
  Main_page(String input_pin_sen) {
    pin_sen = input_pin_sen;
    m = _Main_page(pin_sen);
  }
  @override
  State<Main_page> createState() {
    return this.m = new _Main_page(pin_sen);
  }

  void updateContent(String updatedContent) {
    m.updateContent2(updatedContent);
  }
}

class _Main_page extends State<Main_page> {
  List<int> buttons = [1, 2];
  List<String> buttons2 = ['راست', 'چپ'];
  Duration initialtimer =
      new Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);
  double mywidth = 100;
  double myheight = 100;
  int cur_dev = 0;
  int index = 0;
  int count_scheduling1 = 0;
  String pin_sen = '';
  Color status = Colors.red;
  _Main_page(String input_pin_sen) {
    pin_sen = input_pin_sen;
  }
  // _Main_page(int dev)
  // {
  //   cur_dev = dev;
  //   if(dev == 0)
  //   {
  //       index0++;
  //       index = index0;
  //   }
  //   else if(dev == 1)
  //   {
  //       index1++;
  //       index = index1;
  //   }
  //   else if(dev == 2)
  //   {
  //       index2++;
  //       index = index2;
  //   }
  //   else if(dev == 3)
  //   {
  //       index3++;
  //       index = index3;
  //   }
  //   else if(dev == 4)
  //   {
  //       index4++;
  //       index = index4;
  //   }
  //   else if(dev == 5)
  //   {
  //       index5++;
  //       index = index5;
  //   }
  //   else if(dev == 6)
  //   {
  //       index6++;
  //       index = index6;
  //   }
  //   else
  //   {
  //       index7++;
  //       index = index7;
  //   }
  // }

  void updateHistory(current_notif) {
    final date = shamsi.Jalali.now();
    final f = date.formatter;
    final current_time =
        '${f.wN} ${f.d} ${f.mN} ${f.yyyy} - ${date.hour}:${date.minute}';
    notifs_time.insert(0, current_time);
    notifs_txt.insert(0, current_notif);
    if (notifs_time.length > 10) {
      notifs_time.removeLast();
      notifs_txt.removeLast();
    }
  }

  // Text notification = Text("");
  // void notifyUnderAlert(notificationText, notificationColor) {
  //   setState(() {
  //     notification = Text(
  //       notificationText,
  //       style: TextStyle(color: notificationColor),
  //     );
  //   });
  // }

  void notifyButtom(notificationText, notificationBgColor) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text(
        notificationText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: notificationBgColor,
      action: SnackBarAction(
        label: "بستن",
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void updateContent2(String updatedContent) {
    var get_sensors = updatedContent.split('&');
    setState(() {
      for (int i = 0; i < get_sensors.length; i++) {
        values_sensor[i] = get_sensors[i];
      }
    });
  }

  Future<void> _sendSMS(String message) async 
  {
    if (await Permission.sms.request().isGranted) 
    {
      try 
      {
        //message = "Permission Test";
        List<String> recipients = ['+989028961795'];

        String _result = await sendSMS(
          message: message,
          recipients: recipients,
          sendDirect: true,
        );
        print(_result);
      } 
      catch (error) 
      {
        print(error.toString());
      }
    } else
    {
      print("Permission Denied!!");
    }
  }

  void mypin_on(String number) async 
  {
    try 
    {
      if(status == Colors.red) //offline - sms
      {
          if (number == '0-0') 
          {
            _sendSMS('on out 1');
          } 
          else 
          {
            _sendSMS('on out 2');
          }
      }
      else
      {
        if (number == '0-0') 
        {
          number = '1';
        } 
        else 
        {
          number = '2';
        }
        final response = await http.get(
          Uri.parse('http://185.255.90.31:10000/pin' + number + '_on'),
          //body: 'p' + number.split('-')[1] + 'on',
        );
      }
    } 
    catch (error) 
    {
      // Notify.showNotification(
      //   title: "خطا",
      //   body: "اتصال برقرار نیست",
      //   flnp: flutterLocalNotificationsPlugin,
      // );
    }
  }

  void mypin_off(String number) async 
  {
    try 
    {
      if(status == Colors.red) //offline - sms
      {
          if (number == '0-0') 
          {
            _sendSMS('off out 1');
          } 
          else 
          {
            _sendSMS('off out 2');
          }
      }
      else
      {
        if (number == '0-0') 
        {
          number = '1';
        } 
        else 
        {
          number = '2';
        }
        final response = await http.get
        (
          Uri.parse('http://185.255.90.31:10000/pin' + number + '_off'),
          //body: 'p' + number.split('-')[1] + 'on',
        );
      }
    } 
    catch (error) 
    {
      // Notify.showNotification(
      //   title: "خطا",
      //   body: "اتصال برقرار نیست",
      //   flnp: flutterLocalNotificationsPlugin,
      // );
    }
  }

  void mystatus() async {
    try {
      final response_get1 =
          await http.get(Uri.parse('http://185.255.90.31:10000/status'));
      if (response_get1.body == 't' && status == Colors.red) {
        setState(() {
          status = Colors.green;
        });
      } else if (response_get1.body == 'f' && status == Colors.green) {
        setState(() {
          status = Colors.red;
        });
      }
    } catch (Exception) {
      // Notify.showNotification(
      //   title: "خطا",
      //   body: "اتصال برقرار نیست",
      //   flnp: flutterLocalNotificationsPlugin,
      // );
    }
  }

  Visibility addRow_scheduling1(int i) {
    return new Visibility(
      visible: visibilities[current_tab][i],
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            // Container
            // (
            //             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //           child: TextButton
            //           (
            //         child: Text(onoff_scenarios[current_tab][i]),

            //         style: TextButton.styleFrom
            //         (
            //           backgroundColor: color_scenarios[current_tab][i],
            //           primary: Colors.black,

            //         ),
            //         onPressed: ()
            //         {
            //           setState(()
            //           {
            //             if (onoff_scenarios[current_tab][i] == "on")
            //             {
            //               onoff_scenarios[current_tab][i] = "off";
            //               color_scenarios[current_tab][i] = Colors.grey;
            //             }
            //             else
            //             {
            //               onoff_scenarios[current_tab][i] = "on";
            //               color_scenarios[current_tab][i] = Colors.pink;

            //             }
            //           });
            //         }
            //       ),
            //     ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: IconButton(
                icon: Image.asset(
                    "images/" + onoff_scenarios[current_tab][i] + '.png'),
                //icon:Image.asset("images/off.png"),
                onPressed: () {
                  setState(() {
                    if (onoff_scenarios[current_tab][i] == "on")
                     {
                      onoff_scenarios[current_tab][i] = "off";
                    } else {
                      onoff_scenarios[current_tab][i] = "on";
                    }
                  });
                },
                iconSize: 35,
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 5, 0),
              child: DropdownButton(
                value: num_outputs[current_tab][i],
                items: buttons
                    .map
                    (
                      (buttonNumber) => DropdownMenuItem
                      (
                        value: buttonNumber,
                        //child: Text("خروجی ${buttonNumber}"),
                        child: Text("خروجی " + buttons2[buttonNumber - 1]),
                      ),
                    )
                    .toList(),
                onChanged: (value) 
                {
                  if (value == null) 
                  {
                    return;
                  }
                  setState(
                    () {
                      num_outputs[current_tab][i] = int.parse(value.toString());
                      // if (onOffButtonOutputs[(value - 1) ~/ 2]
                      //         [(value - 1) % 2] ==
                      //     "on") {
                      //   onOffButtonOutputs[(value - 1) ~/ 2]
                      //       [(value - 1) % 2] = "off";
                      //   onOffButtonColors[(value - 1) ~/ 2]
                      //       [(value - 1) % 2] = Colors.grey;
                      //   updateHistory("خروجی ${value} خاموش شد");
                      //   // mypin_off('2');
                      // } else {
                      //   onOffButtonOutputs[(value - 1) ~/ 2]
                      //       [(value - 1) % 2] = "on";
                      //   onOffButtonColors[(value - 1) ~/ 2]
                      //       [(value - 1) % 2] = Colors.pink;
                      //   updateHistory("خروجی ${value} روشن شد");
                      //   // print(notifs_txt);
                      //   // mypin_on('2');
                      // }
                    },
                  );
                },
              ),
            ),
            //       Container
            // (
            //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            Expanded(
              child: CheckboxListTile(
                  title: Text("فعالسازی",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 172, 6),
                      )),
                  activeColor: Colors.purple,
                  value: active_scenarios[current_tab][i],
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (newValue) {
                    setState(() {
                      if (active_scenarios[current_tab][i] == false) {
                        active_scenarios[current_tab][i] = true;
                        int month = 0;
                        int day = 0;
                        int hour = 0;
                        int minute = 0;
                        try {
                          Duration t =
                              _selectedTimes[current_tab][i] as Duration;
                          Jalali d = _selectedDates[current_tab][i] as Jalali;
                          month = d.month;
                          day = d.day;
                          hour = t.inHours;
                          minute = t.inMinutes % 60;
                          //num_output = int.parse(output_controller1[i].text);

                          shamsi.Jalali now = shamsi.Jalali.now();
                          int current_month = now.month;
                          int current_day = now.day;
                          int current_hour = now.hour;
                          int current_minute = now.minute;
                          int current_second = now.second;
                          int delay_minute = 0;
                          delay_minute = (month - current_month) * 43200 +
                              (day - current_day) * 1440 +
                              (hour - current_hour) * 60 +
                              (minute - current_minute);
                          if (delay_minute <
                              0) //hour == current_hour && minute < current_minute
                          {
                            delay_minute = 0;
                          }
                          int cerrent_delay_minute =
                              (delay_minute * 60) - current_second;
                          Future.delayed
                          (
                            Duration(
                                seconds:
                                    (delay_minute * 60) - current_second - 60),
                          ).then((_) {
                            if (onoff_scenarios[current_tab][i] == "on") 
                            {
                              // Notify.showNotification(
                              //   title: "هشدار",
                              //   body:
                              //       "تا یک دقیقۀ دیگر خروجی ${num_outputs[current_tab][i]} روشن خواهد شد",
                              //   flnp: flutterLocalNotificationsPlugin,
                              // );
                            } 
                            else 
                            {
                              // Notify.showNotification(
                              //   title: "هشدار",
                              //   body:
                              //       "تا یک دقیقۀ دیگر خروجی ${num_outputs[current_tab][i]} خاموش خواهد شد",
                              //   flnp: flutterLocalNotificationsPlugin,
                              // );
                            }
                          });
                          Future.delayed(
                            Duration(
                                seconds: (delay_minute * 60) - current_second),
                          ).then((_) //on
                              {
                            if (active_scenarios[current_tab][i] &&
                                cerrent_delay_minute ==
                                    (delay_minute * 60) - current_second) 
                                    {
                              setState(() 
                              {
                                active_scenarios[current_tab][i] = false;
                                if (onoff_scenarios[current_tab][i] == "on") 
                                {
                                  var tmp_pin =
                                      pins[num_outputs[current_device][i] - 1]
                                          .split('-');
                                  onoff_button_outputs[int.parse(tmp_pin[0])]
                                      [int.parse(tmp_pin[1])] = 'on.png';
                                  //colors[current_device][num_outputs[current_device][i] - 1] = Colors.pink;
                                  mypin_on(
                                      pins[num_outputs[current_tab][i] - 1]);
                                  updateHistory('خروجی ' +
                                      tmp_pin[1].toString() +
                                      'دستگاه ' +
                                      tmp_pin[0].toString() +
                                      ' روشن شد');
                                } else {
                                  var tmp_pin =
                                      pins[num_outputs[current_device][i] - 1]
                                          .split('-');
                                  onoff_button_outputs[int.parse(tmp_pin[0])]
                                      [int.parse(tmp_pin[1])] = 'off.png';
                                  //colors[current_device][num_outputs[current_device][i] - 1] = Colors.grey;
                                  mypin_off(
                                      pins[num_outputs[current_tab][i] - 1]);
                                  updateHistory('خروجی ' +
                                      tmp_pin[1].toString() +
                                      'دستگاه ' +
                                      tmp_pin[0].toString() +
                                      ' خاموش شد');
                                }
                              });
                            }
                          });
                        } catch (error) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Incorrect_input_format()));
                        }
                      } else {
                        active_scenarios[current_tab][i] = false;
                      }
                    });
                  }),
            ),
            //),
          ]),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  _selectedDates[current_tab][i] == null
                      ? "تاریخ"
                      // : '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                      : _selectedDates[current_tab][i]!.formatFullDate(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 15, 3, 141),
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: IconButton(
                  onPressed: () async {
                    final now = Jalali.now();
                    final firstDate = Jalali(now.year, now.month, now.day);

                    final pickedDate = await showPersianDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: firstDate,
                      lastDate: Jalali(now.year + 1, now.month, now.day),
                    );

                    setState(() {
                      _selectedDates[current_tab][i] = pickedDate;
                    });
                  },
                  icon: const Icon(Icons.calendar_month,
                      color: Color.fromARGB(255, 15, 3, 141), size: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      _selectedTimes[current_tab][i] == null
                          ? "زمان"
                          : _selectedTimes[current_tab][i]!
                              .toString()
                              .substring(0, 5),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 15, 3, 141),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                      // onPressed: ()
                      // async
                      // {
                      //     final pickedTime = await showTimePicker
                      //     (
                      //       context: context,
                      //       initialTime: TimeOfDay.now(),
                      //       builder: (BuildContext context, Widget? child)
                      //       {
                      //         return Theme
                      //         (
                      //           data: Theme.of(context)
                      //               .copyWith(materialTapTargetSize: MaterialTapTargetSize.padded),
                      //           child: Directionality(
                      //             textDirection: TextDirection.ltr,
                      //             child: MediaQuery(
                      //               data: MediaQuery.of(context).copyWith
                      //               (
                      //                 alwaysUse24HourFormat: false,
                      //               ),
                      //               child: child!,
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     );

                      //     setState(()
                      //     {
                      //       _selectedTimes[current_device][i] = pickedTime;
                      //     });
                      // },
                      onPressed: () => cuper.showCupertinoModalPopup(
                          context: context,
                          builder: (_) => Container(
                                height: myheight * 0.7,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: myheight * 0.55,
                                      child: cuper.CupertinoTimerPicker(
                                        mode: cuper.CupertinoTimerPickerMode.hm,
                                        minuteInterval: 1,
                                        secondInterval: 1,
                                        initialTimerDuration:
                                            _selectedTimes[current_tab][i] ==
                                                    null
                                                ? initialtimer as Duration
                                                : _selectedTimes[current_tab][i]
                                                    as Duration,
                                        onTimerDurationChanged:
                                            (Duration changedtimer) {
                                          setState(() {
                                            _selectedTimes[current_tab][i] =
                                                changedtimer;
                                          });
                                        },
                                      ),
                                    ),
                                    cuper.CupertinoButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        })
                                  ],
                                ),
                              )),
                      icon: const Icon(Icons.watch_later_outlined,
                          color: Color.fromARGB(255, 15, 3, 141), size: 20),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  void get_lastupdate() async {
    try {
      final response_get = await http.get(Uri.parse(
          'http://185.255.90.31:10000/get_lastupdate' + cur_dev.toString()));
      setState(() {
        lastupdate = response_get.body.split('-')[0] +
            '/' +
            response_get.body.split('-')[1] +
            '/' +
            response_get.body.split('-')[2];
      });
    } catch (error) {
      // Notify.showNotification(
      //   title: "خطا",
      //   body: "اتصال برقرار نیست",
      //   flnp: flutterLocalNotificationsPlugin,
      // );
    }
  }

  void myreceive_dev2() {
    Timer _everySecond = Timer.periodic(
      Duration(seconds: 5),
      (Timer t) {
        setState(() async {
          try {
            var all_sen = zones_sensors[current_tab].split(',');
            if (zones_sensors[current_tab].length > 2) {
              final response = await http.post(
                Uri.parse('http://185.255.90.31:10000/receive_d0'),
                body: zones_sensors[current_tab],
              );
              var get_sensors = response.body.split('&');
              for (int i = 0; i < get_sensors.length; i++) {
                values_sensor[i] = get_sensors[i];
              }
            }
          } catch (error) {
            // Notify.showNotification(
            //   title: "خطا",
            //   body: "اتصال برقرار نیست",
            //   flnp: flutterLocalNotificationsPlugin,
            // );
          }
        });
      },
    );
  }

  var sensors;
  var pins;
  // int id_obj = count_Main_page1;
  bool check_box_value = true;
  TextEditingController date_controller = TextEditingController();
  String onoff_input1 = 'روشن';
  String onoff_input2 = 'خاموش';
  String onoff_input3 = 'روشن';
  String onoff_input4 = 'روشن';
  String onoff_output1 = 'off';
  String onoff_output2 = 'on';
  String onoff_button_output1 = 'off';
  String onoff_button_output2 = 'off';
  String temperature = '0';
  String humid = '0';
  String temperature2 = '0';
  String humid2 = '0';
  String device_state = 'آنلاین';
  String lastupdate = '';
  Color color_device_state = Color.fromARGB(255, 36, 228, 43);
  final List<String> history = <String>[];
  final List<String> date = <String>[];
  int int1 = 1544;
  int int3 = 1445;
  int int4 = 1544;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  @override
  void initState() {
    super.initState();
    mystatus();
    Timer _everySecond = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      try {
        if (Menu_device_route.isCurrent) {
          active_menu_dev++;
          if (active_menu_dev == count_menu) {
            final response_get1 =
                await http.get(Uri.parse('http://185.255.90.31:10000/status'));
            print(response_get1.body);
            active_menu_dev = 0;
            if (response_get1.body == 't' && status == Colors.red) {
              setState(() {
                status = Colors.green;
              });
            } else if (response_get1.body == 'f' && status == Colors.green) {
              setState(() {
                status = Colors.red;
              });
            }
          }
        }
      } catch (Exception) {
        // Notify.showNotification(
        //   title: "خطا",
        //   body: "اتصال برقرار نیست",
        //   flnp: flutterLocalNotificationsPlugin,
        // );
      }
    });
    //get_lastupdate();
    //myreceive_dev2();
    // Timer _everySecond = Timer.periodic(Duration(seconds: 5),(Timer t)
    //   {
    //       setState(()
    //       async
    //       {
    //           try
    //           {
    //             var all_sen = zones_sensors[current_tab].split(',');
    //             for (int i=0 ; i<all_sen.length - 1 ; i++)
    //             {
    //               String tmp_dev = all_sen[i].split('-')[0];
    //               String tmp_sen = all_sen[i].split('-')[1];
    //               final response = await http.post
    //               (
    //                 Uri.parse('http://185.255.90.31:10000/sensor_d' + tmp_dev),
    //                 body: 's' + tmp_sen,
    //               );
    //               values_sensor[i] = response.body;
    //             }
    //           }
    //           catch (error)
    //           {

    //           }
    //       });
    //       // for(int i=0 ; i<sensors.length - 1 ; i++)
    //       // {
    //       //     String s = sensors[i];
    //       //     final response_get1 = await http.get(Uri.parse('http://185.255.90.31:10000/receive_d' + s));
    //       //     setState(()
    //       //     {
    //       //         values_sensor[i] = response_get1.body;
    //       //     });
    //       // }

    //     // if(menu_device_active)
    //     // {
    //     //     if(cur_dev == 0)
    //     //     {
    //     //         if(index == index0 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     //     else if(cur_dev == 1)
    //     //     {
    //     //         if(index == index1 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     //     else if(cur_dev == 2)
    //     //     {
    //     //         if(index == index2 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     //     else if(cur_dev == 3)
    //     //     {
    //     //         if(index == index3 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     //     else if(cur_dev == 4)
    //     //     {
    //     //         if(index == index4 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     //     else if(cur_dev == 5)
    //     //     {
    //     //         if(index == index5 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     //     else if(cur_dev == 6)
    //     //     {
    //     //         if(index == index6 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     //     else
    //     //     {
    //     //         if(index == index7 && current_device == cur_dev)
    //     //         {
    //     //           myreceive_dev1();
    //     //         }
    //     //     }
    //     // }

    //     // if(Main_page_route.isCurrent && id_obj == count_Main_page1)
    //     // {
    //     //   try
    //     //   {
    //     //         final response_get1 = await http.get(Uri.parse('http://185.255.90.31:10000/receive_dev' + cur_dev.toString()));

    //     //         setState(()
    //     //         {
    //     //           if(response_get1.body == 'off')
    //     //           {
    //     //               device_state = 'آفلاین';
    //     //               color_device_state = Color.fromARGB(255, 243, 127, 26);
    //     //           }
    //     //           else
    //     //           {
    //     //               final all_sensors = response_get1.body.split('&');
    //     //               device_state = 'آنلاین';
    //     //               color_device_state = Color.fromARGB(255, 36, 228, 43);
    //     //               temperature = all_sensors[0].split('=')[1];
    //     //               humid = all_sensors[1].split('=')[1];
    //     //               ph = all_sensors[2].split('=')[1];
    //     //               lux = all_sensors[3].split('=')[1];
    //     //           }
    //     //         });

    //     //   }
    //     //   catch(Exception)
    //     //   {

    //     //   }
    //     // }
    //   },
    //);
  }

  @override
  Widget build(BuildContext context) //*main_page
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    mywidth = _mediaQueryData.size.width;
    myheight = _mediaQueryData.size.height;
    pins = pin_sen.split('&')[0].split(',');
    sensors = pin_sen.split('&')[1].split(',');
    int count_pins = pins.length - 1; //,
    int count_sensors = sensors.length - 1; //,
    int count_row_pins = count_pins ~/ 2;
    int count_row_sensors = count_sensors ~/ 2;
    //values_sensor = List.filled(count_sensors, 'nan');
    List<Row> all_rows_pin = [];
    for (int i = 0; i < count_row_pins; i++) {
      List<Widget> row_pin = [];
      for (int j = 0; j < 2; j++) {
        String present_device = pins[i * 2 + j].split('-')[0];
        String present_pin = pins[i * 2 + j].split('-')[1];
        int pres_dev_int = int.parse(present_device);
        int pres_pin_int = int.parse(present_pin);
        row_pin.add(
          Container(
            width: 170.0,
            height: 250.0,
            // width: _mediaQueryData.size.width * 0.45,
            // height: _mediaQueryData.size.height * 0.25,
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          //alignment: Alignment.,
                          padding: EdgeInsets.fromLTRB(
                              0, 5, 0, 0), //distance from up and down
                          child: Image.asset(
                            address_images[
                                active_images[int.parse(present_device)]
                                    [int.parse(present_pin)]], //aaaaaacccct
                            fit: BoxFit.cover,
                            height: _mediaQueryData.size.height * 0.06,
                            //width: _mediaQueryData.size.width * 0.05,
                          )),
                    ]),
                Container(
                  width: _mediaQueryData.size.width * 0.1,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        current_pin = int.parse(present_pin);
                        current_device = int.parse(present_device);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Images_of_pin()),
                        );
                      },
                      icon: Icon(
                        Icons.image_search,
                        color: Colors.red[500],
                        size: 30,
                      )),
                ),
                // IconButton
                // (
                //   onPressed:()
                //   {
                //     Navigator.push(context,MaterialPageRoute(builder: (context) => Images_of_pin()),);
                //     current_pin = 1;
                //   },
                //   icon:Icon
                //   (
                //   Icons.image_search,
                //   color: Colors.red[500],
                //   size: 60,
                //   )
                // ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB
                    (
                        0, 15, 0, 15), //distance from up and down
                    child: EnglishStyle
                    (
                        'device' + (pres_dev_int + 1).toString() + ' - pin' + (pres_pin_int + 1).toString(),
                        Colors.black)
                    // child: PersianStyle("خروجی 2"),
                    ),

                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: IconButton(
                    icon: Image.asset("images/" +
                        onoff_button_outputs[int.parse(present_device)]
                            [int.parse(present_pin)]),
                    //icon:Image.asset("images/off.png"),
                    onPressed: () 
                    {
                        setState(() 
                        {
                          if (onoff_button_outputs[int.parse(present_device)]
                                  [int.parse(present_pin)] ==
                              "on.png")
                           {
                            Navigator.push
                            (
                              context,
                              MaterialPageRoute
                              (
                                builder: (context) => Lock
                                (
                                  onOffState: false,
                                  deviceAndPin: 'device' +
                                      (pres_dev_int + 1).toString() +
                                      ' - pin' +
                                      (pres_pin_int + 1).toString(),
                                ),
                              ),
                            );
                            onoff_button_outputs[int.parse(present_device)]
                                [int.parse(present_pin)] = "off.png";
                            //colors[current_device][1] = Colors.grey;
                            //updateHistory('خروجی 2 خاموش شد');
                            updateHistory('خروجی' +
                                present_pin +
                                'دستگاه' +
                                present_device +
                                'خاموش شد');
                            // notifyUnderAlert(
                            //     'خروجی 2 خاموش شد', Colors.red);
                            notifyButtom
                            (
                              'خروجی' +
                                  present_pin +
                                  'دستگاه' +
                                  present_device +
                                  'خاموش شد',
                              Colors.red,
                            );
                            mypin_off(pins[i * 2 + j]);
                          } 
                          else 
                          {
                            Navigator.push
                            (
                              context,
                              MaterialPageRoute(
                                builder: (context) => Lock(
                                  onOffState: true,
                                  deviceAndPin: 'device' +
                                      (pres_dev_int + 1).toString() +
                                      ' - pin' +
                                      (pres_pin_int + 1).toString(),
                                ),
                              ),
                            );
                            onoff_button_outputs[int.parse(present_device)]
                                [int.parse(present_pin)] = "on.png";
                            //colors[current_device][1] = Colors.pink;
                            updateHistory('خروجی' +
                                present_pin +
                                'دستگاه' +
                                present_device +
                                'روشن شد');
                            // notifyUnderAlert(
                            //     'خروجی 2 روشن شد', Colors.green);
                            notifyButtom(
                              'خروجی' +
                                  present_pin +
                                  'دستگاه' +
                                  present_device +
                                  'روشن شد',
                              Colors.green,
                            );
                            mypin_on(pins[i * 2 + j]);
                          }
                        });
                    },
                    iconSize: 35,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(
                color: Colors.black,
                width: 3.0,
              ),
            ),
          ),
        );
      }
      Row r = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[...row_pin]);
      all_rows_pin.add(r);
    }
    if (count_pins % 2 == 1) {
      String present_device = pins[count_pins - 1].split('-')[0];
      String present_pin = pins[count_pins - 1].split('-')[1];
      int pres_dev_int = int.parse(present_device);
      int pres_pin_int = int.parse(present_pin);
      Row r =
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          width: 170.0,
          height: 250.0,
          // width: _mediaQueryData.size.width * 0.45,
          // height: _mediaQueryData.size.height * 0.25,
          child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                  //alignment: Alignment.,
                  padding: EdgeInsets.fromLTRB(
                      0, 5, 0, 0), //distance from up and down
                  child: Image.asset(
                    address_images[active_images[int.parse(present_device)]
                        [int.parse(present_pin)]], //aaaaaacccct
                    fit: BoxFit.cover,
                    height: _mediaQueryData.size.height * 0.06,
                    //width: _mediaQueryData.size.width * 0.05,
                  )),
            ]),
            Container(
              width: _mediaQueryData.size.width * 0.1,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: IconButton(
                  onPressed: () {
                    current_pin = int.parse(present_pin);
                    current_device = int.parse(present_device);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Images_of_pin()),
                    );
                  },
                  icon: Icon(
                    Icons.image_search,
                    color: Colors.red[500],
                    size: 30,
                  )),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(
                    0, 15, 0, 15), //distance from up and down
                child: EnglishStyle(
                    'device' + (pres_dev_int + 1).toString() + ' - pin' + (pres_pin_int + 1).toString(),
                    Colors.black)
                // child: PersianStyle("خروجی 2"),
                ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: IconButton(
                icon: Image.asset("images/" +
                    onoff_button_outputs[int.parse(present_device)]
                        [int.parse(present_pin)]),
                //icon:Image.asset("images/off.png"),
                onPressed: () 
                {
                    setState(() 
                    {
                      if (onoff_button_outputs[int.parse(present_device)]
                              [int.parse(present_pin)] ==
                          "on.png") 
                          {
                            Navigator.push
                            (
                              context,
                              MaterialPageRoute(
                                builder: (context) => Lock(
                                  onOffState: false,
                                  deviceAndPin: 'device' +
                                      (pres_dev_int + 1).toString() +
                                      ' - pin' +
                                      (pres_pin_int + 1).toString(),
                                ),
                              ),
                            );
                        onoff_button_outputs[int.parse(present_device)]
                            [int.parse(present_pin)] = "off.png";
                        //colors[current_device][1] = Colors.grey;
                        updateHistory('خروجی' +
                            present_pin +
                            'دستگاه' +
                            present_device +
                            'خاموش شد');
                        // notifyUnderAlert(
                        //     'خروجی 2 خاموش شد', Colors.red);
                        notifyButtom(
                          'خروجی' +
                              present_pin +
                              'دستگاه' +
                              present_device +
                              'خاموش شد',
                          Colors.red,
                        );
                        mypin_off(pins[count_pins - 1]);
                      } 
                      else 
                      {
                        Navigator.push
                        (
                          context,
                          MaterialPageRoute(
                            builder: (context) => Lock(
                              onOffState: true,
                              deviceAndPin: 'device' +
                                  (pres_dev_int + 1).toString() +
                                  ' - pin' +
                                  (pres_pin_int + 1).toString(),
                            ),
                          ),
                        );
                        onoff_button_outputs[int.parse(present_device)]
                            [int.parse(present_pin)] = "on.png";
                        //colors[current_device][1] = Colors.pink;
                        updateHistory('خروجی' +
                            present_pin +
                            'دستگاه' +
                            present_device +
                            'روشن شد');
                        // notifyUnderAlert(
                        //     'خروجی 2 روشن شد', Colors.green);
                        notifyButtom(
                          'خروجی' +
                              present_pin +
                              'دستگاه' +
                              present_device +
                              'روشن شد',
                          Colors.green,
                        );
                        mypin_on(pins[count_pins - 1]);
                      }
                    });
   
                },
                iconSize: 35,
              ),
            ),
          ]),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(
              color: Colors.black,
              width: 3.0,
            ),
          ),
        )
      ]);
      all_rows_pin.add(r);
    }

    //add sensorssss
    List<Row> all_rows_sensor = [];
    for (int i = 0; i < count_row_sensors; i++) {
      List<Widget> row_sensor = [];
      for (int j = 0; j < 2; j++) {
        String present_device = sensors[i * 2 + j].split('-')[0];
        String present_sensor = sensors[i * 2 + j].split('-')[1];
        int pres_dev_int = int.parse(present_device);
        int pres_sen_int = int.parse(present_sensor);
        row_sensor.add(
          Container(
            width: 170.0,
            height: 250.0,
            child: Column(children: <Widget>[
              Container(
                  //alignment: Alignment.,
                  padding: const EdgeInsets.all(10), //distance from up and down
                  child: Image.asset(
                    address_images_sensors[
                        active_images_sensors[int.parse(present_device)]
                            [int.parse(present_sensor)]],
                    //child: Image.asset(address_images[active_images[current_device][1]],
                    fit: BoxFit.cover,
                    height: _mediaQueryData.size.height * 0.10,
                    //width: _mediaQueryData.size.width * 0.05,
                  )),
              // Container
              // (
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(
              //         10), //distance from up and down
              //     child: EnglishStyle('humid', Colors.black),
              // ),
              Container(
                width: _mediaQueryData.size.width * 0.1,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: IconButton(
                    onPressed: () {
                      current_sensor = int.parse(present_sensor);
                      current_device = int.parse(present_device);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Images_of_sensor()),
                      );
                    },
                    icon: Icon(
                      Icons.image_search,
                      color: Colors.red[500],
                      size: 30,
                    )),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(
                      0, 15, 0, 15), //distance from up and down
                  child: EnglishStyle(
                      'device' + (pres_dev_int + 1).toString() + ' - sensor' + (pres_sen_int + 1).toString(),
                      Colors.black)
                  // child: PersianStyle("خروجی 2"),
                  ),

              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10), //distance from up and down
                  child: Text(
                    //humid,
                    values_sensor[2 * i + j],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
            ]),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(
                color: Colors.black,
                width: 3.0,
              ),
            ),
          ),
        );
      }
      Row r = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[...row_sensor]);
      all_rows_sensor.add(r);
    }
    if (count_sensors % 2 == 1) 
    {
      String present_device = sensors[count_sensors - 1].split('-')[0];
      String present_sensor = sensors[count_sensors - 1].split('-')[1];
      int pres_dev_int = int.parse(present_device);
      int pres_sen_int = int.parse(present_sensor);
      Row r =
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          width: 170.0,
          height: 250.0,
          child: Column(children: <Widget>[
            Container(
                //alignment: Alignment.,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: Image.asset(
                  address_images_sensors[
                      active_images_sensors[int.parse(present_device)]
                          [int.parse(present_sensor)]],
                  //child: Image.asset(address_images[active_images[current_device][1]],
                  fit: BoxFit.cover,
                  height: _mediaQueryData.size.height * 0.10,
                  //width: _mediaQueryData.size.width * 0.05,
                )),
            Container(
              width: _mediaQueryData.size.width * 0.1,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: IconButton(
                  onPressed: () {
                    current_sensor = int.parse(present_sensor);
                    current_device = int.parse(present_device);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Images_of_sensor()),
                    );
                  },
                  icon: Icon(
                    Icons.image_search,
                    color: Colors.red[500],
                    size: 30,
                  )),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(
                    0, 15, 0, 15), //distance from up and down
                child: EnglishStyle(
                    'device' + (pres_dev_int + 1).toString() + ' - sensor' + (pres_sen_int + 1).toString(),
                    Colors.black)
                // child: PersianStyle("خروجی 2"),
                ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: Text(
                  //humid,
                  values_sensor[count_sensors - 1],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                )),
          ]),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(
              color: Colors.black,
              width: 3.0,
            ),
          ),
        ),
      ]);
      all_rows_sensor.add(r);
    }

    //Future.delayed(Duration(seconds: 10)).then((_)
    /*
    history.add('ورودی 4 روشن شد');
    date.add('22 خرداد 7:20 ب.ظ');
    history.add('ورودی 4 خاموش شد');
    date.add('31 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 2 خاموش شد');
    date.add('21 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 1 روشن شد');
    date.add('20 اردیبهشت 2:20 بامداد');
    history.add('دستگاه آنلاین شد');
    date.add('18 اردیبهشت 4:54 ق.ب');
    history.add('دستگاه آفلاین شد');
    date.add('17 اردیبهشت 7:20 ب.ظ');
    history.add('ورودی 2 روشن شد');
    date.add('16 اردیبهشت 3:28 ب.ظ');*/

    /* Timer _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t)
                  {
                        receive_dev1().then((String result)
                        {
                        setState(()
                        {
                          temperature = result;
                        });
});

                  });*/
    return new Scaffold(
        //  appBar: new AppBar
        //  (
        //   title: Text('دستگاه ' + (cur_dev + 1).toString()),
        //  ),
        //drawer: const NavigationDrawer(),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
                ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView //lllll
                        (children: <Widget>[
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        // SizedBox
                        // (
                        //     height: 50,
                        //     width: 90,
                        //     child: Container
                        //     (
                        //         padding: const EdgeInsets.all(10),
                        //         child: TextField
                        //         (
                        //           controller: date_controller,
                        //           decoration: const InputDecoration
                        //           (
                        //             border: OutlineInputBorder(), //frame
                        //             labelText: 'روز',
                        //           ),
                        //         ),
                        //     )
                        // ),
                        // Container
                        // (
                        //   height: 50,
                        //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        //   child: ElevatedButton
                        //   (
                        //     child: const Text('گزارش'),
                        //     onPressed: ()
                        //     //final response = await http.get(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                        //     async
                        //     {
                        //            try
                        //            {
                        //                 // var httpClient = new HttpClient();
                        //                 // var request = await httpClient.getUrl(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                        //                 // var response = await request.close();
                        //                 // var bytes = await consolidateHttpClientResponseBytes(response);
                        //                 Map<Permission, PermissionStatus> statuses = await [
                        //                 Permission.storage,
                        //               ].request();
                        //                 String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
                        //                 final response = await http.post(Uri.parse('http://185.255.90.31:10000/getDate' + cur_dev.toString()),
                        //                 //headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                        //                 body: jsonEncode(<String, String>{'day': date_controller.text  ,}),);
                        //                 HttpClient client = new HttpClient();
                        //                 var _downloadData = StringBuffer();
                        //                 client.getUrl(Uri.parse('http://185.255.90.31:10000/getExcel' + (devices[current_device].split(':')[0]).toString()))
                        //                   .then((HttpClientRequest request) {
                        //                     return request.close();
                        //                   })
                        //                   .then((HttpClientResponse response) {
                        //                     response.transform(utf8.decoder).listen((d) => _downloadData.write(d),
                        //                       onDone: ()
                        //                        {
                        //                         //print('QQQQQQQQQQQQQQQQQQQQQ');
                        //                         //print(_downloadData.toString());
                        //                         String all_excel = _downloadData.toString();
                        //                         var all_rows = all_excel.split('&');
                        //                         List<List<dynamic>> new_rows = [];
                        //                         List<dynamic> new_row = [];
                        //                         new_row.add("lux");
                        //                         new_row.add("tmp");
                        //                         new_row.add("ph");
                        //                         new_row.add("humid");
                        //                         new_row.add("date");
                        //                         new_row.add("time");
                        //                         new_rows.add(new_row);
                        //                         //if(all_excel != '')
                        //                         //{
                        //                         for(int i=0; i<all_rows.length; i++)
                        //                         {
                        //                             String row = all_rows[i];
                        //                             List<dynamic> new_row = [];
                        //                             var cells = row.split(',');
                        //                             if(cells.length > 4)
                        //                             {
                        //                                 new_row.add(cells[0]);
                        //                                 new_row.add(cells[1]);
                        //                                 new_row.add(cells[2]);
                        //                                 new_row.add(cells[3]);
                        //                                 new_row.add(cells[4]);
                        //                                 new_row.add(cells[5]);
                        //                                 new_rows.add(new_row);
                        //                             }

                        //                         }
                        //                         //}

                        //                         String csv = const ListToCsvConverter().convert(new_rows);

                        //                         //String dir = '/storage/emulated/0/Download';
                        //                         //String file = 'E:\\';
                        //                         String file = "$dir";

                        //                         //print(file);
                        //                         File f = File(file + "/history_device1.csv");
                        //                         f.writeAsString(csv);
                        //                         Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessfulDownload()),);
                        //                        }
                        //                     );
                        //                   });

                        //       }

                        //       catch(error)
                        //       {
                        //           //print('can not download');
                        //           Navigator.push(context,MaterialPageRoute(builder: (context) => FailedDownload()));
                        //       }

                        //     }
                        //   )
                        // ),
                        //   Container
                        //   (
                        // //alignment: Alignment.,
                        //     padding: const EdgeInsets.all(10), //distance from up and down
                        //     child: Image.asset
                        //     ("images/logo1 (1)_prev_ui.png",
                        //       fit: BoxFit.cover,
                        //       height: _mediaQueryData.size.height * 0.10,
                        //       width: _mediaQueryData.size.width * 0.20,
                        //     )
                        //   ),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            color: status,
                            size: 25,
                          ),
                          TextButton(
                            child: Icon(
                              Icons.add_alert_rounded,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              menu_device_active = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HistoryActuator()),
                              );
                            },
                          ),
                          TextButton(
                            child: Icon(
                              Icons.home_filled,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              menu_device_active = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                          ),
                          //     TextButton
                          //     (
                          //       child: Icon
                          // (
                          //   Icons.settings,
                          //   color: Colors.black,
                          //   size: 20,
                          // ),
                          //       onPressed: ()
                          //       {
                          //         //settings
                          //       },
                          //     ),
                          // TextButton
                          // (
                          //   child: Text(
                          //     current_device.toString(),
                          //     style: TextStyle(fontSize: 10 , color: Colors.black),
                          //   ),
                          //   onPressed: ()
                          //   {
                          //     //exit
                          //     Navigator.pop(context);
                          //   },
                          // ),
                        ],
                      ),

                      // Container(
                      //   // color: Colors.red,
                      //   child: notification,
                      // ),

                      // Container(
                      //     // color: Colors.blue,
                      //     alignment: Alignment.topRight,
                      //     padding: const EdgeInsets.all(
                      //         10), //distance from up and down
                      //     child: const Text(
                      //       '',
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 15),
                      //     )),

                      //          Container
                      //           (
                      //             width: 350.0,
                      //             height: 160.0,
                      //             child: ListView
                      //             (
                      //                 children: <Widget>[
                      //           Container
                      //           (
                      //             alignment: Alignment.topRight,
                      //             padding: const EdgeInsets.all(10), //distance from up and down
                      //             child: Text(
                      //               'وضعیت دستگاه : ' + device_state ,
                      //               style: TextStyle(
                      //                   color: color_device_state,
                      //                   fontWeight: FontWeight.w500,
                      //                   fontSize: 15),
                      //             )),
                      //         Container
                      //         (
                      //             alignment: Alignment.topRight,
                      //             padding: const EdgeInsets.all(10),
                      //             child: Text(
                      //               'آخرین بروزرسانی :' + lastupdate,
                      //               style: TextStyle
                      //               (
                      //                 color: Colors.white,
                      //                 fontSize: 15),
                      //             )),
                      //           //    Container
                      //           // (
                      //           //   alignment: Alignment.topRight,
                      //           //   padding: const EdgeInsets.all(10), //distance from up and down
                      //           //   child: const Text(
                      //           //      'خطای دستگاه :',
                      //           //     style: TextStyle(
                      //           //         color: Colors.white,
                      //           //         fontWeight: FontWeight.w500,
                      //           //         fontSize: 15),
                      //           //   )),
                      //              Container
                      //           (
                      //             alignment: Alignment.topRight,
                      //             padding: const EdgeInsets.all(10), //distance from up and down
                      //             child: const Text(
                      //                'تاریخ فعال سازی : 1402/04/02',
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.w500,
                      //                   fontSize: 15),
                      //             )),
                      //         ]
                      //             ),
                      //             decoration: BoxDecoration
                      //             (
                      //               color: Colors.black54,
                      //               borderRadius: BorderRadius.only
                      //               (
                      //                 topLeft: Radius.circular(20),
                      //                 topRight: Radius.circular(20),
                      //                 bottomLeft: Radius.circular(20),
                      //                 bottomRight: Radius.circular(20)
                      //               ),
                      //               boxShadow: [
                      //               BoxShadow
                      //               (
                      //                 color: Colors.grey.withOpacity(0.5),
                      //                 spreadRadius: 5,
                      //                 blurRadius: 7,
                      //                 offset: Offset(0, 3), // changes position of shadow
                      //               ),
                      // ],
                      //               border: Border.all
                      //               (
                      //                 color: Colors.black,
                      //                 width: 3.0,
                      //               ),
                      //            ),
                      //         ),
                      Container(
                          // color: Colors.green,
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            '',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      /*
                
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                         TextButton
                        (
            } 
            else
            {
              onoff_button_output2 = "on";
              color2 = Colors.pink;
              Future.delayed(Duration(seconds: 3)).then((_)
              {
                  print('delayyy');
                  color2 = Colors.red;
              });
              //mypin2_on();
            }
          });
                    })

                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),

              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 1',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output1,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                       TextButton
                        (
        child: Text(onoff_button_output1),
        style: TextButton.styleFrom(
        backgroundColor: color1,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output1 == "on") 
            {
              onoff_button_output1 = "off";
              color1 = Colors.grey;
              mypin1_off();
            } 
            else
            {
              onoff_button_output1 = "on";
              color1 = Colors.pink;
              //final response_get = await http.get(Uri.parse('http://localhost:10000/pin1_on'));
              mypin1_on();
            }
          });
                    }),


                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                  ]
                ),
                Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),*/
                      ...all_rows_pin,
                      ...all_rows_sensor,
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            '',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),

                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            '',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Colors.black,
                            size: 30,
                          ),
                          Container
                          (
                            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: ElevatedButton
                            (
                                child: const Text
                                ('+',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                                onPressed: () {
                                  setState(() {
                                    // Row new_row1 = new Row();
                                    // new_row1 = new scheduling_row1();
                                    if (count_scheduling[current_tab] < 20) 
                                    {
                                      count_scheduling[current_tab]++;
                                      visibilities[current_tab][count_scheduling[current_tab]] = true;
                                    }
                                  });
                                }),
                          ),
                          ElevatedButton(
                              child: const Text('-',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              style: ElevatedButton.styleFrom
                              (
                                primary: Colors.red,
                              ),
                              onPressed: () 
                              {
                                setState(() 
                                {
                                  // Row new_row1 = new Row();
                                  // new_row1 = new scheduling_row1();

                                  if ((count_scheduling[current_tab] < 20) && (count_scheduling[current_tab] > 0)) 
                                  {
                                    visibilities[current_tab][count_scheduling[current_tab]] = false;
                                    count_scheduling[current_tab]--;
                                  }
                                });
                              }),
                        ],
                      ),

                      addRow_scheduling1(0),
                      addRow_scheduling1(1),
                      addRow_scheduling1(2),
                      addRow_scheduling1(3),
                      addRow_scheduling1(4),
                      addRow_scheduling1(5),
                      addRow_scheduling1(6),
                      addRow_scheduling1(7),
                      addRow_scheduling1(8),
                      addRow_scheduling1(9),
                      addRow_scheduling1(10),
                      addRow_scheduling1(11),
                      addRow_scheduling1(12),
                      addRow_scheduling1(13),
                      addRow_scheduling1(14),
                      addRow_scheduling1(15),
                      addRow_scheduling1(16),
                      addRow_scheduling1(17),
                      addRow_scheduling1(18),
                      addRow_scheduling1(19),
                    ] //
                            ) //
                    )
              ],
            )));
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("درباره ما"),
        // backgroundColor: Color.fromARGB(255, 201, 196, 196),
        // foregroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        // color: Colors.purple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "فناوران سامانه های راهبردی شریف",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                color: Color.fromARGB(255, 220, 220, 220),
                child: SizedBox(
                  height: _mediaQueryData.size.height * 0.63,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    // physics: ClampingScrollPhysics(),
                    child: Text
                    (
                      "هسته اولیه شرکت در سال 1387 فعالیت‌ تحقیقاتی خود را در دانشگاه صنعتی شریف آغاز نموده و در سال 1389 در قالب نخستین هسته دانش بنیان در مرکز کارآفرینی این دانشگاه مستقر گردید. هدف اصلی از تشکیل این مجموعه طراحی، ساخت و بومی‌سازی انواع سامانه‌‌های مهندسی و نیز زیر سیستم‌های حساس آنها‌، با انگیزه قطع وابستگی ایران به خارج از کشور بوده است .\n\nپس از ثبت شرکت “فناوران سامانه های راهبردی شریف ” در سال 1391، استقرار در مرکز رشد فناوریهای پیشرفته صنعنی شریف و گسترش فعالیت های آن و نیز  با بكارگيرى نيروهاى زبده و متخصص،این مجموعه موفق به ارائه محصولات و خدمات متنوعی در زمينه سامانه‌های پیشرفته مکانیکی و الکترونیکی و همچنین اخذ تاییدیه دانش بنیان با رتبه صنعتی از سوی معاونت علمی و فناوری ریاست جمهوری گردید.\n\nشرکت “فناوران سامانه های راهبردی شریف ” ضمن خروج موفقیت آمیز از مرکز رشد شریف در سال 1394 و همزمان با رشد چشمگیر تولید محصولات خود که با برند RealSim به بازار عرضه می گردد، هم اکنون با بهره مندی از سرمایه انسانی متخصص و نخبه ، ارتباط مستمر با اساتید صاحب نام دانشگاه صنعتی شریف و مشاورین زبده صنعتی و نیز بهره مندی از امکانات سخت افزاری مناسب در بخش تولید، به کسب سهم بازار قابل توجه در حوزه های تجهیزات و ماشین آلات پیشرفته صنعتی ، فناوریهای پیشرفته در بخش سامانه های فرایندی و اتوماسیون و هوشمندسازی بر مبنای اینترنت اشیا صنعتی و ایجاد زیرساخت های صادرات محصولات و خدمات دانش بنیان به کشورهای منطقه می اندیشد.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromARGB(255, 32, 42, 115),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    //"خیابان شهید محمدحسین علی اکبری ،\nخیابان شهید استاد مطهری ، پلاک 165 ،\nساختمان سختا ، طبقه دوم",
                    'تهران، خیابان مطهری، بعد از مترو مفتح، پ۱۶۵',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Image.asset(
                      "images/logo1 (1)_prev_ui.png",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryActuator extends StatefulWidget {
  const HistoryActuator({Key? key}) : super(key: key);
  @override
  State<HistoryActuator> createState() => _HistoryActuator();
}

class _HistoryActuator extends State<HistoryActuator> {
  var dir = Directory('');
  //String cont = '';
  String win_dir = 'E:/history_actuator.txt';
  String contents = '';
  Map<Permission, PermissionStatus> statuses = {};
  void read_history_file() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/history_actuator.txt');
      contents = await file.readAsString();
      var txt_time = contents.split('&');
      for (int i = 0; i < 10; i++) {
        setState(() {
          notifs_txt[i] = txt_time[i].split('%')[0];
          notifs_time[i] = txt_time[i].split('%')[1];
        });
      }
    } catch (e) {}
    // Map<Permission, PermissionStatus> statuses = await
    //   [
    //   Permission.storage,
    //   ].request();
  }

  @override
  void initState() {
    super.initState();
    try {
      read_history_file();
    }
    //Navigator.push(context,MaterialPageRoute(builder: (context) => Success_page()),);
    catch (error) {
      //Navigator.push(context,MaterialPageRoute(builder: (context) => IncorrectPass()),);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    final children = <Widget>[];
    children.add(//Positioned
        //           (
        //             top: 5,
        //             right: 10,
        /*child:*/ Container(
            padding: const EdgeInsets.all(5), //distance from up and down
            child: EnglishStyle('history', Colors.black)));
    for (int i = 0; i < 10; i++) {
      children.add(
        Row(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  notifs_txt[i],
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ))
          ],
        ),
      );
      children.add(
        Row(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  notifs_time[i],
                  style: const TextStyle(color: Colors.black, fontSize: 10),
                ))
          ],
        ),
      );
    }
    return new Scaffold(
        appBar: AppBar(
          title: const Text('تاریخچه عملگر'),
          // backgroundColor: Color.fromARGB(255, 201, 196, 196),
          // foregroundColor: Colors.black,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()
              // onPressed: ()
              // async
              // {
              //      Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_act_sensor()));
              //      // var bytes = await consolidateHttpClientResponseBytes(response);
              //       // Map<Permission, PermissionStatus> statuses = await
              //       // [
              //       // Permission.storage,
              //       // ].request();
              //      //String file = 'E:\\';
              //      //dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);

              // }
              ),
        ),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                  // width: 340.0,
                  // height: 500,
                  width: _mediaQueryData.size.width * 0.9,
                  height: _mediaQueryData.size.height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                  child:

                      // Positioned
                      // (
                      //   top:15,
                      //   left:60,
                      //   child: SizedBox
                      //   (
                      //   height: 50,
                      //   width: 80,
                      //   child: ElevatedButton
                      //   (
                      //     onPressed: ()
                      //     {

                      //     },
                      //     style: ElevatedButton.styleFrom
                      //     (
                      //     shape: RoundedRectangleBorder
                      //     (
                      //       borderRadius: BorderRadius.circular(12),
                      //     ), primary: Colors.white,
                      //     side: const BorderSide
                      //     (
                      //         width: 2,
                      //         color: Colors.pink,
                      //     )
                      //     ),
                      //     child: const Text
                      //     (
                      //       'نمایش همه',
                      //        style: TextStyle(
                      //         color: Colors.pink,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 10)
                      //     ),
                      //   )
                      //   ),
                      //   ),
                      ListView(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    children: children,
                  )),
            )));
  }
}

class Main_page2 extends StatefulWidget {
  const Main_page2({Key? key}) : super(key: key);
  @override
  State<Main_page2> createState() => _Main_page2();
}

class _Main_page2 extends State<Main_page2> {
  void myreceive_dev2() async {
    try {
      final response_get1 =
          await http.get(Uri.parse('http://185.255.90.31:10000/receive_dev2'));

      setState(() {
        if (response_get1.body == 'off') {
          device_state = 'آفلاین';
          color_device_state = Color.fromARGB(255, 243, 127, 26);
        } else {
          final all_sensors = response_get1.body.split('&');
          device_state = 'آنلاین';
          color_device_state = Color.fromARGB(255, 36, 228, 43);
          temperature = all_sensors[0].split('=')[1];
          humid = all_sensors[1].split('=')[1];
          ph = all_sensors[2].split('=')[1];
          lux = all_sensors[3].split('=')[1];
        }
      });
    } catch (Exception) {
      // Notify.showNotification(
      //   title: "خطا",
      //   body: "اتصال برقرار نیست",
      //   flnp: flutterLocalNotificationsPlugin,
      // );
    }
  }

  void get_lastupdate() async {
    try {
      final response_get = await http
          .get(Uri.parse('http://185.255.90.31:10000/get_lastupdate2'));
      setState(() {
        lastupdate = response_get.body.split('-')[0] +
            '/' +
            response_get.body.split('-')[1] +
            '/' +
            response_get.body.split('-')[2];
      });
    } catch (error) {
      // Notify.showNotification(
      //   title: "خطا",
      //   body: "اتصال برقرار نیست",
      //   flnp: flutterLocalNotificationsPlugin,
      // );
    }
  }

  // int id_obj = count_Main_page2;
  TextEditingController date_controller = TextEditingController();
  bool check_box_value = true;
  String onoff_input1 = 'روشن';
  String onoff_input2 = 'خاموش';
  String onoff_input3 = 'روشن';
  String onoff_input4 = 'روشن';
  String onoff_output1 = 'off';
  String onoff_output2 = 'on';
  String onoff_button_output1 = 'off';
  String onoff_button_output2 = 'off';
  String temperature = '0';
  String humid = '0';
  String ph = '0';
  String lux = '0';
  String temperature2 = '0';
  String humid2 = '0';
  String ph2 = '0';
  String lux2 = '0';
  String device_state = 'آنلاین';
  String lastupdate = '';
  Color color_device_state = Color.fromARGB(255, 36, 228, 43);
  final List<String> history = <String>[];
  final List<String> date = <String>[];
  int int1 = 1544;
  int int3 = 1445;
  int int4 = 1544;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  @override
  void initState() {
    super.initState();
    get_lastupdate();
    myreceive_dev2();
    Timer _everySecond = Timer.periodic(
      Duration(seconds: 20),
      (Timer t) async {
        // if(Main_page_route2.isCurrent && id_obj == count_Main_page2)
        // {
        //   try
        //   {
        //         final response_get1 = await http.get(Uri.parse('http://185.255.90.31:10000/receive_dev2'));

        //         setState(()
        //         {
        //           if(response_get1.body == 'off')
        //           {
        //               device_state = 'آفلاین';
        //               color_device_state = Color.fromARGB(255, 243, 127, 26);
        //           }
        //           else
        //           {
        //               final all_sensors = response_get1.body.split('&');
        //               device_state = 'آنلاین';
        //               color_device_state = Color.fromARGB(255, 36, 228, 43);
        //               temperature = all_sensors[0].split('=')[1];
        //               humid = all_sensors[1].split('=')[1];
        //               ph = all_sensors[2].split('=')[1];
        //               lux = all_sensors[3].split('=')[1];
        //           }
        //         });

        //   }
        //   catch(Exception)
        //   {

        //   }
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);

    /*
    history.add('ورودی 4 روشن شد');
    date.add('22 خرداد 7:20 ب.ظ');
    history.add('ورودی 4 خاموش شد');
    date.add('31 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 2 خاموش شد');
    date.add('21 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 1 روشن شد');
    date.add('20 اردیبهشت 2:20 بامداد');
    history.add('دستگاه آنلاین شد');
    date.add('18 اردیبهشت 4:54 ق.ب');
    history.add('دستگاه آفلاین شد');
    date.add('17 اردیبهشت 7:20 ب.ظ');
    history.add('ورودی 2 روشن شد');
    date.add('16 اردیبهشت 3:28 ب.ظ');*/

    /* Timer _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t)
                  {
                        receive_dev1().then((String result)
                        {
                        setState(()
                        {
                          temperature = result;
                        });
});

                  });*/
    return new Scaffold(
        appBar: new AppBar(
          title: Text('دستگاه 2'),
        ),
        //drawer: const NavigationDrawer(),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/

                ListView(scrollDirection: Axis.vertical, children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                        height: 50,
                        width: 90,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: date_controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(), //frame
                              labelText: 'روز',
                            ),
                          ),
                        )),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                            child: const Text('گزارش'),
                            onPressed: ()
                                //final response = await http.get(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                                async {
                              try {
                                // var httpClient = new HttpClient();
                                // var request = await httpClient.getUrl(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                                // var response = await request.close();
                                // var bytes = await consolidateHttpClientResponseBytes(response);
                                Map<Permission, PermissionStatus> statuses =
                                    await [
                                  Permission.storage,
                                ].request();
                                String dir = await ExternalPath
                                    .getExternalStoragePublicDirectory(
                                        ExternalPath.DIRECTORY_DOWNLOADS);
                                final response = await http.post(
                                  Uri.parse(
                                      'http://185.255.90.31:10000/getDate2'),
                                  //headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                                  body: jsonEncode(<String, String>{
                                    'day': date_controller.text,
                                  }),
                                );
                                HttpClient client = new HttpClient();
                                var _downloadData = StringBuffer();
                                client
                                    .getUrl(Uri.parse(
                                        'http://185.255.90.31:10000/getExcel2'))
                                    .then((HttpClientRequest request) {
                                  return request.close();
                                }).then((HttpClientResponse response) {
                                  response
                                      .transform(utf8.decoder)
                                      .listen((d) => _downloadData.write(d),
                                          onDone: () {
                                    //print('QQQQQQQQQQQQQQQQQQQQQ');
                                    //print(_downloadData.toString());
                                    String all_excel = _downloadData.toString();
                                    var all_rows = all_excel.split('&');
                                    List<List<dynamic>> new_rows = [];
                                    List<dynamic> new_row = [];
                                    new_row.add("lux");
                                    new_row.add("tmp");
                                    new_row.add("ph");
                                    new_row.add("humid");
                                    new_row.add("date");
                                    new_row.add("time");
                                    new_rows.add(new_row);
                                    for (int i = 0; i < all_rows.length; i++) {
                                      String row = all_rows[i];
                                      List<dynamic> new_row = [];
                                      var cells = row.split(',');
                                      if (cells.length > 4) {
                                        new_row.add(cells[0]);
                                        new_row.add(cells[1]);
                                        new_row.add(cells[2]);
                                        new_row.add(cells[3]);
                                        new_row.add(cells[4]);
                                        new_row.add(cells[5]);
                                        new_rows.add(new_row);
                                      }
                                    }

                                    String csv = const ListToCsvConverter()
                                        .convert(new_rows);

                                    //String dir = '/storage/emulated/0/Download';
                                    //String dir = 'E:\\';
                                    String file = "$dir";
                                    //print(file);
                                    File f =
                                        File(file + "/history_device2.csv");
                                    f.writeAsString(csv);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SuccessfulDownload()),
                                    );
                                  });
                                });
                              } catch (error) {
                                // Notify.showNotification(
                                //   title: "خطا",
                                //   body: "اتصال برقرار نیست",
                                //   flnp: flutterLocalNotificationsPlugin,
                                // );
                                //print('can not download');
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             FailedDownload()));
                              }
                            })),
                    //   Container
                    //   (
                    // //alignment: Alignment.,
                    //     padding: const EdgeInsets.all(10), //distance from up and down
                    //     child: Image.asset
                    //     ("images/logo.png",
                    //       fit: BoxFit.cover,
                    //       height: _mediaQueryData.size.height * 0.06,
                    //       width: _mediaQueryData.size.width * 0.14,
                    //     )
                    //   ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //     TextButton
                      //     (
                      //       child: Icon
                      // (
                      //   Icons.add_alert_rounded,
                      //   color: Colors.black,
                      //   size: 20,
                      // ),
                      //       onPressed: ()
                      //       {
                      //         //zangule
                      //       },
                      //     ),
                      TextButton(
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          //settings
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'خروج',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        onPressed: () {
                          //exit
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Container(
                    width: 350.0,
                    height: 160.0,
                    child: ListView(children: <Widget>[
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: Text(
                            'وضعیت دستگاه :' + device_state,
                            style: TextStyle(
                                color: color_device_state,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'آخرین بروزرسانی :' + lastupdate,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                      //    Container
                      // (
                      //   alignment: Alignment.topRight,
                      //   padding: const EdgeInsets.all(10), //distance from up and down
                      //   child: const Text(
                      //      'خطای دستگاه :',
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 15),
                      //   )),
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            'تاریخ فعال سازی : 1402/04/15',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                    ]),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  /*Row
                (
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [  
                    Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 2',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output2,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                         TextButton
                        (
        child: Text(onoff_button_output2),
        style: TextButton.styleFrom(
        backgroundColor: color2,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output2 == "on") 
            {
              onoff_button_output2 = "off";
              color2 = Colors.grey;
              mypin2_off();
            } 
            else
            {
              onoff_button_output2 = "on";
              color2 = Colors.pink;
              mypin2_on();
            }
          });
                    })

                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),

              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 1',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output1,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                       TextButton
                        (
        child: Text(onoff_button_output1),
        style: TextButton.styleFrom(
        backgroundColor: color1,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output1 == "on") 
            {
              onoff_button_output1 = "off";
              color1 = Colors.grey;
              mypin1_off();
            } 
            else
            {
              onoff_button_output1 = "on";
              color1 = Colors.pink;
              //final response_get = await http.get(Uri.parse('http://localhost:10000/pin1_on'));
              mypin1_on();
            }
          });
                    }),


                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                  ]
                ),*/
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Row(children: <Widget>[
                    Container(
                      width: 170.0,
                      height: 250.0,
                      child: Column(children: <Widget>[
                        Container(
                            //alignment: Alignment.,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Image.asset(
                              "images/lux-removebg-preview.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.1,
                              //width: _mediaQueryData.size.width * 0.05,
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text(
                              'روشنایی',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        /*Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: ElevatedButton
                (
                  onPressed: ()
                  {

                  },
                  /*async
                  {
                    final response_get2 = await http.get(Uri.parse('http://localhost:10000/receive_dev1'));
                    setState(()
                    {
                          final all_sensors = response_get2.body.split('&');
                          print('aliii');
                          print(response_get2.body);
                          print(all_sensors);
                          temperature = all_sensors[2].split('=')[1];
                          humid = all_sensors[3].split('=')[1];
                          ph = all_sensors[4].split('=')[1];
                          lux = all_sensors[5].split('=')[1];
                    });
                  },*/
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.black,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.black,
                  )
                  ),
                  child: const Text
                  (
                    'دریافت',
                     style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
                        /*Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )*/
                        ),*/
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              lux,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 170.0,
                      height: 250.0,
                      child: Column(children: <Widget>[
                        Container(
                            //alignment: Alignment.,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Image.asset(
                              "images/temp-removebg-preview.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.1,
                              //width: _mediaQueryData.size.width * 0.03,
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text(
                              'دما',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              temperature,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ]),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Row(children: <Widget>[
                    Container(
                      width: 170.0,
                      height: 250.0,
                      child: Column(children: <Widget>[
                        Container(
                            //alignment: Alignment.,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Image.asset(
                              "images/soil-removebg-preview.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.1,
                              //width: _mediaQueryData.size.width * 0.04,
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                8), //distance from up and down
                            child: const Text(
                              'ph',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              ph,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 170.0,
                      height: 250.0,
                      child: Column(children: <Widget>[
                        Container(
                            //alignment: Alignment.,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Image.asset(
                              "images/humid-removebg-preview.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.1,
                              //width: _mediaQueryData.size.width * 0.04,
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text(
                              'رطوبت',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              humid,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ]),

                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),

                  // Row
                  // (
                  //  children: <Widget>
                  //  [

                  //     ]
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text(
                          'پشتیبانی',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        onPressed: () {
                          //supportness
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'درباره ما',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        onPressed: () {
                          //about us
                        },
                      ),
                    ],
                  )
                ])
              ],
            )));
  }
}

class Admin_Main_page extends StatefulWidget {
  const Admin_Main_page({Key? key}) : super(key: key);

  @override
  State<Admin_Main_page> createState() => _Admin_Main_page();
}

class _Admin_Main_page extends State<Admin_Main_page> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  String onoff_input1 = 'روشن';
  String onoff_input2 = 'خاموش';
  String onoff_input3 = 'روشن';
  String onoff_input4 = 'روشن';
  String onoff_output1 = 'off';
  String onoff_output2 = 'on';
  String onoff_button_output1 = 'off';
  String onoff_button_output2 = 'on';
  final List<String> history = <String>[];
  final List<String> date = <String>[];
  int int1 = 1445;
  int int2 = 1544;
  int int3 = 1445;
  int int4 = 1544;
  Color color1 = Colors.white10;
  Color color2 = Colors.pink;
  @override
  Widget build(BuildContext context) {
    /*
    history.add('ورودی 4 روشن شد');
    date.add('22 خرداد 7:20 ب.ظ');
    history.add('ورودی 4 خاموش شد');
    date.add('31 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 2 خاموش شد');
    date.add('21 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 1 روشن شد');
    date.add('20 اردیبهشت 2:20 بامداد');
    history.add('دستگاه آنلاین شد');
    date.add('18 اردیبهشت 4:54 ق.ب');
    history.add('دستگاه آفلاین شد');
    date.add('17 اردیبهشت 7:20 ب.ظ');
    history.add('ورودی 2 روشن شد');
    date.add('16 اردیبهشت 3:28 ب.ظ');*/
    return new Scaffold(
        appBar: new AppBar(
          title: Text('صفحه اصلی'),
        ),
        drawer: const Admin_NavigationDrawer(),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/

                ListView(scrollDirection: Axis.vertical, children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //     TextButton
                      //     (
                      //       child: Icon
                      // (
                      //   Icons.add_alert_rounded,
                      //   color: Colors.black,
                      //   size: 20,
                      // ),
                      //       onPressed: ()
                      //       {
                      //         //zangule
                      //       },
                      //     ),
                      TextButton(
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          //settings
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'خروج',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        onPressed: () {
                          //exit
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Container(
                    width: 350.0,
                    height: 160.0,
                    child: ListView(children: <Widget>[
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            'وضعیت دستگاه : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'آخرین بروزرسانی : ',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                      //    Container
                      // (
                      //   alignment: Alignment.topRight,
                      //   padding: const EdgeInsets.all(10), //distance from up and down
                      //   child: const Text(
                      //      'خطای دستگاه :',
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 15),
                      //   )),
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text(
                            'تاریخ فعال سازی : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                    ]),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 170.0,
                          height: 200.0,
                          child: Column(children: <Widget>[
                            Icon(
                              Icons.output,
                              color: Colors.red[500],
                              size: 60,
                            ),
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    10), //distance from up and down
                                child: const Text(
                                  'خروجی 2',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )),
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    5), //distance from up and down
                                child: Text(
                                  onoff_output2,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    10), //distance from up and down
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 0),
                                )),
                            TextButton(
                                child: Text(onoff_button_output2),
                                style: TextButton.styleFrom(
                                  backgroundColor: color2,
                                  primary: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (onoff_button_output2 == "on") {
                                      onoff_button_output2 = "off";
                                      color2 = Colors.grey;
                                    } else {
                                      onoff_button_output2 = "on";
                                      color2 = Colors.pink;
                                    }
                                  });
                                })
                          ]),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black,
                              width: 3.0,
                            ),
                          ),
                        ),
                        Container(
                          width: 170.0,
                          height: 200.0,
                          child: Column(children: <Widget>[
                            Icon(
                              Icons.output,
                              color: Colors.red[500],
                              size: 60,
                            ),
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    10), //distance from up and down
                                child: const Text(
                                  'خروجی 1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )),
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    5), //distance from up and down
                                child: Text(
                                  onoff_output1,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    10), //distance from up and down
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 0),
                                )),
                            TextButton(
                                child: Text(onoff_button_output1),
                                style: TextButton.styleFrom(
                                  backgroundColor: color1,
                                  primary: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (onoff_button_output1 == "on") {
                                      onoff_button_output1 = "off";
                                      color1 = Colors.grey;
                                    } else {
                                      onoff_button_output1 = "on";
                                      color1 = Colors.pink;
                                    }
                                  });
                                }),
                          ]),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                              color: Colors.black,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ]),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Row(children: <Widget>[
                    Container(
                      width: 170.0,
                      height: 200.0,
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text(
                              'روشنایی',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              onoff_input2,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              int2.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 170.0,
                      height: 200.0,
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text(
                              'دما',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              onoff_input1,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              int1.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ]),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Row(children: <Widget>[
                    Container(
                      width: 170.0,
                      height: 200.0,
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text(
                              'ph',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              onoff_input3,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              int3.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 170.0,
                      height: 200.0,
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text(
                              'رطوبت',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              onoff_input4,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              '',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0),
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: Text(
                              int4.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )),
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ]),
                  Container(
                      alignment: Alignment.topRight,
                      padding:
                          const EdgeInsets.all(10), //distance from up and down
                      child: const Text(
                        '',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                  Row(children: <Widget>[
                    Container(
                      width: 340.0,
                      height: 500,
                      child: Stack(children: <Widget>[
                        Positioned(
                          top: 5,
                          right: 5,
                          child: Container(
                              padding: const EdgeInsets.all(
                                  10), //distance from up and down
                              child: const Text(
                                'history',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              )),
                        ),
                        //   Positioned
                        //   (
                        //     top:15,
                        //     left:60,
                        //     child: SizedBox
                        //     (
                        //     height: 50,
                        //     width: 80,
                        //     child: ElevatedButton
                        //     (
                        //       onPressed: ()
                        //       {

                        //       },
                        //       style: ElevatedButton.styleFrom
                        //       (
                        //       shape: RoundedRectangleBorder
                        //       (
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //       primary: Colors.white,
                        //       side: BorderSide
                        //       (
                        //           width: 2,
                        //           color: Colors.pink,
                        //       )
                        //       ),
                        //       child: const Text
                        //       (
                        //         'نمایش همه',
                        //          style: TextStyle(
                        //           color: Colors.pink,
                        //           fontWeight: FontWeight.w500,
                        //           fontSize: 10)
                        //       ),
                        //     )
                        // ),
                        //     ),

/*
                Positioned
                (
                  top: 60,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 85,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '22 خرداد 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),),

                 Positioned
                (
                  top: 120,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 145,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '31 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 
               
                 Positioned
                (
                  top: 180,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 205,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '21 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 240,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 1 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 265,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '20 اردیبهشت 2:20 بامداد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 300,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آنلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 325,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '18 اردیبهشت 4:54 ق.ب',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 360,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آفلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 385,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '17 اردیبهشت 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 420,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 445,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '16 اردیبهشت 3:28 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                Positioned
                (
                   top: 80,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),  

                Positioned
                (
                   top: 140,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 200,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 260,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 320,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 380,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),

                 Positioned
                (
                   top: 440,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), */
                      ]),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text(
                          'پشتیبانی',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        onPressed: () {
                          //supportness
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'درباره ما',
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                        onPressed: () {
                          //about us
                        },
                      ),
                    ],
                  )
                ])
              ],
            )));
  }
}

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_in();
}

class _Sign_in extends State<Sign_in> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool check_box_value = true;

  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
        appBar: new AppBar(
          //toolbarHeight: 20,
          title: new Text('ثبت نام'),
        ),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
                // Positioned
                // (
                //  top: 0,
                //  right: 0,
                //  child: Container
                //   (
                //     width: _mediaQueryData.size.width * 0.9,
                //     height: 50.0,
                //     child: Stack
                //     (
                //         children: <Widget>
                //         [
                //           Positioned(
                //             top: 0,
                //             right: 0,
                //           child: Container(
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.all(10), //distance from up and down
                //             child: const Text(
                //                'داشبورد انحصاری فناوران شریف',
                //               style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.w500,
                //                   fontSize: 10),
                //             ))),
                //         Container(
                //             alignment: Alignment.center,
                //             padding: const EdgeInsets.all(10),
                //             child: const Text(
                //               'پشتیبانی',
                //               style: TextStyle
                //               (
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 12),
                //             )),

                //             Positioned
                //           (
                //             top:3,
                //             left:5,
                //             child: SizedBox
                //             (
                //             height: _mediaQueryData.size.height / 20,
                //             width: _mediaQueryData.size.width / 5,
                //             //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                //             child: ElevatedButton
                //             (
                //               onPressed: ()
                //               {

                //               },
                //               style: ElevatedButton.styleFrom
                //               (
                //               shape: RoundedRectangleBorder
                //               (
                //                 borderRadius: BorderRadius.circular(12),
                //               ),
                //               primary: Colors.black,
                //               side: BorderSide
                //               (
                //                   width: 2,
                //                   color: Colors.black,
                //               )
                //               ),
                //               child: const Text
                //               (
                //                 'آشنایی با ما',
                //                  style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w500,
                //                   fontSize: 10)
                //               ),
                //             )
                //         ),
                //             ),
                //         ]
                //             ),
                //             decoration: BoxDecoration
                //             (
                //               color: Colors.white10,
                //               borderRadius: BorderRadius.only
                //               (
                //                 topLeft: Radius.circular(10),
                //                 topRight: Radius.circular(10),
                //                 bottomLeft: Radius.circular(10),
                //                 bottomRight: Radius.circular(10)
                //               ),
                //               boxShadow: [
                //               BoxShadow
                //               (
                //                 color: Colors.grey.withOpacity(0.5),
                //                 spreadRadius: 5,
                //                 blurRadius: 7,
                //                 offset: Offset(0, 3), // changes position of shadow
                //               ),
                // ],
                //               border: Border.all
                //               (
                //                 color: Colors.black,
                //                 width: 3.0,
                //               ),
                //            ),
                //         ),
                //         ),
                Center(
                  //scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: _mediaQueryData.size.width * 0.9,
                      height: _mediaQueryData.size.height * 0.7,
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    10), //distance from up and down
                                child: const Text('')),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'نام',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: lastnameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'نام خانوادگی',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: usernameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'نام کاربری',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: phoneController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'شماره تماس',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextField(
                                obscureText: true,
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'رمز عبور',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextField(
                                obscureText: true,
                                controller: confirmpasswordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'تایید رمز عبور',
                                ),
                              ),
                            ),
                            CheckboxListTile(
                              title: Text("من با شرایط و ضوابط موافقم"),
                              activeColor: Colors.green,
                              value: check_box_value,
                              onChanged: (newValue) {
                                setState(() {
                                  if (check_box_value == false) {
                                    check_box_value = true;
                                  } else {
                                    check_box_value = false;
                                  }
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  child: const Text('ثبت نام'),
                                  onPressed: () async {
                                    //for using await

                                    if (passwordController.text ==
                                        confirmpasswordController.text) {
                                      try {
                                        final response = await http.post(
                                          Uri.parse(
                                              'http://185.255.90.31:10000/signin'),
                                          //headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                                          body: jsonEncode(<String, String>{
                                            'firstname': nameController.text,
                                            'lastname': lastnameController.text,
                                            'username': usernameController.text,
                                            'phone': phoneController.text,
                                            'password': passwordController.text,
                                            'confirmpassword':
                                                confirmpasswordController.text
                                          }),
                                        );
                                        if (response.body == 'ok') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SuccessfulSignIn()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FailedSignIn()),
                                          );
                                        }
                                      } catch (error) {
                                        // Notify.showNotification(
                                        //   title: "خطا",
                                        //   body: "اتصال برقرار نیست",
                                        //   flnp: flutterLocalNotificationsPlugin,
                                        // );

                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           FailedSignIn()),
                                        // );
                                      }
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IncorrectPass()),
                                      );
                                    }
                                    //print(response.statusCode);
                                    //print(response.body);
                                  },
                                )),
                            Row(
                              children: <Widget>[
                                const Text('حساب کاربری ندارید؟'),
                                TextButton(
                                  child: const Text(
                                    'ورود',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    //signup screen
                                  },
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ]),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),

                //         Positioned
                //         (
                //          top: _mediaQueryData.size.width * 0.14,
                //          right: _mediaQueryData.size.width * 0.18,
                //          child: Container
                //           (
                //             width: _mediaQueryData.size.width * 0.6,
                //             height: _mediaQueryData.size.height * 0.15,
                //             child: ListView
                //             (
                //                 children: <Widget>[
                //           Container(
                //             alignment: Alignment.centerRight,
                //             padding: const EdgeInsets.all(10), //distance from up and down
                //             child: const Text(
                //                'داشبورد انحصاری فناوران شریف',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w500,
                //                   fontSize: 15),
                //             )),
                //         Container(
                //             alignment: Alignment.centerRight,
                //             padding: const EdgeInsets.all(10),
                //             child: const Text(
                //               'مشخصات زیر را وارد کنید',
                //               style: TextStyle
                //               (
                //                 color: Colors.white,
                //                 fontSize: 10),
                //             )),
                //         ]
                //             ),
                //             decoration: BoxDecoration
                //             (
                //               color: Colors.pink,
                //               borderRadius: BorderRadius.only
                //               (
                //                 topLeft: Radius.circular(20),
                //                 topRight: Radius.circular(20),
                //                 bottomLeft: Radius.circular(20),
                //                 bottomRight: Radius.circular(20)
                //               ),
                //               boxShadow: [
                //               BoxShadow
                //               (
                //                 color: Colors.grey.withOpacity(0.5),
                //                 spreadRadius: 5,
                //                 blurRadius: 7,
                //                 offset: Offset(0, 3), // changes position of shadow
                //               ),
                // ],
                //               border: Border.all
                //               (
                //                 color: Colors.black,
                //                 width: 3.0,
                //               ),
                //            ),
                //         ),
                //         )
              ],
            )));
  }
}

class Device extends StatefulWidget {
  const Device({Key? key}) : super(key: key);

  @override
  State<Device> createState() => _Device();
}

class _Device extends State<Device> {
  TextEditingController serialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool check_box_value = true;
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Menu_device()))),
          //toolbarHeight: 20,
          title: new Text('افزودن دستگاه'),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/

              //scrollDirection: Axis.vertical,
              Center(
                child: Container(
                  width: _mediaQueryData.size.width * 0.9,
                  height: _mediaQueryData.size.height * 0.6,
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(
                                10), //distance from up and down
                            child: const Text('')),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: serialController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(), //frame
                              labelText: 'سریال دستگاه',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(), //frame
                              labelText: 'رمز دستگاه',
                            ),
                          ),
                        ),

                        // Container
                        // (
                        //   padding: const EdgeInsets.all(10),
                        //     child: TextField
                        //     (
                        //       controller: nameController,
                        //       decoration: const InputDecoration
                        //       (
                        //       border: OutlineInputBorder(), //frame
                        //       labelText: 'نام دستگاه',
                        //       ),
                        //     ),
                        // ),

                        Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text('افزودن دستگاه'),
                              onPressed: () async {
                                final response = await http.post(
                                  Uri.parse(
                                      'http://185.255.90.31:10000/add_device'),
                                  //headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                                  body: jsonEncode(<String, String>{
                                    'u': logged_id,
                                    's': serialController.text,
                                    'p': passwordController.text,
                                  }),
                                );
                                // print(response.statusCode);
                                // print(response.body);
                                if (response.body == 'n') //not found device
                                {
                                  // Notify.showNotification(
                                  //   title: "خطا",
                                  //   body: "اتصال برقرار نیست",
                                  //   flnp: flutterLocalNotificationsPlugin,
                                  // );

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => DeviceNotFound()),
                                  // );
                                } else if (response.body == 'e') //error
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IncorrectPass()),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Success_page()),
                                  );
                                  devices.add(response.body +
                                      ':' +
                                      serialController.text);
                                }
                              },
                            )),
                      ]),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                ),
              ),

              //         Positioned
              //         (
              //          top: _mediaQueryData.size.width * 0.14,
              //          right: _mediaQueryData.size.width * 0.18,
              //          child: Container
              //           (
              //             width: _mediaQueryData.size.width * 0.6,
              //             height: _mediaQueryData.size.height * 0.15,
              //             child: ListView
              //             (
              //                 children: <Widget>[
              //           Container(
              //             alignment: Alignment.centerRight,
              //             padding: const EdgeInsets.all(10), //distance from up and down
              //             child: const Text(
              //                'داشبورد انحصاری فناوران شریف',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 15),
              //             )),
              //         Container(
              //             alignment: Alignment.centerRight,
              //             padding: const EdgeInsets.all(10),
              //             child: const Text(
              //               'به پلتفرم فناوران شریف خوش آمدید',
              //               style: TextStyle
              //               (
              //                 color: Colors.white,
              //                 fontSize: 10),
              //             )),
              //         ]
              //             ),
              //             decoration: BoxDecoration
              //             (
              //               color: Colors.pink,
              //               borderRadius: BorderRadius.only
              //               (
              //                 topLeft: Radius.circular(20),
              //                 topRight: Radius.circular(20),
              //                 bottomLeft: Radius.circular(20),
              //                 bottomRight: Radius.circular(20)
              //               ),
              //               boxShadow: [
              //               BoxShadow
              //               (
              //                 color: Colors.grey.withOpacity(0.5),
              //                 spreadRadius: 5,
              //                 blurRadius: 7,
              //                 offset: Offset(0, 3), // changes position of shadow
              //               ),
              // ],
              //               border: Border.all
              //               (
              //                 color: Colors.black,
              //                 width: 3.0,
              //               ),
              //            ),
              //         ),
              //         ),
            ],
          ),
        ));
  }
}

class Admin_Device extends StatefulWidget {
  const Admin_Device({Key? key}) : super(key: key);

  @override
  State<Admin_Device> createState() => _Admin_Device();
}

class _Admin_Device extends State<Admin_Device> {
  @override
  TextEditingController modelController = TextEditingController();
  TextEditingController serialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();
  String path_image = '';
  bool check_box_value = true;

  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
        appBar: new AppBar(
          //toolbarHeight: 20,
          title: new Text('افزودن دستگاه'),
        ),
        body: new Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Container(
                      width: _mediaQueryData.size.width * 0.9,
                      height: _mediaQueryData.size.height * 0.7,
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(
                                    10), //distance from up and down
                                child: const Text('')),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: modelController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'مدل دستگاه',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: serialController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'سریال دستگاه',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'رمز دستگاه',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: outputController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(), //frame
                                  labelText: 'تعداد خروجی',
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextField(
                                obscureText: true,
                                controller: inputController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'تعداد ورودی',
                                ),
                              ),
                            ),
                            // Container
                            // (
                            //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            //   child: ElevatedButton
                            //   (
                            //     style: ElevatedButton.styleFrom
                            //     (
                            //       primary: Colors.deepPurpleAccent
                            //     ),
                            //     onPressed: () async
                            //     {
                            //           final result = await FilePicker.platform.pickFiles(allowMultiple: true );
                            //           if (result == null) //No file selected
                            //           {
                            //             print("No file selected");
                            //           }
                            //           else
                            //           {
                            //             path_image = result.paths[0].toString();
                            //             print(path_image);
                            //           }
                            //       },
                            //        child: const Text("انتخاب عکس"),
                            //   ),
                            // ),
                            /* RaisedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();

        if (picked != null) {
          print(picked.files.first.name);
        }
      },
    ),*/
                            CheckboxListTile(
                              title: Text("من با شرایط و ضوابط موافقم"),
                              activeColor: Colors.green,
                              value: check_box_value,
                              onChanged: (newValue) {
                                setState(() {
                                  if (check_box_value == false) {
                                    check_box_value = true;
                                  } else {
                                    check_box_value = false;
                                  }
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),

                            Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  child: const Text('اضافه کردن دستگاه'),
                                  onPressed: () async {
                                    //for using await
                                    final response = await http.post(
                                      Uri.parse(
                                          'http://185.255.90.31:10000/admin_add_device'),
                                      //headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                                      body: jsonEncode(<String, String>{
                                        'm': modelController.text,
                                        's': serialController.text,
                                        'p': passwordController.text,
                                        'o': outputController.text,
                                        'i': inputController.text,
                                        'g': path_image,
                                      }),
                                    );
                                    //print(response.statusCode);
                                    //print(response.body);
                                  },
                                )),
                          ]),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),

                //         Positioned
                //         (
                //          top: _mediaQueryData.size.width * 0.14,
                //          right: _mediaQueryData.size.width * 0.18,
                //          child: Container
                //           (
                //             width: _mediaQueryData.size.width * 0.6,
                //             height: _mediaQueryData.size.height * 0.15,
                //             child: ListView
                //             (
                //                 children: <Widget>[
                //           Container(
                //             alignment: Alignment.centerRight,
                //             padding: const EdgeInsets.all(10), //distance from up and down
                //             child: const Text(
                //                'داشبورد انحصاری فناوران شریف',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w500,
                //                   fontSize: 15),
                //             )),
                //         Container(
                //             alignment: Alignment.centerRight,
                //             padding: const EdgeInsets.all(10),
                //             child: const Text(
                //               'مشخصات زیر را وارد کنید',
                //               style: TextStyle
                //               (
                //                 color: Colors.white,
                //                 fontSize: 10),
                //             )),
                //         ]
                //             ),
                //             decoration: BoxDecoration
                //             (
                //               color: Colors.pink,
                //               borderRadius: BorderRadius.only
                //               (
                //                 topLeft: Radius.circular(20),
                //                 topRight: Radius.circular(20),
                //                 bottomLeft: Radius.circular(20),
                //                 bottomRight: Radius.circular(20)
                //               ),
                //               boxShadow: [
                //               BoxShadow
                //               (
                //                 color: Colors.grey.withOpacity(0.5),
                //                 spreadRadius: 5,
                //                 blurRadius: 7,
                //                 offset: Offset(0, 3), // changes position of shadow
                //               ),
                // ],
                //               border: Border.all
                //               (
                //                 color: Colors.black,
                //                 width: 3.0,
                //               ),
                //            ),
                //         ),
                //         )
              ],
            )));
  }
}

class Success_change_zone_name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("موفقیت آمیز"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 220, 37),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            child: Column(
              children: [
                // Icon
                // (
                //   Icons.sentiment_satisfied_outlined,
                //   color: Color.fromARGB(255, 13, 130, 76),
                //   size: 50,
                // ),
                Text(
                  "تغییر نام با موفقیت انجام شد",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Success_delete_zone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("موفقیت آمیز"),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            //onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()))
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              //Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()));
              Menu_device_route =
                  MaterialPageRoute(builder: (context) => const Menu_device());
              Navigator.push(context, Menu_device_route);
            }),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 220, 37),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            child: Column(
              children: [
                // Icon
                // (
                //   Icons.sentiment_satisfied_outlined,
                //   color: Color.fromARGB(255, 13, 130, 76),
                //   size: 50,
                // ),
                Text(
                  "با موفقیت انجام شد",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Success_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("موفقیت آمیز"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 220, 37),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(
                  Icons.sentiment_satisfied_outlined,
                  color: Color.fromARGB(255, 13, 130, 76),
                  size: 50,
                ),
                Text(
                  "با موفقیت انجام شد",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeviceNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text("خطای کاربر"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 65, 62),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(Icons.error_outlined, color: Colors.yellow),
                Text(
                  "وسیله یافت نشد",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Incorrect_input_format extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text("خطای کاربر"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 65, 62),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(Icons.error_outlined, color: Colors.yellow),
                Text(
                  "فرمت ورودی درست نیست",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//user not found
class UserNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text("خطای کاربر"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 65, 62),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(Icons.error_outlined, color: Colors.yellow),
                Text(
                  "کاربری یافت نشد",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessfulSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("موفقیت آمیز"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 220, 37),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(
                  Icons.sentiment_satisfied_outlined,
                  color: Color.fromARGB(255, 13, 130, 76),
                  size: 50,
                ),
                Text(
                  "ثبت نام با موفقیت انجام شد",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InactiveConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text("خطای کاربر"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 65, 62),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(Icons.error_outlined, color: Colors.yellow),
                Text(
                  "اتصال برقرار نیست",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FailedSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text("خطای کاربر"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 65, 62),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(Icons.error_outlined, color: Colors.yellow),
                Text(
                  "ثبت نام ناموفق بود",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessfulDownload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("موفقیت آمیز"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 220, 37),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(
                  Icons.sentiment_satisfied_outlined,
                  color: Color.fromARGB(255, 13, 130, 76),
                  size: 50,
                ),
                Text(
                  "دانلود فایل با موفقیت انجام شد",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FailedDownload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text("خطای کاربر"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 65, 62),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(Icons.error_outlined, color: Colors.yellow),
                Text(
                  "دانلود فایل ناموفق بود",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//page when password is incorrect
class IncorrectPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text("خطای کاربر"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 65, 62),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            child: Column(
              children: [
                Icon(Icons.error_outlined, color: Colors.yellow),
                Text(
                  "رمز اشتباه است",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        ListTile(
          //leading: const Icon(),
          title: const Text('ورود'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          ),
        ),

        ListTile(
          //leading: const Icon(),
          title: const Text('تنظیمات'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          ),
        ),
        // ListTile
        // (
        //    //leading: const Icon(),
        //    title: const Text('ثبت نام'),
        //    onTap: () =>
        //       Navigator.push(context,MaterialPageRoute(builder: (context) => Sign_in()),),
        // ),

        // ListTile
        // (
        //    //leading: const Icon(),
        //    title: const Text('تاریخچه'),
        //    onTap: () =>
        //       Navigator.push(context,MaterialPageRoute(builder: (context) => History()),),
        // ),
        // ListTile
        // (
        //    //leading: const Icon(),
        //    title: const Text('وسیله‌ها'),
        //    onTap: () =>
        //       Navigator.push(context,MaterialPageRoute(builder: (context) => Get_Device()),),
        // ),
        // ListTile
        // (
        //    //leading: const Icon(),
        //    title: const Text('اضافه کردن دستگاه'),
        //    onTap: ()
        //    {
        //       if(logged_id == '1')
        //       {
        //           Navigator.push(context,MaterialPageRoute(builder: (context) => Admin_Device()),);
        //       }
        //       else
        //       {
        //           Navigator.push(context,MaterialPageRoute(builder: (context) => Device()),);
        //       }
        //    }
        // ),
        // ListTile
        // (
        //    //leading: const Icon(),
        //    title: const Text('اضافه کردن دستگاه بلوتوثی'),
        //    onTap: ()
        //    {
        //           Navigator.push(context,MaterialPageRoute(builder: (context) => Wifi()),);
        //    }
        // ),
      ],
    ));
  }
}

class Admin_NavigationDrawer extends StatelessWidget {
  const Admin_NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        ListTile(
          //leading: const Icon(),
          title: const Text('ورود'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          ),
        ),

        //             ListTile
        //             (
        //                //leading: const Icon(),
        //                title: const Text('ثبت نام'),
        //                onTap: () =>
        //                   Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Sign_in()),
        // ),
        //             ),
        //             ListTile
        //             (
        //                //leading: const Icon(),
        //                title: const Text('تاریخچه'),
        //                onTap: () =>
        //                   Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => History()),
        // ),
        //             ),
        ListTile(
          //leading: const Icon(),
          title: const Text('تنظیمات'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Settings()),
          ),
        ),
        ListTile(
          //leading: const Icon(),
          title: const Text('اضافه کردن دستگاه'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Admin_Device()),
          ),
        ),
      ],
    ));
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        drawer: const NavigationDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/

                Positioned(
                  bottom: 10,
                  left: 30,
                  child: TextButton(
                    child: const Text(
                      'درباره ما',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    onPressed: () {
                      //about us
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 80,
                  child: TextButton(
                    child: const Text(
                      'پشتیبانی',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    onPressed: () {
                      //supportness
                    },
                  ),
                ),
                Center(
                  child: Container(
                    width: _mediaQueryData.size.width * 0.9,
                    height: _mediaQueryData.size.height * 0.6,
                    child: ListView(children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(
                              10), //distance from up and down
                          child: const Text('')),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(), //frame
                            labelText: 'نام کاربری',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'رمز عبور',
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        title: Text("من را به یاد داشته باش"),
                        activeColor: Colors.green,
                        value: check_box_value,
                        onChanged: (newValue) {
                          setState(() {
                            if (check_box_value == false) {
                              check_box_value = true;
                            } else {
                              check_box_value = false;
                            }
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                      TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: const Text(
                          'رمز عبور را فراموش کرده ام',
                        ),
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            child: const Text('ورود'),
                            onPressed: () {
                              // print(nameController.text);
                              // print(passwordController.text);
                            },
                          )),
                      Row(
                        children: <Widget>[
                          const Text('حساب کاربری ندارید؟'),
                          TextButton(
                            child: const Text(
                              'ثبت نام',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              //signup screen
                            },
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ]),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  //right: 140,
                  right: 0,
                  child: Container(
                    width: _mediaQueryData.size.width * 0.9,
                    height: 50.0,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(
                                  5), //distance from up and down
                              child: const Text(
                                'داشبورد انحصاری فناوران شریف',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ))),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'پشتیبانی',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          )),
                      Positioned(
                        top: 3,
                        left: 5,
                        child: SizedBox(
                            height: _mediaQueryData.size.height / 20,
                            width: _mediaQueryData.size.width / 5,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  primary: Colors.black,
                                  side: BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  )),
                              child: const Text('آشنایی با ما',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 7)),
                            )),
                      ),
                    ]),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //top: 70,
                  //right: 440,
                  top: _mediaQueryData.size.width * 0.25,
                  right: _mediaQueryData.size.width * 0.18,
                  child: Container(
                    //width: 350.0,
                    //height: 110.0,
                    width: _mediaQueryData.size.width / 2,
                    height: _mediaQueryData.size.height * 0.12,
                    child: ListView(children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(
                              5), //distance from up and down
                          child: const Text(
                            'داشبورد فناوران شریف',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          )),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'به پلتفرم فناوران شریف خوش آمدید',
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          )),
                    ]),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("پشتیبانی"),
        // backgroundColor: Color.fromARGB(255, 201, 196, 196),
        // foregroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          // color: Colors.purple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تماس با ما",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "info@fanavaran-sharif.ir",
                    style: TextStyle(
                        // color: const Color.fromARGB(255, 121, 114, 114),
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "021-66088252",
                    style: TextStyle(
                        // color: const Color.fromARGB(255, 121, 114, 114),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Lock extends StatefulWidget 
{
  final bool onOffState;
  final String deviceAndPin;

  const Lock({
    Key? key,
    required this.onOffState,
    required this.deviceAndPin,
  }) : super(key: key);

  @override
  _LockState createState() => _LockState();
}

class _LockState extends State<Lock> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () 
    {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black.withOpacity(0.6),
      // color: Colors.blue,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey.shade900,
            Colors.grey,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "لطفاً کمی منتظر بمانید ...",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.onOffState
                ? [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Image.asset(
                        "images/off.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Image.asset(
                        "images/on.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]
                : [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Image.asset(
                        "images/on.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Image.asset(
                        "images/off.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.deviceAndPin,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
