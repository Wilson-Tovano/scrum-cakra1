import 'package:cakra_asset_management/src/helpers/string_helper.dart';
import 'package:cakra_asset_management/src/models/item_model.dart';
import 'package:cakra_asset_management/src/pages/item/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexItemPage extends StatelessWidget {
  const IndexItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemMap = context.watch<ItemModel>().groupedItems;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: itemMap.length,
        itemBuilder: (context, index) {
          ItemType itemType = itemMap.keys.elementAt(index);
          List<Item> items = itemMap[itemType]!;
          return Column(
            children: [
              Text(
                capitalize(itemType.name),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Item item = items[index];
                  return ListTile(
                    title: Text(item.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(item.code),
                    trailing: Text(
                      '${item.quantity} ${capitalize(item.itemUnit.name)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StoreItemPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
