import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference readyItems = firestore.collection('Ready Items');
CollectionReference borrowedItems = firestore.collection('Borrowed Items');