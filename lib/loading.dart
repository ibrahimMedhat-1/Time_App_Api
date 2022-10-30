import 'package:flutter/material.dart';
import 'package:time/main.dart';
import 'package:time/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  String time = '';
  // MyAppState m=new MyAppState();
  setupWorldTime({WorldTime? wt = null}) async {
    if(wt == null ){
      wt = WorldTime('Cairo', 'Africa/Cairo');
    }
    await wt!.getTime();
    time = wt!.time;



    // print(ntime);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'wt': wt,
      // 'wtf':wt.getTime().toString(),
    });
  }

  @override
  void initState() {
    super.initState();
    //setupWorldTime();
  }

  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    WorldTime wt = data['wt'];
    setupWorldTime(wt: wt);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
