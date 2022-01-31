import 'dart:convert';

import 'package:http/http.dart';

class Worker {
  late String location;
  Worker({required this.location}) {
    location = this.location;
  }
  late String temp;

  late String humidity;
  // ignore: non_constant_identifier_names
  late String air_speed;
  late String main;
  late String description;
  //late String icon;

  Future<void> getData() async {
    try {
      Response response = await get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2da9043b10771b6dffec5e523fd9d5ed"),
      );
      Map data = jsonDecode(response.body);

      //Getting temperature,humidity
      Map tempData = data['main'];
      double getTemp = tempData['temp'];
      String getHumidity = tempData['humidity'].toString();

      //getting air speed
      Map wind = data['wind'];
      String getAirSpeed = wind['speed'].toString();

      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData['description'];
      //icon = weatherMainData["icon"];

      //assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAirSpeed;
      description = getDesc;
      main = getMainDes;
    } catch (e) {
      // ignore: unused_local_variable
      late String temp = "Error";

      // ignore: unused_local_variable
      late String humidity = "Error";
      // ignore: unused_local_variable
      // ignore: non_constant_identifier_names

      late String air_speed = "Error";
      // ignore: unused_local_variable
      late String main = "Error";
      // ignore: unused_local_variable
      late String description = "Error";
    }
  }
}
