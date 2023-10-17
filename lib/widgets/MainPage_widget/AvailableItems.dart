import 'package:flutter/material.dart';

class AvailableItems extends StatefulWidget {
  const AvailableItems({Key? key}) : super(key: key);

  @override
  State<AvailableItems> createState() => _AvailableItemsState();
}

class _AvailableItemsState extends State<AvailableItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff917FB3),borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black, width: 2)
      ),
      child: Row(
        children: [
          Icon(Icons.business, size: 50,)
        ],
      ),
    );  }
}
