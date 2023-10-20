import 'package:flutter/material.dart';

class AvailableItemsPage extends StatefulWidget {
  const AvailableItemsPage({Key? key}) : super(key: key);

  @override
  State<AvailableItemsPage> createState() => _AvailableItemsPageState();
}

class _AvailableItemsPageState extends State<AvailableItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [],
      ),
    );
  }
}
