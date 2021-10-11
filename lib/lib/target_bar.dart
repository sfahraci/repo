/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool? animate;

  StackedBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: new charts.BarChart(
          seriesList,
          animate: animate,
          barGroupingType: charts.BarGroupingType.stacked,
          vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(

      ),
          // Hide domain axis.

          domainAxis: new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
          primaryMeasureAxis: new charts.NumericAxisSpec(
              tickProviderSpec:
                  new charts.BasicNumericTickProviderSpec(desiredTickCount: 2)),
          //------> 0-100 arasında kaç sayı olacağının ayarlandığı kısım
          customSeriesRenderers: [
            new charts.BarTargetLineRendererConfig<String>(
                strokeWidthPx: 5.0,
                customRendererId: 'customTargetLine',
                groupingType: charts.BarGroupingType.stacked)
            //------> Grafik üzerindeki çizgilerin kalınlığının ayarladığı kısım
          ],

        ),
      ),
    ]);
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [];

    final tableSalesData = [];

    final mobileSalesData = [];

    return [];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
