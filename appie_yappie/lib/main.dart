import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Appie Yappie',
      // home: RandomWords(),
      // home: SoundPlayer(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String msg = 'Test';

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext contect) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Scriptures'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              msg,
              style: TextStyle(
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: changeText,
              child: const Text('Text Test'),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: scripture,
              child: const Text('Hebrews 11:1'),
            )
          ],
        )),
      ),
    );
  }

  void changeText() {
    setState(() {
      if (msg == 'Test') {
        msg = 'Worked';
      } else {
        msg = 'Test';
      }
    });
  }

  void scripture() {
    setState(() {
      msg =
          "Now faith is the assurance of things hoped for, the conviction of things not seen.";
    });
  }
}
