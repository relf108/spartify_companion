import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spartify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Spartify'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> addTrack(String track, String ip) async {
    if (track != '' && ip != '') {
      await http.post(Uri.parse('http://$ip:8888/addTrack?track=$track'));
    }
  }

  @override
  Widget build(BuildContext context) {
    var ip = '';
    var track = '';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 500,
                  child: TextField(
                      onChanged: (_ip) {
                        ip = _ip;
                      },
                      decoration: InputDecoration(labelText: 'Enter Host IP')),
                ),
              ],
            ),
            
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 500,
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                      onChanged: (_track) {
                        track = _track;
                      },
                      style: TextStyle(height: 1),
                      decoration:
                          InputDecoration(labelText: 'Enter track link')),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTrack(track, ip);
        },
        tooltip: 'Add Track',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
