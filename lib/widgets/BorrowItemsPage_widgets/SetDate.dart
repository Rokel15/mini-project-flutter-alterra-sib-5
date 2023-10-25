import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';

class SetDate extends StatefulWidget {
  DateTime dateTime;
  String tglPinjam;
  Function() pilihTgl;

  SetDate({
    Key? key,
    required this.tglPinjam,
    required this.dateTime,
    required this.pilihTgl,
  }) : super(key: key);

  @override
  State<SetDate> createState() => _SetDateState();
}

class _SetDateState extends State<SetDate> {
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: double.infinity,
      child: Row(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(width: MediaQuery.of(context).size.width/2.3,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('atur tanggal', style: GoogleFonts.roboto(textStyle: s14w600),),
                Container(
                  // child: widget.tglPinjam!=
                  child: widget.tglPinjam!='null'?
                  Text(widget.tglPinjam, style: GoogleFonts.roboto(textStyle: s16w600) ):
                  Text('date not set yet', style: GoogleFonts.roboto(textStyle: warning_s16w600),)
                  ,),
                // Text(widget.tglPinjam, style: GoogleFonts.roboto(textStyle: s16w600),)
              ],
            ),
          ), 
          InkWell(
            child: Icon(Icons.calendar_today_outlined),
            onTap: (){widget.pilihTgl();},
          ),
        ],
      ),
    );
  }
}
