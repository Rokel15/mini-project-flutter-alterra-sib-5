import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/FontStyle.dart';

class Head extends StatefulWidget {
  const Head({Key? key}) : super(key: key);

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity, margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nama Barang :', style: GoogleFonts.roboto(textStyle: s18w600)),
              Text('Jumlah Barang :', style: GoogleFonts.roboto(textStyle: s18w600))
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          width: double.infinity, height: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}