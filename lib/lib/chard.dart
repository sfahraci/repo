import 'package:binamodapp/lib/subscriber_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
        year: "100",
        subscribers: 233,
        barColor: charts.ColorUtil.fromDartColor(Colors.white))
  ];


  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series =
        [
          charts.Series(
            id: "Subscribers",
            data: data,
            domainFn: (SubscriberSeries series, _) =>
                series.year,
            measureFn: (SubscriberSeries series, _) =>
                series.subscribers,
             colorFn: (SubscriberSeries series, _) =>
                 series.barColor)
        ];

    return Container(
      height: 20,
      width: 300,
      padding: EdgeInsets.all(4),
     color: Colors.black,
    );
  }
}
                     //------>Tehlike Seviyesini Gösteren Box */