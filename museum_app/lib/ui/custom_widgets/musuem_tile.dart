import 'package:flutter/material.dart';
import 'package:museum_app/core/models/museum.dart';

class MuseumTile extends StatelessWidget {
  final Museum museum;

  MuseumTile(this.museum);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 210,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///Image
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(museum.name)),
              Icon(Icons.pin_drop)
            ],
          ),

          Row(
            children: [
              Icon(Icons.pin_drop),
              SizedBox(
                width: 10,
              ),
              Flexible(child: Text(museum.address)),
            ],
          )
        ],
      ),
    );
  }
}
