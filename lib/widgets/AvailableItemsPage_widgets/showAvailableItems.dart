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
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.namaBarang, style: GoogleFonts.roboto(textStyle: s16w600)),
          Text(widget.jmlBarang, style: GoogleFonts.roboto(textStyle: s16w600)),
        ],
      ),
    );
  }
}
