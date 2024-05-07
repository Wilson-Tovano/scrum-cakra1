import 'package:cakra_asset_management/src/helpers/string_helper.dart';
import 'package:cakra_asset_management/src/models/request_item_model.dart';
import 'package:cakra_asset_management/src/pages/request_item/store.dart';
import 'package:cakra_asset_management/src/themed_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestItemIndexPage extends StatelessWidget {
  const RequestItemIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    RequestItemModel requestItemModel = context.watch<RequestItemModel>();
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
      body: ThemedLayout(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('History Permintaan Barang BMN',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              for (var item in requestItemModel.items)
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                item.department,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(item.name),
                                  const SizedBox(width: 10),
                                  Text(item.quantity.toString()),
                                  const SizedBox(width: 10),
                                  Text(capitalize(item.unit.name)),
                                ],
                              )
                            ],
                          ),
                          Text(item.dateRequested),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Add Permintaan',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RequestItemStorePage()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
