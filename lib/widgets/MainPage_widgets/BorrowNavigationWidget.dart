import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/FontStyle.dart';

class BorrowNavigationWidget extends StatefulWidget {
  const BorrowNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BorrowNavigationWidget> createState() => _BorrowNavigationWidgetState();
}

class _BorrowNavigationWidgetState extends State<BorrowNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.purple[800],
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.edit, size: 30, color: Colors.white),
          SizedBox(height: 10,),
          Row(
            children:[
              Text('Pinjam Barang', style: GoogleFonts.roboto(textStyle: white_s18w600),),
              SizedBox(width: 8,),
              Icon(Icons.arrow_circle_right, size: 25, color: Colors.white,)
            ],
          ),
        ],
      ),
    );
  }
}