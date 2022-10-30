import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:time/worldtime.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<WorldTime> worldTimes=[];
  getData() async{
  Response response = await get(Uri.parse(
  'https://worldtimeapi.org/api/timezone'));
  List data= jsonDecode(response.body);
  data.forEach((e) {
    String x;
    x=e.toString().split('/')[1].toString();
    WorldTime w=WorldTime(x.toString(), e);
    worldTimes.add(w);
    setState(() {});
  });
}
  // List<WorldTime> worldTimes = [
    // WorldTime('Cairo', 'Africa/Cairo'),
    // WorldTime('London', 'Europe/London'),
    // WorldTime('Tokyo', 'Asia/Tokyo'),
    // WorldTime('casablanca', 'Africa/Casablanca')
  // ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: worldTimes
                .map(
                  (wt) => InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/',
                    arguments: {
                      'wt': wt
                    },
                  );
                },
                child: Container(
                  color: Colors.amber,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        wt.location,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}
