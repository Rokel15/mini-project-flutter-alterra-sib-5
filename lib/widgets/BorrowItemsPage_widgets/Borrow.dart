import 'package:flutter/material.dart';

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
          Text(widget.namaBarang),
          Checkbox(
            value: this.selected,
            onChanged: (bool? value){addItem(value);},
          )
        ],
      ),
    );
  }
}
