import 'package:binamodapp/binalar.dart';
import 'package:binamodapp/lib/target_bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('', 25),
    ];

    final tableSalesData = [
      new OrdinalSales('', 25),

    ];

    final mediumRiskData = [
      new OrdinalSales('', 25),
    ];

    final mobileSalesData = [
      new OrdinalSales('', 25),
    ];

    final desktopTargetLineData = [
      new OrdinalSales('', 20),
    ];

    final tableTargetLineData = [
      new OrdinalSales('', 25),
    ];



    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        /*labelAccessorFn: (OrdinalSales sales, _) =>
        '${sales.year}: \$${sales.sales.toString()}',
        insideLabelStyleAccessorFn: (OrdinalSales sales, _) {
          final color = (sales.year == '2014')
              ? charts.MaterialPalette.red.shadeDefault
              : charts.MaterialPalette.yellow.shadeDefault.darker;
          return new charts.TextStyleSpec(color: color);
        },*/
        colorFn: (OrdinalSales sales, _) => charts.ColorUtil.fromDartColor(
          Color.fromRGBO(148, 0, 0, 100),
        ),
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (OrdinalSales sales, _) => charts.ColorUtil.fromDartColor(
          Color.fromRGBO(148, 0, 0, 70),
        ),
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Medium Risk',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mediumRiskData,
        colorFn: (OrdinalSales sales, _) => charts.ColorUtil.fromDartColor(
          Color.fromRGBO(148, 0, 0, 30),
        ),
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        colorFn: (OrdinalSales sales, _) => charts.ColorUtil.fromDartColor(
          Color.fromRGBO(148, 0, 0, 1),
        ),
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop Target Line',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopTargetLineData,
      )
        // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      new charts.Series<OrdinalSales, String>(
          id: 'Tablet Target Line',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableTargetLineData,
          colorFn: (OrdinalSales sales, _) =>
              charts.ColorUtil.fromDartColor(Colors.blue))
        // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),

    ];
  }

  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;
  var distance = 20;
  var time = 10;
  var magnitude = 7.0;

  var number = 7;

  var loss = 55;

  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/icons/marker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(39.12558112178485, 32.31982837503558),
          icon: mapMarker,
          infoWindow: InfoWindow(title: "İzmir Depremi"),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId("id-2"),
          position: LatLng(39.9334, 32.8597),
          icon: mapMarker,
          infoWindow: InfoWindow(title: "Gölcük Depremi"),
        ),
      );
    });
  } //--------> Markers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(39.12558112178485, 32.31982837503558),
          zoom: 7.5,
        ),
        polylines: Set<Polyline>.of(<Polyline>[
          Polyline(
              polylineId: PolylineId('area'),
              points: getPoints(),
              width: 1,
              geodesic: false,
              visible: true),
          Polyline(
              polylineId: PolylineId('area'),
              points: _getPoints(),
              width: 1,
              geodesic: false,
              visible: true),
        ]),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
            child: SizedBox(
                width: 300, height: 40, child: buildFloatingActionButton())),
      ),
      //------> Deprem Tehlikesi Buttonu
    );
  }

  getPoints() {
    return [
      LatLng(38.196943, 31.979321),
      LatLng(38.25957, 31.893724),
      LatLng(38.350648, 31.854342),
      LatLng(38.446525, 31.84465),
      LatLng(38.546525, 31.74465),
      LatLng(38.646525, 31.64465),
      LatLng(38.746525, 31.54465),
      LatLng(38.846525, 31.44465),
    ];

  }
  _getPoints() {
    return [
      LatLng(37.196943, 32.979321),
      LatLng(37.25957, 32.893724),
      LatLng(37.350648, 32.854342),
      LatLng(37.446525, 32.84465),
      LatLng(37.546525, 32.74465),
      LatLng(37.646525, 32.64465),
      LatLng(37.746525, 32.54465),
      LatLng(37.846525, 32.44465),

    ];

  }

  Widget buildFloatingActionButton() => FloatingActionButton(
        backgroundColor: Color.fromRGBO(0, 78, 152, 1),
        child: new Text('Deprem Tehlikesi',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        onPressed: () {
          packInformationDialog();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.5)),
      );

  //------> Deprem Tehlikesi Buttonu

  void packInformationDialog() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Beklenen Deprem",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ), //------>Beklenen Deprem

                /* Stack(
                  children: [
                    Container(
                    width: 315,
                    height: 20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(255, 68, 68, 1),
                              Color.fromRGBO(148, 0, 0, 1),
                              Color.fromRGBO(74, 0, 0, 1),
                              Color.fromRGBO(0, 0, 0, 1)
                            ]),
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        )),
                        child: Icon(Icons.circle,
                        color: Colors.green ),
                      alignment: Alignment(1,0),

                  ),

            ]
                ),
                 //------>Tehlike Seviyesini Gösteren Box */

                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 24),
                    child: Container(
                      height: 40,
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 24),
                    child: Container(
                      height: 40,
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 330,
                    child: StackedBarChart(
                      _createSampleData(),
                      animate: false,
                    ),
                  ),
                ]),

                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Expanded(
                    child: Row(
                        children: [
                      Text("2020 İzmir\n  Depremi",
                      style: TextStyle(
                        fontSize: 12
                      ),),
                      SizedBox(width: 10),
                      Text("1999 Gölcük\n Depremi",
                          style: TextStyle(
                          fontSize: 12
                      ),),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: Text(
                    "Bulunduğunuz bölge en yakın fay hattına $distance km uzaklıkladır. Yani kıtaları birbirinden ayıran o büyük doğa olayının size ulaşması yalnızca $time saniye sürmektedir. Geçmişte yakın çevrenizde etkilisi $magnitude büyüklüğünde olmak üzere $number adet önemli deprem olmuş ve $loss kişi yaşamını yitirmiştir. Binanızın deprem performansı yeterli ise depremde en güvenli yeriniz evinizdir.",
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(children: [
                  Center(
                    widthFactor: 2.13,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.only(top: 7.0),
                      width: 150,
                      height: 40,
                      child: RaisedButton(
                        color: Color.fromRGBO(0, 78, 152, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Bina Riski",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BinalarPage()));
                        },
                      ),
                    ),
                  ),
                  FloatingActionButton.small(
                    backgroundColor: Color.fromRGBO(0, 78, 152, 1),
                    onPressed: () {

                    },
                    child: Icon(
                      Icons.share,
                    ),
                  ),
                ]),
              ],
            ),
          );
        });
  } //------> Deprem Tehlikesine Tıklandığında Açılan Kısım
}
