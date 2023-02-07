import 'package:CertNodes/src/service/meteo_service.dart';
import 'package:flutter/material.dart';
import 'package:CertNodes/src/signup.dart';

import 'package:google_fonts/google_fonts.dart';

import 'loginPage.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, this.title}) : super(key: key);
  static List finalLuminosity = [];
  static List finalTemperature = [];
  static List finalPressure = [];
  static List finalHumidity = [];
  static dataFetch() async {
    Map<String, num?>? humidity = await MeteoService().getHumidity();

    Map<String, num?>? luminosity = await MeteoService().getLuminosity();
    // var precipitations = await MeteoService().getPrecipitations();
    Map<String, num?>? pressure = await MeteoService().getPressure();
    Map<String, num?>? temperature = await MeteoService().getTemperature();

    List<String> humidity1 = humidity!.keys.toList();
    List<String> luminosity1 = luminosity!.keys.toList();
    List<String> pressure1 = pressure!.keys.toList();
    List<String> temperature1 = temperature!.keys.toList();
    //humidty
    ////
    humidity1.sort((a, b) {
      //sorting in ascending order
      return DateTime.parse(a).compareTo(DateTime.parse(b));
    });
    List<String> SortedHumidityList = List.from(humidity1.reversed);

    //luminosity
    ////
    luminosity1.sort((a, b) {
      //sorting in ascending order
      return DateTime.parse(a).compareTo(DateTime.parse(b));
    });
    List<String> SortedLuminosityList = List.from(luminosity1.reversed);

    //pressure
    ////
    pressure1.sort((a, b) {
      //sorting in ascending order
      return DateTime.parse(a).compareTo(DateTime.parse(b));
    });
    List<String> SortedPressureList = List.from(pressure1.reversed);

    //temperature
    ////
    temperature1.sort((a, b) {
      //sorting in ascending order
      return DateTime.parse(a).compareTo(DateTime.parse(b));
    });
    List<String> SortedTemperatureList = List.from(temperature1.reversed);

    //print
    print("kamalt");
    WelcomePage.finalLuminosity = [SortedLuminosityList, luminosity];
    WelcomePage.finalHumidity = [SortedHumidityList, humidity];
    WelcomePage.finalPressure = [SortedPressureList, pressure];
    WelcomePage.finalTemperature = [SortedTemperatureList, temperature];
  }

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // Initialize the map controller and update the current position

    WelcomePage.dataFetch();

    super.initState();
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return Container(
      child: Image(image: AssetImage('images/logo.png')),
      width: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _submitButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
              _label()
            ],
          ),
        ),
      ),
    );
  }
}
