import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';

class AvailableItemsNavigationWidget extends StatefulWidget {
  String label;
  Color color;
  Function() onTap;

  AvailableItemsNavigationWidget({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<AvailableItemsNavigationWidget> createState() => _AvailableItemsNavigationWidgetState();
}

class _AvailableItemsNavigationWidgetState extends State<AvailableItemsNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.business, size: 30, color: Colors.white),
          SizedBox(height: 10,),
          GestureDetector(
            child: Row(
              children:[
                Text(widget.label, style: GoogleFonts.roboto(textStyle: white_s18w600),),
                SizedBox(width: 8,),
                Icon(Icons.arrow_circle_right, size: 25, color: Colors.white,)
              ],
            ),
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
