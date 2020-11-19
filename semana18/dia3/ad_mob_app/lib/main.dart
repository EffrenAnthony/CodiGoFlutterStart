import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MobileAdTargetingInfo adTargetingInfo = MobileAdTargetingInfo(
      keywords: ['flutter', 'apps', 'learning', 'entrepreneurship']);

  BannerAd bannerAd =
      BannerAd(adUnitId: BannerAd.testAdUnitId, size: AdSize.smartBanner);

  InterstitialAd interstitialAd =
      InterstitialAd(adUnitId: InterstitialAd.testAdUnitId);

  int _counter = 0;

  Future _initAdMob() {
    return FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-5243906643547783~1877598424");
  }

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    _initAdMob();
    // bannerAd
    //   ..load()
    //   ..show(anchorType: AnchorType.bottom);
    // interstitialAd
    //   ..load()
    //   ..show(anchorType: AnchorType.bottom);

    RewardedVideoAd.instance.load(
        adUnitId: 'ca-app-pub-5243906643547783~1877598424',
        targetingInfo: adTargetingInfo);
    RewardedVideoAd.instance.show();
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {rewardType, rewardAmount}) {
      print(event);
    };
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
