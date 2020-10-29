import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_maps/models/place.dart';
import 'package:firebase_maps/utils/firestoreHelper.dart';
import 'package:firebase_maps/widgets/placeDialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: MainMaps(),
    );
  }
}

class MainMaps extends StatefulWidget {
  @override
  _MainMapsState createState() => _MainMapsState();
}

class _MainMapsState extends State<MainMaps> {
  FirestoreHelper _firestore = FirestoreHelper();
  List<Marker> markers = [];
  List<Place> places = [];
  CameraPosition position =
      CameraPosition(target: LatLng(-16.3540115, -71.554834), zoom: 12);

  Future _getCurrentLocation() async {
    bool isGeolocationAvailable = await Geolocator.isLocationServiceEnabled();
    Position _position = Position(
        latitude: this.position.target.latitude,
        longitude: this.position.target.longitude);

    if (isGeolocationAvailable) {
      _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    }
    return _position;
  }

  Future _getData() async {
    places = await _firestore.getPlaces();
    int idMarker = 0;

    print("Got ${places.length} places");
    for (Place p in places) {
      // markers = [];
      print("Place " +
          Position(latitude: p.lat, longitude: p.lon).toString() +
          ' ' +
          idMarker.toString());

      addMarker(Position(latitude: p.lat, longitude: p.lon),
          idMarker.toString(), p.name, p);

      idMarker++;
    }
    setState(() {
      markers = markers;
    });
  }

  void addMarker(
      Position pos, String markerId, String markerTitle, Place place) {
    position =
        CameraPosition(target: LatLng(pos.latitude, pos.latitude), zoom: 12);

    Marker marker = Marker(
      markerId: MarkerId(markerId),
      position: LatLng(pos.latitude, pos.longitude),
      infoWindow: InfoWindow(title: markerTitle),
      onTap: () async {
        PlaceDialog pd = PlaceDialog(place, true);
        await showDialog(
          context: context,
          builder: (context) => pd.buildAlert(context),
        );
        _getData();
      },
      // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
    );
    markers.add(marker);
    setState(() {
      position = position;
    });

    // print(markers);
  }

  @override
  void initState() {
    // _getCurrentLocation().then((value) {
    //   print(value.toString());
    //   addMarker(value, "currpos", "Usted esta aqui", Place(0, "", 0, 0, ""));
    //   setState(() {
    //     position =
    //         CameraPosition(target: LatLng(value.latitude, value.longitude));
    //   });
    // });
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(markers.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('map'),
      ),
      body: Container(
        child: GoogleMap(
          onTap: (argument) async {
            PlaceDialog pd = PlaceDialog(
                Place(0, "", argument.latitude, argument.longitude, ""), true);
            await showDialog(
              context: context,
              builder: (context) => pd.buildAlert(context),
            );
            _getData();
          },
          initialCameraPosition: position,
          markers: Set<Marker>.of(markers),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
