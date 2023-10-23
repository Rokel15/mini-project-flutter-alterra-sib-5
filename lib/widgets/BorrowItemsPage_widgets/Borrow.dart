import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';

class Borrow extends StatefulWidget {
  String namaBarang;
  List<String> barangList;
  Borrow({Key? key, required this.namaBarang, required this.barangList}) : super(key: key);

  @override
  State<Borrow> createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {
  bool? selected = false;

  void addItem(bool? value){
    setState(() {
      this.selected = value;
    });
    if(value==true){
      widget.barangList.add(widget.namaBarang);
    } else if(value==false){
      widget.barangList.remove(widget.namaBarang);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Text(widget.namaBarang, style: GoogleFonts.roboto(textStyle: s16w600)),
          Checkbox(
            value: this.selected,
            activeColor: Color(0xff293462), side: BorderSide(color: Color(0xff293462), width: 2,),
            shape: CircleBorder(),
            onChanged: (bool? value){addItem(value);},
          )
        ],
      ),
    );
  }
}
