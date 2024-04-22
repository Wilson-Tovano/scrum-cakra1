import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

enum ItemType { mobil, makanan, minuman }
enum ItemUnit { liter, kilogram, pcs }

@immutable
class Item {
  const Item({
    required this.code,
    required this.name,
    required this.itemType,
    required this.quantity,
    required this.itemUnit,
  });
  final String code;
  final String name;
  final ItemType itemType;
  final int quantity;
  final ItemUnit itemUnit;
}

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];
  void add(Item item){
    _items.add(item);
    notifyListeners();
  }

  void remove(Item item){
    _items.remove(item);
    notifyListeners();
  }

  Item? find(String key){
    return _items.firstWhereOrNull((element) => element.code.toLowerCase() == key.toLowerCase());
  }

  bool contains(String key){
    return _items.any((element) => element.code.toLowerCase() == key.toLowerCase());
  }

  Map<ItemType, List<Item>> get groupedItems => groupBy(_items, (Item item) => item.itemType);

  List<Item> get items => _items;
}