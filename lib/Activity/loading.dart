import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "multan";
  late String temp;
  late String hum;
  // ignore: non_constant_identifier_names
  late String air_speed;
  late String des;
  late String main;

  void startapp() async {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    // icon = instance.icon;

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value": temp,
      "hum_value": hum,
      "air_speed_value": air_speed,
      "des_value": des,
      "main_value": main,
      // "city_value":city,
      //  "icon_value": icon,
    });
  }

  @override
  void initState() {
    startapp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/23.png",
              height: 280,
              width: 280,
            ),
            Text(
              "Weather Forecast ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
