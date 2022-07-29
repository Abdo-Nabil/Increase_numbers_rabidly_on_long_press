import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rapidly increasing number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeightSelect(),
    );
  }
}

class WeightSelect extends StatefulWidget {
  @override
  _WeightSelectState createState() => _WeightSelectState();
}

class _WeightSelectState extends State<WeightSelect> {
  Timer _timer = Timer(Duration(seconds: 0), () {});
  var _weight = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapidly increasing number'),
        brightness: Brightness.dark,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "weight".toUpperCase(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "$_weight",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        width: 60,
                        height: 60,
                        child: Center(
                          child: Container(
                            color: Colors.white,
                            width: 20,
                            height: 5.0,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (_weight > 0) _weight--;
                        });
                      },
                      onTapDown: (TapDownDetails details) {
                        print('down');
                        _timer =
                            Timer.periodic(Duration(milliseconds: 100), (t) {
                          setState(() {
                            if (_weight > 0) _weight--;
                          });
                          print('value $_weight');
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        print('up');
                        _timer.cancel();
                      },
                      onTapCancel: () {
                        print('cancel');
                        _timer.cancel();
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        width: 60,
                        height: 60,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _weight++;
                        });
                      },
                      onTapDown: (TapDownDetails details) {
                        print('down');
                        _timer =
                            Timer.periodic(Duration(milliseconds: 100), (t) {
                          setState(() {
                            _weight++;
                          });
                          print('value $_weight');
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        print('up');
                        _timer.cancel();
                      },
                      onTapCancel: () {
                        print('cancel');
                        _timer.cancel();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
