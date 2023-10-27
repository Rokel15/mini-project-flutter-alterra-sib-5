import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/FontStyle.dart';
import '../../data/firebase_firestore.dart';

class MyNote extends StatefulWidget {
  const MyNote({Key? key,}) : super(key: key);

  @override
  State<MyNote> createState() => _MyNoteState();
}

class _MyNoteState extends State<MyNote> {
  late SharedPreferences data;

  // bool? user;
  String? name;
  String? npm;

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15), width: double.infinity,
      child: Column(crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.list_alt, size: 30,),
                  const SizedBox(width: 5,),
                  Text('Daftar Barang yang anda pinjam', style: GoogleFonts.roboto(textStyle: s18w600),),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15), width: double.infinity, height: 2.5,
                color: Colors.black,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: borrowedItems.where('npm', isEqualTo: npm).snapshots(),
                  builder: (_, snapshot){
                    if(snapshot.hasData){
                      return Column(
                        children: snapshot.data!.docs.map((e)
                        => showData(
                          tanggal: (e.data() as dynamic)['tanggal pinjam'].toString(),
                          name: (e.data() as dynamic)['nama'].toString(),
                          npm: (e.data() as dynamic)['npm'].toString(),
                          namaBarang: (e.data() as dynamic)['barang dipinjam'],
                          delete: (){borrowedItems.doc(e.id).delete();}
                        )).toList(),
                      );
                    } else{
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showData({
    required String tanggal,
    required String name,
    required String npm,
    required List namaBarang,
    required Function() delete,
  }){
    return Container(padding: const EdgeInsets.all(10), margin: const EdgeInsets.only(bottom: 15), width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff6F61C0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('tanggal : $tanggal', style: GoogleFonts.roboto(textStyle: white_s16w600),),
              SizedBox(width: 5,),
              GestureDetector(child: Icon(Icons.delete_forever, color: Colors.white,), onTap: (){delete();},)
            ],
          ),
          Container(margin: EdgeInsets.symmetric(vertical: 3), height: 1.5, color: Colors.white,),
          Text('nama : $name', style: GoogleFonts.roboto(textStyle: white_s16w600),),
          Text('npm : $npm', style: GoogleFonts.roboto(textStyle: white_s16w600),),
          Text('barang dipinjam : ', style: GoogleFonts.roboto(textStyle: white_s16w600),),
          ListView.builder(
            itemCount: namaBarang.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Text(
                '- ${namaBarang[index]}',
                style: GoogleFonts.roboto(textStyle: white_s16w600),);
            },
          ),
        ],
      ),
    );
  }
}
