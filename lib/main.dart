import 'package:flutter/material.dart';
import 'package:time/loading.dart';
import 'package:time/locations.dart';
import 'package:time/worldtime.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login.dart',
    routes: {
      '/': (context) => Loading(),
      '/login.dart': (context) => LogIn(),
      '/home': (context) => MyApp(),
      '/locations.dart': (context) => Locations(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String time = '';
  Map<String, dynamic> data = {};
  Map<String, dynamic> bg = {};
  String state = 'null';
  String ntime = '';
  // LoadingState l=new LoadingState();
  setstate(String x) {
    this.state = x;
  }

  dd() {
    bg = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    WorldTime w = bg['wt'];
    print(w);
    int nntime = int.parse(w.noow);

// print(nntime);
    if (nntime >= 6 && nntime <= 18) {
      // print('day');
      state = 'assets/day.jpeg';
    } else {
      // print('nigh');
      state = 'assets/night.jpeg';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dd();
  }

  @override
  Widget build(BuildContext context) {
    dd();
    data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    WorldTime wt = data['wt'];
    // print(state);
    return Scaffold(
      appBar: AppBar(
        title: Text('World Time App'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(state),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/locations.dart');
                },
                icon: Icon(
                  Icons.location_on,
                  size: 40,
                ),
                label: Text(
                  'Change Location',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )),
            Text(
              wt.location,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              wt.time,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
