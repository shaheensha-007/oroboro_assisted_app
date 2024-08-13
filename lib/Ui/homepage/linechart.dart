import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Linechart extends StatefulWidget {
  const Linechart({super.key});

  @override
  State<Linechart> createState() => _LinechartState();
}

class _LinechartState extends State<Linechart> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    return  SizedBox(
      height:mheight*0.2,
      child: SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          series: <CartesianSeries>[
            LineSeries<ChartData, String>(
                dataSource: [
                  ChartData('Jan', 35, Colors.red),
                  ChartData('Feb', 28, Colors.green),
                  ChartData('Mar', 34, Colors.blue),
                  ChartData('Apr', 32, Colors.pink),
                  ChartData('May', 40, Colors.black)
                ],
                // Bind the color for all the data points from the data source
                pointColorMapper:(ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y
            )
          ]
      ),
    );
  }
}
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
