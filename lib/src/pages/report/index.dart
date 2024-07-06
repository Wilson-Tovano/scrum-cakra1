import 'package:flutter/material.dart';

class HalamanLaporan extends StatefulWidget {
  const HalamanLaporan({super.key});

  @override
  _HalamanLaporanState createState() => _HalamanLaporanState();
}

class _HalamanLaporanState extends State<HalamanLaporan> {
  String jenisLaporan = 'Perincian';
  String jenisPeriode = 'Harian';
  String tipeEkspor = '.xlsx';
  DateTime tanggalMulai = DateTime.now();
  DateTime tanggalAkhir = DateTime.now();
  TextEditingController namaFileController = TextEditingController();
  bool overwriteFile = false;

  Future<void> _pilihTanggal(BuildContext context, bool isTanggalMulai) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isTanggalMulai ? tanggalMulai : tanggalAkhir,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null &&
        picked != (isTanggalMulai ? tanggalMulai : tanggalAkhir))
      setState(() {
        if (isTanggalMulai) {
          tanggalMulai = picked;
        } else {
          tanggalAkhir = picked;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Laporan Mutasi Aset',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Silahkan Pilih Jenis Laporan:     '),
                  DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10.0),
                    value: jenisLaporan,
                    onChanged: (String? newValue) {
                      setState(() {
                        jenisLaporan = newValue!;
                      });
                    },
                    items: <String>['Perincian', 'Summary', 'Total']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                ],
              ),
              Row(children: [
                Text('Jenis Periode Laporan:     '),
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10.0),
                  value: jenisPeriode,
                  onChanged: (String? newValue) {
                    setState(() {
                      jenisPeriode = newValue!;
                    });
                  },
                  items: <String>['Harian', 'Bulanan', 'Tahunan']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16)
              ]),
              Text('Masukkan Periode:'),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      onTap: () => _pilihTanggal(context, true),
                      decoration: InputDecoration(
                        hintText: "${tanggalMulai.toLocal()}".split(' ')[0],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('s.d'),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      onTap: () => _pilihTanggal(context, false),
                      decoration: InputDecoration(
                          hintText: "${tanggalAkhir.toLocal()}".split(' ')[0],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Tipe File Ekspor:     '),
                  DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10.0),
                    value: tipeEkspor,
                    onChanged: (String? newValue) {
                      setState(() {
                        tipeEkspor = newValue!;
                      });
                    },
                    items: <String>['.xlsx', '.pdf', '.txt']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16)
                ],
              ),
              Row(
                children: [Text('Nama File')],
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Maksimal 50 Karakter',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Row(
                children: [
                  Checkbox(
                    value: overwriteFile,
                    onChanged: (bool? newValue) {
                      setState(() {
                        overwriteFile = newValue!;
                      });
                    },
                  ),
                  Expanded(
                      child: Text(
                          'Melakukan overwrite kepada file dengan nama yang sama')),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (BuildContext context) {
                        return AlertDialog(
                          title: const Text("File Berhasil Diekspor!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(
                                          context)
                                      .pop();
                                },
                                child:
                                    const Text("OK")),
                          ],
                        );
                      });
                  },
                  child: Text(
                    'EKSPOR SEKARANG',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}