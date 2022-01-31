import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Map? info = ModalRoute.of(context)!.settings.arguments as Map?;
    var city_name = ["Lahore", "Karachi", "Islamabad", "Multan", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map? info = ModalRoute.of(context)!.settings.arguments as Map?;
    String temp = (info!['temp_value']);
    // ignore: unused_local_variable
    String hum = info["hum_value"];
    String air = info['air_speed_value'];
    String des = info['des_value'];
    //String icon = info['icon_value'];
    //print(icon);
    //String getcity = info['city_value'];
    //print(getcity);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.blueAccent])),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.black12,
              ),
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      child: Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Any City Name"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(26),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.network(""),
                        Column(
                          children: [
                            Text(
                              "$des",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    padding: EdgeInsets.all(26),
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/thermometer.png",
                            height: 70, width: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$temp",
                              style: TextStyle(fontSize: 60),
                            ),
                            Text(
                              "F",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(26),
                    margin: EdgeInsets.fromLTRB(25, 0, 10, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black12),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/wind.png",
                                height: 50,
                                width: 40,
                              )
                            ]),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          "$air",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("km/hr")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(26),
                    margin: EdgeInsets.fromLTRB(10, 0, 25, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black12),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/humidity.png",
                                height: 50,
                                width: 40,
                              )
                            ]),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          "$hum",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("Percent")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
