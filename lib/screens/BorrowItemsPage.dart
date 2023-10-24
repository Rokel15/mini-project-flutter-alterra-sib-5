import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/BorrowItemsPage_widgets/Borrow.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/BorrowItemsPage_widgets/BorrowButton.dart';
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

  List<String> barangList = [];

  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
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
        backgroundColor: const Color(0xff293462),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          ShowDataUser(
            name: name!,
            npm: npm!,
          ),

          Container(
            width: double.infinity,
            height: 2, color: Colors.black,
          ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    width: double.infinity,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: readyItems.snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                              children: snapshot.data!.docs.map((e)
                              => Borrow(
                                namaBarang: (e.data() as dynamic)['nama barang'].toString(),
                                barangList: barangList,
                              )).toList());
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),

          BorrowButton(
              name: name!,
              npm: npm!,
              barangList: barangList,
          ),
        ],
      ),
    );
  }
}