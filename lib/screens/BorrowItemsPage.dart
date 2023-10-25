import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/BorrowItemsPage_widgets/Borrow.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/BorrowItemsPage_widgets/BorrowButton.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/BorrowItemsPage_widgets/SetDate.dart';
import 'package:mini_project_flutter_alterra_sib_5/widgets/BorrowItemsPage_widgets/ShowUserData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
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

  DateTime dateTime = DateTime.now();
  String tglPinjam = 'null';

  @override
  void initState() {
    initial();
    super.initState();
    // tglPinjam = DateFormat.yMd().format(dateTime).toString();
  }

  Future<Null> pilihTgl(BuildContext context) async{
    DateTime? setTgl = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030));

    if(setTgl!=null && setTgl!=tglPinjam){
      setState(() {
        dateTime = setTgl;
        tglPinjam = DateFormat.yMd().format(dateTime).toString();
      });
    }
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
                  child: SetDate(
                    dateTime: dateTime,
                    tglPinjam: tglPinjam!,
                    pilihTgl: (){pilihTgl(context);},
                  ),
                ),

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
              tglPinjam: tglPinjam!,
              barangList: barangList,
          ),
        ],
      ),
    );
  }
}