import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> namaAnggota = ["Karina Desi Liady", "Rein Jonathan Thomas", "Sherwin Prasetya Makmur", "Vincent Stanley", "Wilson Tovano"];
    List<String> nimAnggota = ["221111905", "221110904", "221110711", "221110003", "221113421"];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang', style: TextStyle(color: Colors.white)),
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
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("CAKRA ASSET MANAGEMENT", style: TextStyle(fontSize: 70),),
              Text("Dibuat oleh Kelompok Cakra", style: TextStyle(fontSize: 50),),
              Text("IF-A Sore, Semester IV, Juli 2024", style: TextStyle(fontSize: 50),),
              Text("Pengembangan Mobile Flutter", style: TextStyle(fontSize: 50),),
              Text("Anggota", style: TextStyle(fontSize: 50),),
              Text("Karina Desi Liady (221111905)"),
              Text("Rein Jonathan Thomas (221110904)"),
              Text("Sherwin Prasetya Makmur (221110711)"),
              Text("Vincent Stanley (221110003)"),
              Text("Wilson Tovano (221113421)"),
            ],
          ),
        ),
      ),
    );
  }
}