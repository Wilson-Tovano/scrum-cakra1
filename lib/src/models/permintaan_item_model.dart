import 'package:flutter/material.dart';

@immutable
class PermintaanItemInfo{
  const PermintaanItemInfo({
    required this.nama,
    required this.jurusan,
    required this.satuan,
    required this.jumlah,
    required this.keterangan,
    required this.tanggal,
    required this.status, // default value for status
    required this.pesanAdmin, // default value for pesanAdmin 
    required this.terambil,
    required this.tglTerambil,
  });

  final String nama;
  final String jurusan;
  final String satuan;
  final int jumlah;
  final String keterangan;
  final String tanggal;
  final String status;
  final String pesanAdmin;
  final bool terambil;
  final String tglTerambil;

  PermintaanItemInfo copyWith({
    String? status,
    String? pesanAdmin,
    bool? terambil,
    String? tglTerambil,
  }) {
    return PermintaanItemInfo(
      nama: nama,
      jurusan: jurusan,
      satuan: satuan,
      jumlah: jumlah,
      keterangan: keterangan,
      tanggal: tanggal,
      status: status ?? this.status,
      pesanAdmin: pesanAdmin ?? this.pesanAdmin,
      terambil: terambil ?? this.terambil,
      tglTerambil: tglTerambil ?? this.tglTerambil,
    );
  }
}

class PermintaanItemInfoProvider with ChangeNotifier{
  final List<PermintaanItemInfo> _itemInfo = [

    // Terdapat 4 data sample
    const PermintaanItemInfo(nama: "Laptop", jurusan: "Teknik Informatika", satuan: "Unit", jumlah: 1, keterangan: "Untuk keperluan dosen", tanggal: "23 Agustus 2024", status: 'pending', pesanAdmin: "", terambil: false, tglTerambil: ""),
    const PermintaanItemInfo(nama: "Pensil", jurusan: "Sistem Informasi", satuan: "Batang", jumlah: 100, keterangan: "Untuk dibagikan kepada murid-murid", tanggal: "23 Agustus 2024", status: 'tolak', pesanAdmin: "Tidak logis", terambil: false, tglTerambil: ""),
    const PermintaanItemInfo(nama: "Tinta", jurusan: "Sastra", satuan: "Bungkus", jumlah: 5, keterangan: "Ini untuk printing", tanggal: "23 Agustus 2024", status: 'terima', pesanAdmin: "Permintaan diterima", terambil: false, tglTerambil: ""),
    const PermintaanItemInfo(nama: "Printer", jurusan: "Teknik Informatika", satuan: "Bungkus", jumlah: 1, keterangan: "Untuk print modul", tanggal: "23 Agustus 2024", status: 'pending', pesanAdmin: "", terambil: false, tglTerambil: ""),

  ];

  List<PermintaanItemInfo> get itemInfo => _itemInfo;

  void addItemInfo(String nama, String jurusan, String satuan, int jumlah, String keterangan, String tanggal, String status, String pesanAdmin){
    _itemInfo.add(PermintaanItemInfo(nama: nama, jurusan: jurusan, satuan: satuan, jumlah: jumlah, keterangan: keterangan, tanggal: tanggal, status: status, pesanAdmin: pesanAdmin, terambil: false, tglTerambil: ""));
    notifyListeners();
  }

  void updateStatus(int index, String newStatus, String pesanAdmin){
    final item = _itemInfo[index];
    _itemInfo[index] = item.copyWith(status: newStatus, pesanAdmin: pesanAdmin);
    notifyListeners();
  }

  void itemObtained(int index, String tglTerambil){
    final item = _itemInfo[index];
    _itemInfo[index] = item.copyWith(terambil: true, tglTerambil: tglTerambil);
    notifyListeners();
  }
}