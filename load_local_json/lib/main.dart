import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Load local JSON file"),
        ),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('data_repo/starwars_data.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var jsonData = json.decode(snapshot.data.toString());

                  return new ListView.builder(
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name: " + jsonData[index]['name']),
                            new Text("Height: " + jsonData[index]['height']),
                            new Text("Mass: " + jsonData[index]['mass']),
                            new Text(
                                "Hair Color: " + jsonData[index]['hair_color']),
                            new Text(
                                "Skin Color: " + jsonData[index]['skin_color']),
                            new Text(
                                "Eye Color: " + jsonData[index]['eye_color']),
                            new Text(
                                "Birth Year: " + jsonData[index]['birth_year']),
                            new Text("Gender: " + jsonData[index]['gender'])
                          ],
                        ),
                      );
                    },
                    itemCount: jsonData == null ? 0 : jsonData.length,
                  );
                }),
          ),
        ));
  }
}
