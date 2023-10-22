import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/FontStyle.dart';

class ShowAvailableItems extends StatefulWidget {
  String namaBarang;
  String jmlBarang;

  ShowAvailableItems({required this.namaBarang, required this.jmlBarang});

  @override
  State<ShowAvailableItems> createState() => _ShowAvailableItemsState();
}

class _ShowAvailableItemsState extends State<ShowAvailableItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(widget.namaBarang,
                  style: GoogleFonts.roboto(textStyle: s16w600)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff3C486B),
              ),
              child: Text(widget.jmlBarang,
                  style: GoogleFonts.roboto(textStyle: white_s16w600)),
            ),
          ],
        ),
        Divider()
      ]),
    );
  }
}
