import 'package:CertNodes/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

late ZoomPanBehavior _zoomPanBehaviorTemperature = ZoomPanBehavior(
  // Enables pinch zooming
  enablePinching: false, enablePanning: false,
);
late ZoomPanBehavior _zoomPanBehaviorLuminosity = ZoomPanBehavior(
    // Enables pinch zooming
    enablePinching: false,
    enablePanning: false);
late ZoomPanBehavior _zoomPanBehaviorPressure = ZoomPanBehavior(
    // Enables pinch zooming
    enablePinching: false,
    enablePanning: false);
late ZoomPanBehavior _zoomPanBehaviorHumidity = ZoomPanBehavior(
    // Enables pinch zooming
    enablePinching: false,
    enablePanning: false);
late TooltipBehavior _tooltipBehaviorTemperature;
late TooltipBehavior _tooltipBehaviorLuminosity;
late TooltipBehavior _tooltipBehaviorPressure;
late TooltipBehavior _tooltipBehaviorHumidity;

class ChartSampleData {
  ChartSampleData({this.x, this.yValue});
  static List<String> list = <String>[
    'LineSeries',
    'ColumnSeries',
    'SplineSeries'
  ];
  static List<dynamic> temperatureListWidget = [
    LineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartTemperature,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Temperature',
    ),
    ColumnSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartTemperature,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Temperature',
    ),
    SplineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartTemperature,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Temperature',
    )
  ];
  static List<dynamic> humidityListWidget = [
    LineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartHumidity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Humidity',
    ),
    ColumnSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartHumidity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Humidity',
    ),
    SplineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartHumidity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Humidity',
    )
  ];
  static List<dynamic> pressureListWidget = [
    LineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartPressure,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Pressure',
    ),
    ColumnSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartPressure,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Pressure',
    ),
    SplineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartPressure,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Pressure',
    )
  ];
  static List<dynamic> luminosityListWidget = [
    LineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartLuminosity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Luminosity',
    ),
    ColumnSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartLuminosity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Luminosity',
    ),
    SplineSeries<ChartSampleData, String>(
      // markerSettings: MarkerSettings(
      //   isVisible: true,
      //   width: 3,
      //   height: 3,
      // ),
      dataSource: Display.chartLuminosity,
      xValueMapper: (ChartSampleData sales, _) => sales.x,
      yValueMapper: (ChartSampleData sales, _) => sales.yValue,
      name: 'Luminosity',
    )
  ];

  final String? x;
  final double? yValue;
}

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Display(),
    );
  }
}

class Display extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Display({Key? key}) : super(key: key);
  static List<ChartSampleData> chartTemperature = <ChartSampleData>[];
  static List<ChartSampleData> chartHumidity = <ChartSampleData>[];
  static List<ChartSampleData> chartPressure = <ChartSampleData>[];
  static List<ChartSampleData> chartLuminosity = <ChartSampleData>[];

  @override
  DisplayState createState() => DisplayState();
}

class DisplayState extends State<Display> {
  String dropdownValue = ChartSampleData.list.first;

