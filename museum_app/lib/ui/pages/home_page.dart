import 'package:flutter/material.dart';
import 'package:museum_app/core/models/museum.dart';
import 'package:museum_app/ui/custom_widgets/musuem_tile.dart';

class HomeScreen extends StatelessWidget {
  final List<Museum> museums = [
    Museum(name: 'Peshawar Museum', address: 'Jail Road Peshawar', imgUrl: ''),
    Museum(
        name: 'Abdottabad Museum', address: 'Jail Road Abbottabad', imgUrl: ''),
    Museum(name: 'Attock Museum', address: 'Jail Road Attock', imgUrl: ''),
    Museum(
        name: 'Nowshehra Museum', address: 'Jail Road Nowshehra', imgUrl: ''),
    Museum(name: 'Kamra Museum', address: 'Jail Road Kamra', imgUrl: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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

            Container(
              height: 210,
              child: ListView.builder(
                itemCount: museums.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MuseumTile(museums[index]);
                },
              ),
            ),

            /// News and Exhibition section
          ],
        ),
      )),
    );
  }
}
