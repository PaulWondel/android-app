import 'package:flutter/services.dart' show rootBundle;
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
  String scripture = 'Welcome to Quick Scripture!';
  String bibleLocation = '';

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
      endDrawer: _scriptureDrawer(context),
      appBar: AppBar(
        title: const Text('Saved Scriptures'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _localDivider('Scripture', context),
            Text(
              scripture,
              style: TextStyle(
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            _localDivider(bibleLocation, context),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: changeText,
              child: const Text('Clear'),
            ),
          ],
        )),
      ),
    );
  }

// Functions
  void changeText() {
    setState(() {
      if (scripture == 'Welcome to Quick Scripture!') {
        scripture = 'Select a Scripture';
        bibleLocation = '';
      } else {
        scripture = 'Welcome to Quick Scripture!';
        bibleLocation = '';
      }
    });
  }

  void scriptureHebrew() {
    setState(() {
      scripture =
          "Now faith is the assurance of things hoped for, the conviction of things not seen.";
      bibleLocation = 'Hebrews 11:1 ESV';
    });
  }

  void scriptureMatt() {
    setState(() {
      scripture =
          "But seek first the kingdom of God and his righteousness, and all these things will be added to you.";
      bibleLocation = "Matthew 6:33 ESV";
    });
  }

// Widgets
  Widget _scriptureDrawer(BuildContext context) => Drawer(
        child: SafeArea(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Scriptures',
                  style: Theme.of(context).textTheme.headline6),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Hebrew 11: 1'),
              onTap: scriptureHebrew,
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Matthew 6:33'),
              onTap: scriptureMatt,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Label',
              ),
            ),
          ],
        )),
      );

  Widget _localDivider(String text, BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 8.0),
        child: Row(
          children: [
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ],
        ),
      );
}