  var zoomToggle = false;
  handleData() {
    Display.chartTemperature = <ChartSampleData>[];
    Display.chartHumidity = <ChartSampleData>[];
    Display.chartPressure = <ChartSampleData>[];
    Display.chartLuminosity = <ChartSampleData>[];
    for (int i = 0; i < 150; i++) {
      Display.chartTemperature.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalTemperature[0][i])
            .toString()
            .substring(5, 19)
            .splitMapJoin("-", onMatch: ((p0) => "/"))
            .splitMapJoin(" ", onMatch: ((p0) => "\n")),
        yValue: double.parse(WelcomePage.finalTemperature[1]
                [WelcomePage.finalTemperature[0][i]]
            .toString()),
      ));
    }
    for (int i = 0; i < 150; i++) {
      Display.chartHumidity.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalHumidity[0][i])
            .toString()
            .substring(5, 19)
            .splitMapJoin("-", onMatch: ((p0) => "/"))
            .splitMapJoin(" ", onMatch: ((p0) => "\n")),
        yValue: double.parse(WelcomePage.finalHumidity[1]
                [WelcomePage.finalHumidity[0][i]]
            .toString()),
      ));
    }

    for (int i = 0; i < 150; i++) {
      Display.chartLuminosity.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalLuminosity[0][i])
            .toString()
            .substring(5, 19)
            .splitMapJoin("-", onMatch: ((p0) => "/"))
            .splitMapJoin(" ", onMatch: ((p0) => "\n")),
        yValue: double.parse(WelcomePage.finalLuminosity[1]
                [WelcomePage.finalLuminosity[0][i]]
            .toString()),
      ));
    }
    for (int i = 0; i < 150; i++) {
      Display.chartPressure.add(ChartSampleData(
        x: DateTime.parse(WelcomePage.finalPressure[0][i])
            .toString()
            .substring(5, 19)
            .splitMapJoin("-", onMatch: ((p0) => "/"))
            .splitMapJoin(" ", onMatch: ((p0) => "\n")),
        yValue: double.parse(WelcomePage.finalPressure[1]
                [WelcomePage.finalPressure[0][i]]
            .toString()),
      ));
    }
  }

  @override
  void initState() {
    _tooltipBehaviorTemperature = TooltipBehavior(enable: true);
    _tooltipBehaviorLuminosity = TooltipBehavior(enable: true);
    _tooltipBehaviorPressure = TooltipBehavior(enable: true);
    _tooltipBehaviorHumidity = TooltipBehavior(enable: true);
    handleData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff7892b),
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Text(
                  'Charts',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              Text("Zoom Toggle", style: TextStyle(fontSize: 14)),
              Switch(
                // thumb color (round icon)
                activeColor: Color.fromARGB(255, 74, 70, 70),
                activeTrackColor: Color.fromARGB(255, 255, 255, 255),
                inactiveThumbColor: Color.fromARGB(255, 74, 70, 70),
                inactiveTrackColor: Color.fromARGB(255, 255, 255, 255),
                splashRadius: 50.0,
                // boolean variable value
                value: zoomToggle,
                // changes the state of the switch
                onChanged: (value) => setState(() {
                  zoomToggle = value;
                  _zoomPanBehaviorTemperature = ZoomPanBehavior(
                      // Enables pinch zooming
                      enablePinching: zoomToggle,
                      enablePanning: zoomToggle);
                  _zoomPanBehaviorLuminosity = ZoomPanBehavior(
                      // Enables pinch zooming
                      enablePinching: zoomToggle,
                      enablePanning: zoomToggle);
                  _zoomPanBehaviorPressure = ZoomPanBehavior(
                      // Enables pinch zooming
                      enablePinching: zoomToggle,
                      enablePanning: zoomToggle);
                  _zoomPanBehaviorHumidity = ZoomPanBehavior(
                      // Enables pinch zooming
                      enablePinching: zoomToggle,
                      enablePanning: zoomToggle);
                }),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: SingleChildScrollView(
            //Initialize the chart widget
            child: Column(
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 12,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  underline: Container(
                    height: 2,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: ChartSampleData.list
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        backgroundColor: Colors.white,
                        tooltipBehavior: _tooltipBehaviorTemperature,
                        zoomPanBehavior: _zoomPanBehaviorTemperature,

                        //Specifying date time interval type as hours
                        primaryXAxis: CategoryAxis(
                            title: AxisTitle(text: 'Temperature'),
                            isInversed: true),
                        series: <ChartSeries<ChartSampleData, String>>[
                          ChartSampleData.temperatureListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)],
                        ])),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehaviorHumidity,
                        zoomPanBehavior: _zoomPanBehaviorHumidity,
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis:
                            CategoryAxis(title: AxisTitle(text: 'Humidity')),
                        series: <ChartSeries<ChartSampleData, String>>[
                          ChartSampleData.humidityListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)]
                        ])),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehaviorPressure,
                        zoomPanBehavior: _zoomPanBehaviorPressure,
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis:
                            CategoryAxis(title: AxisTitle(text: 'Pressure')),
                        series: <ChartSeries<ChartSampleData, String>>[
                          ChartSampleData.pressureListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)]
                        ])),
                Container(
                    height: 500,
                    width: 400,
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehaviorLuminosity,
                        zoomPanBehavior: _zoomPanBehaviorLuminosity,
                        backgroundColor: Colors.white,
                        //Specifying date time interval type as hours
                        primaryXAxis:
                            CategoryAxis(title: AxisTitle(text: 'Luminosity')),
                        series: <ChartSeries<ChartSampleData, String>>[
                          ChartSampleData.luminosityListWidget[
                              ChartSampleData.list.indexOf(dropdownValue)]
                        ])),
              ],
            ),
          ),
        ));
  }
}
