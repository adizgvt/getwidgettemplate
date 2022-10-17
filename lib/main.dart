import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'dart:io';
import 'package:android_id/android_id.dart';
InputDecoration kinputDecoration(String label) {
  return InputDecoration(
      //labelStyle: TextStyle(fontSize: 20),
      labelText: label,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.all(15),
      border: const OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
              color: Colors.transparent, width: 1, style: BorderStyle.solid)));
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(appBarTheme: AppBarTheme(backgroundColor: GFColors.DARK)),
      //theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.purpleAccent)),
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _sampletextcontroller = TextEditingController();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  bool isChecked = false;
    late String dropdown = 'UI';
  //tring dropdown;
  int groupValue = 0;
  final _ratingController = TextEditingController();
  double _userRating = 4.5;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  final _androidIdPlugin = AndroidId();
  @override
  void initState() {
    super.initState();
    _getDeviceID();
    _ratingController.text = '4.5';
  }

  void _getDeviceID() async{
    if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('XXXXXXXXX');
      print(androidInfo.androidId);
      final String? androidId = await _androidIdPlugin.getId() ?? '';
      print(androidId);
      print('XXXXXXXXX');
    }
    else if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: GFColors.WHITE,
      appBar: GFAppBar(
        leading: GFIconButton(
          icon: Icon(
            Icons.message,
            color: Colors.white,
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
        searchBar: true,
        title: Text("GF Appbar"),
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
        ],
      ),
      drawer: GFDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://www.aimsglobal.com.my/web/service/Aim5.jpeg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.srcOver)),
              ),
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'user name',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'user@userid.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GFRadioListTile(
              titleText: 'Arthur Shelby',
              subTitleText: 'By order of the peaky blinders',
              avatar: GFAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
              ),
              size: 25,
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: GFRadioType.basic,
              value: 0,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              inactiveIcon: null,
            ),
            GFRadioListTile(
              titleText: 'Arthur Shelby',
              subTitle: const Text('By order of the peaky blinders'),
              avatar: GFAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
              ),
              size: 25,
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: GFRadioType.square,
              value: 1,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value;
                });
              },
              inactiveIcon: null,
            ),
            GFAccordion(
                title: 'GF Accordion',
                content:
                    'GetFlutter is an open source library that comes with pre-build 1000+ UI components.'),
            GFProgressBar(
                percentage: 0.9,
                backgroundColor: Colors.black26,
                progressBarColor: GFColors.DANGER),
            GFButton(
              onPressed: () {},
              text: "primary",
              shape: GFButtonShape.square,
            ),
            GFCard(
              elevation: 10,
              boxFit: BoxFit.cover,
              image: Image.asset('your asset image'),
              title: GFListTile(
                avatar: GFAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                ),
                title: Text('Card Title'),
                subTitle: Text('Card Sub Title'),
              ),
              content: Text("Some quick example text to build on the card"),
              buttonBar: GFButtonBar(
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    text: 'Buy',
                    //shape: GFButtonShape.square,
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Cancel',
                    //shape: GFButtonShape.square,
                  ),
                ],
              ),
            ),
            GFListTile(
                avatar: GFAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                ),
                titleText: 'Title',
                subTitleText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing',
                icon: Icon(Icons.favorite)),
            GFToggle(
              duration: Duration(seconds: 0),
              onChanged: (val) {},
              type: GFToggleType.ios,
              value: true,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  padding: const EdgeInsets.all(15),
                  borderRadius: BorderRadius.circular(5),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor: Colors.white,
                  value: dropdown,
                  onChanged: (newValue) {
                    setState(() {
                      dropdown = newValue.toString();
                    });
                  },
                  items: ['UI', 'Devops', 'API', 'Apps']
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _sampletextcontroller,
                  validator: (val) =>
                      val!.isEmpty ? 'Invalid email address' : null,
                  decoration: kinputDecoration('Email')),
            ),
            GFLoader(type: GFLoaderType.android),
            GFProgressBar(
              percentage: 0.8,
              lineHeight: 20,
              alignment: MainAxisAlignment.spaceBetween,
              child: const Text(
                '80%',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              leading:
                  Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
              trailing:
                  Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
              backgroundColor: Colors.black26,
              progressBarColor: GFColors.INFO,
            ),
            GFCard(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFCheckbox(
                    size: GFSize.SMALL,
                    activeBgColor: GFColors.DANGER,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                  GFCheckbox(
                    activeBgColor: GFColors.SECONDARY,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                  GFCheckbox(
                    size: GFSize.LARGE,
                    activeBgColor: GFColors.SUCCESS,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    value: isChecked,
                    inactiveIcon: null,
                  ),
                ],
              ),
            ),
            GFButton(
              onPressed: () {},
              text: "primary",
              icon: Icon(
                Icons.exit_to_app,
                color: GFColors.WHITE,
              ),
            ),
            GFRating(
              value: _userRating,
              showTextForm: true,
              controller: _ratingController,
              suffixIcon: GFButton(
                type: GFButtonType.transparent,
                onPressed: () {
                  setState(() {
                    _userRating = double.parse(_ratingController.text);
                  });
                },
                child: const Text('Rate'),
              ), onChanged: (double rating) {  },
            ),
            GFItemsCarousel(
              rowCount: 3,
              children: imageList.map(
                    (url) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child:
                      Image.network(url, fit: BoxFit.cover, width: 1000.0),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
