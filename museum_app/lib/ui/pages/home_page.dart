import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:museum_app/core/models/museum.dart';
import 'package:museum_app/ui/custom_widgets/musuem_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firestoreRef = FirebaseFirestore.instance;
  bool gotData = false;

  final List<Museum> museums = [];

  getData() async {
    try {
      print('@getData');
      final QuerySnapshot snapshot =
          await firestoreRef.collection('museums').get();
      print('Length of docs: ${snapshot.docs.length}');
      for (final doc in snapshot.docs) {
        final json = doc.data();
        museums.add(Museum(
            name: json['name'],
            address: json['address'],
            imgUrl: json['imgUrl']));
      }
      gotData = true;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
          child: Column(
            children: [
              ///
              /// First section
              ///
              Row(
                children: [
                  Icon(Icons.pin_drop),
                  Text('Top Text'),
                  Icon(Icons.keyboard_arrow_down),
                  Spacer(),
                  Icon(Icons.map)
                ],
              ),

              ///
              /// Search Field
              ///
              Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Museums',
                          ),
                        ),
                      ),
                    ],
                  )),

              /// Top visited listview section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Visited'),
                  Text('View all'),
                ],
              ),

              gotData
                  ? Container(
                      height: 210,
                      child: ListView.builder(
                        itemCount: museums.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MuseumTile(museums[index]);
                        },
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),

              SizedBox(height: 30),

              RaisedButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )

              /// News and Exhibition section
            ],
          ),
        ),
      )),
    );
  }
}
