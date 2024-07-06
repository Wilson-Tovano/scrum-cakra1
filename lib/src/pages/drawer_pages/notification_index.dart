import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      date: "10 Juni 2024, 10:06",
      message:
          "Hai USER,\nKami sudah mengkonfirmasi form pengambilan barang #1 Anda yang sudah diisi di tempat pengambilan.Jika yang mengambil barang bukan Anda, silakan menghubungi +621234567890 untuk informasi lebih lanjut. Terima kasih.",
    ),
    NotificationItem(
      date: "10 Juni 2024, 10:06",
      message:
          "Hai USER,\nPermintaan barang #1 Anda telah siap diambil. Mohon mengambil barang dalam waktu 3 hari.Untuk informasi selengkapnya silakan lihat di fitur Pengambilan. Terima Kasih.",
    ),
    NotificationItem(
      date: "10 Juni 2024, 10:06",
      message:
          "Hai USER,\nPermintaan barang #1 Anda akan kami proses secepatnya, untuk informasi selengkapnya silakan lihat di fitur Permintaan. Terima Kasih.",
    ),
    NotificationItem(
      date: "10 Juni 2024, 10:06",
      message:
          "Selamat datang, USER! Terima kasih telah menggunakan aplikasi CAKRA ASSET MANAGEMENT. Silakan melihat persediaan barang yang tersedia di fitur Persediaan.",
    ),
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi', style: TextStyle(color: Colors.white)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.list_rounded,
              size: 30,
              color: Colors.white,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 30, color: Colors.white),
          )
        ],
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(notifications[index]);
        },
      ),
    );
  }
}

class NotificationItem {
  final String date;
  final String message;

  NotificationItem({required this.date, required this.message});
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  NotificationCard(this.notification);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.asset(
                'assets/contact-placeholder.jpg',
                width: 100,
              ),
              SizedBox(width: 10), // Menambahkan jarak horizontal antara gambar dan teks
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.message,
                      style: TextStyle(fontSize: 16),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      notification.date,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          )),
          );
      }
}