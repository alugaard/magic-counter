import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _homePage createState() => _homePage();
}

class _homePage extends State<MyHomePage> {
  int redCounter = 0;
  int blueCounter = 0;

  void _decrementCounterRed() {
    setState(() {
      redCounter--;
    });
  }

  void _incrementCounterRed() {
    setState(() {
      redCounter++;
    });
  }

  void _decrementCounterBlue() {
    setState(() {
      blueCounter--;
    });
  }

  void _incrementCounterBlue() {
    setState(() {
      blueCounter++;
    });
  }

  void _resetCounters() {
    setState(() {
      blueCounter=20;
      redCounter=20;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: GestureDetector(onTap: _decrementCounterRed, child: redCounterContainer(redCounter: redCounter))),
                Expanded(child: GestureDetector(onTap: _decrementCounterBlue, child: blueCounterContainer(blueCounter: blueCounter))),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                    height: 80,
                    width: 80,
                  child: FloatingActionButton(
                    onPressed: _incrementCounterRed,
                    tooltip: 'Increment',
                    backgroundColor: Color(0x44000000),
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(Icons.plus_one, size: 60, color: Colors.white ),
                  )
                  )
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: 80,
                    width: 80,
                    child: FloatingActionButton(
                    onPressed: _incrementCounterBlue,
                    tooltip: 'Increment',
                    child: Icon(Icons.plus_one, size: 60, color: Colors.white),
                    backgroundColor: Color(0x44000000)
                  )
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 80,
                  width: 80,
                  child: FloatingActionButton(
                    onPressed: _resetCounters,
                    tooltip: 'Increment',
                    child: Icon(Icons.autorenew, size: 60),
                    backgroundColor: Color(0x66000000),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class redCounterContainer extends StatelessWidget {

  final int redCounter;
  redCounterContainer({Key key, this.redCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.red,
            height: 100,
            width: 50,
            child: RotatedBox(
              quarterTurns: 2,
              child: Center(
                  child: Text(
                      redCounter.toString(),
                      style: const TextStyle(
                        fontSize: 100.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600,
                      )
                  )
              )
            )
        );

  }
}

class blueCounterContainer extends StatelessWidget {

  final int blueCounter;
  blueCounterContainer({Key key, this.blueCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.blue,
            height: 100,
            width: 50,
            child: Center(
                child: Text(
                    blueCounter.toString(),
                    style: const TextStyle(
                        fontSize: 100.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w600
                    )
                )
            )
        );
  }
}

