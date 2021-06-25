import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;


    // set background image
    String bgImage = data['isDaytime']==true ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime']==true ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover),


          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/location'),
                    icon: Icon(Icons.location_on),
                    label: Text("Edit Location")),

                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66.0,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
