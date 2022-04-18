import 'dart:convert';

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
  String bibleLocation1 = '';
  String bibleLocation2 = '';
  List _scriptureList = [];

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
        title: const Text('Quick & Handy Bible Quotes'),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _localDivider(bibleLocation1, context),
            // _localDivider('Scripture', context),
            Text(
              scripture,
              style: const TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            // _localDivider(bibleLocation, context),
            // ElevatedButton(
            //   style: raisedButtonStyle,
            //   onPressed: changeText,
            //   child: const Text('Clear'),
            // ),
            _localDivider(bibleLocation2, context),
            _scriptureList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _scriptureList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text(_scriptureList[index]["page_hsv"]),
                            title: Text(_scriptureList[index]["hsv"]),
                            subtitle: Text(_scriptureList[index]["esv"]),
                            trailing: Text(_scriptureList[index]["page_esv"]),
                            onTap: () {
                              displayVerse(
                                _scriptureList[index]["hsv"],
                                _scriptureList[index]["page_hsv"],
                                _scriptureList[index]["page_esv"],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        )),
      ),
    );
  }

// Functions
  void initState() {
    super.initState();
    readJson();
  }

  void displayVerse(
      String _scripture, String _bibleLocation1, String _bibleLocation2) {
    setState(() {
      scripture = _scripture;
      bibleLocation1 = _bibleLocation1;
      bibleLocation2 = _bibleLocation2;
    });
  }

  void changeText() {
    setState(() {
      if (scripture == 'Welcome to Quick Scripture!') {
        scripture = 'Select a Scripture';
        bibleLocation1 = '';
      } else {
        scripture = 'Welcome to Quick Scripture!';
        bibleLocation1 = '';
      }
    });
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/texts/scriptures.json');
    final data = await json.decode(response);
    setState(() {
      _scriptureList = data["items"];
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
              title: const Text('Coming Soon'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Coming Soon'),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Coming Soon',
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
