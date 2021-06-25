import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listdemo/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String time = 'loading';
  String loc = "Berlin",url= "Europe/Berlin";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: loc, flag: 'germany.png', url: url);
    await instance.getTime();


    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDaytime': instance.isDaytime

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(

        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setupWorldTime();
  }

}
