import 'package:cakra_asset_management/src/pages/permintaan_page/store.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/material.dart';

class PermintaanPage extends StatelessWidget {
  const PermintaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Permintaan Barang BMN'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality here
              },
            ),
          ],
        ),
      body: const ThemedLayout(
        child: Column(
          children: [
            Text('History Permintaan Barang BMN'),
            // ListView.builder(
              
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Add Permintaan',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PermintaanStore()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
