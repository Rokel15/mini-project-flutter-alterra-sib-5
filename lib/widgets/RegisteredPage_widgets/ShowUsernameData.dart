import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/FontStyle.dart';

class ShowUsernameData extends StatelessWidget {
  String name;
  String npm;

  ShowUsernameData({required this.name, required this.npm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('your name have been registered', style: GoogleFonts.roboto(textStyle: s16w600),),
        SizedBox(height: 10),
        Text('Nama : $name', style: GoogleFonts.roboto(textStyle: s16w600)),
        SizedBox(height: 3),
        Text('Npm : $npm', style: GoogleFonts.roboto(textStyle: s16w600)),
      ],
    );
  }
}
