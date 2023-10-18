import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';

class AvailableItems extends StatefulWidget {
  const AvailableItems({Key? key}) : super(key: key);

  @override
  State<AvailableItems> createState() => _AvailableItemsState();
}

class _AvailableItemsState extends State<AvailableItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xff3F497F),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.business, size: 30, color: Colors.white),
          SizedBox(height: 10,),
          Row(
            children:[
              Text('Barang Tersedia', style: GoogleFonts.roboto(textStyle: white_s18w600),),
              SizedBox(width: 8,),
              Icon(Icons.arrow_circle_right, size: 25, color: Colors.white,)
            ],
          ),
        ],
      ),
    );
  }
}
