import 'package:cakra_asset_management/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // Define a list of items with the desired structure
  final List<Map<String, String>> items = [
    {"ItemType": 'Laptop', "ItemName": 'Acer'},
    {"ItemType": 'Laptop', "ItemName": 'Asus'},
    {"ItemType": 'Phone', "ItemName": 'Apple'},
    {"ItemType": 'Phone', "ItemName": 'Samsung'},
    {"ItemType": 'Phone', "ItemName": 'Google'},
    {"ItemType": 'Tablet', "ItemName": 'iPad'},
    {"ItemType": 'Tablet', "ItemName": 'Samsung Galaxy Tabdas'},
  ];

  @override
  Widget build(BuildContext context) {
    // Group items by "ItemType" using groupBy from collection package
    final groupedItems = groupBy(items, (item) => item["ItemType"]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Grouped Items Test'),
      ),
      body: ListView(
        children: groupedItems.entries.map((entry) {
          final itemType = entry.key;
          final itemList = entry.value;

          return Card(
            margin: EdgeInsets.all(8),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    itemType!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itemList.map((item) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        item["ItemName"]!,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
                TextButton(onPressed: () {
                   Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                }, child: const Text('change me'))
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}