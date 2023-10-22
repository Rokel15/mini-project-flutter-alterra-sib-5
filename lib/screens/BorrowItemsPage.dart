import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/data/FontStyle.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/BorrowItemsPage_widgets/ShowUserData.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/firebase_firestore.dart';

class BorrowItemsPage extends StatefulWidget {
  const BorrowItemsPage({Key? key}) : super(key: key);

  @override
  State<BorrowItemsPage> createState() => _BorrowItemsPageState();
}

class _BorrowItemsPageState extends State<BorrowItemsPage> {
  late SharedPreferences data;

  // bool? user;
  String? name;
  String? npm;

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      // user = data.getBool('regist') ?? true;
      name = data.getString('name').toString();
      npm = data.getString('npm').toString();
    });
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pinjam Barang',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: Color(0xff293462),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          ShowDataUser(
            name: name!,
            npm: npm!,
          ),
          Container(
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: borrowedItems.snapshots(),
              builder: (_, snapshot){
                if(snapshot.hasData){
                  return Text('data');
                } else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}