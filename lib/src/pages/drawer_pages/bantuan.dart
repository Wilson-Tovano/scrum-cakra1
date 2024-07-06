import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan', style: TextStyle(color: Colors.white)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.list_rounded,
              size: 30,
              color: Colors.white,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 30, color: Colors.white),
          )
        ],
        backgroundColor: Colors.purple,
      ),
      body: const Column(
        children: [
          Text("Ini adalah halaman bantuan, memuat flow dan konsep dari Cakra Asset Management")
        ],
      ),
    );
  }
}