

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:time/main.dart';

class WorldTime{
  String location;
  String time = '';
  String url;
  String noow='null';
 // MyAppState m=new MyAppState();

  WorldTime(this.location, this.url);

  getTime() async {
    try{
      Response response = await get(Uri.parse(
          'https://worldtimeapi.org/api/timezone/${url}'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);



      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      noow=now.toString().split(':')[0];
      noow=noow.toString().split(' ')[1].toString();
      print(int.parse(noow));
      time = DateFormat.jms().format(now);
      // print(time);
    } catch (e){
      // print('Caut exeption ${e}');
      time = "Can't load time";
    }

  }
}