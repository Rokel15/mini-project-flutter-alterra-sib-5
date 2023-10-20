import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/firebase_firestore.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/AvailableItemsPage_widgets/showAvailableItems.dart';

class AvailableItemsPage extends StatefulWidget {
  const AvailableItemsPage({Key? key}) : super(key: key);

  @override
  State<AvailableItemsPage> createState() => _AvailableItemsPageState();
}

class _AvailableItemsPageState extends State<AvailableItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang Tersedia', style: GoogleFonts.roboto(color: Colors.white),),
        backgroundColor: Color(0xff293462),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Material(color: Color(0xff3C486B),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
            color: Colors.white,
          ),
          child: ListView(
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

              Container(
                width: double.infinity,
                child: StreamBuilder<QuerySnapshot>(
                  stream: readyItems.snapshots(),
                  builder: (_, snapshot){
                    if(snapshot.hasData){
                      return Column(
                        children: snapshot.data!.docs.map((e)
                        => ShowAvailableItems(
                          namaBarang: (e.data() as dynamic)['nama barang'].toString(),
                          jmlBarang: (e.data() as dynamic)['jumlah barang'].toString(),
                        )).toList(),
                      );
                    } else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
