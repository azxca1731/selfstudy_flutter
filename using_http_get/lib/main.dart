import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  home: new  MyGetHttpData(),
));

class MyGetHttpData extends StatefulWidget {
  MyGetHttpDataState createState() => new MyGetHttpDataState();
}

class MyGetHttpDataState extends State<MyGetHttpData> {
  final String url = "https://swapi.co/api/people";
  List data;

  Future<String> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull(url),
        // Only accept JSON response
        headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['results'];
    });

    return "Successfull";
  }

  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Retrieve JSON Data via HTTP GET'),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    child: new Container(
                      child: new Text(
                        data[index]['name'],
                        style: new TextStyle(
                          fontSize: 20,
                          color: Colors.lightBlueAccent
                        ),
                      ),
                      padding: const EdgeInsets.all(15.0)
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }

  void initState() {
    super.initState();

    this.getJSONData();
  }
}