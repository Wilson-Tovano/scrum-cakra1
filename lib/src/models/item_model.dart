import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Item {
  const Item({
    required this.code,
    required this.name,
    required this.itemType,
    required this.quantity,
    required this.unit,
  });
  final String code;
  final String name;
  final String itemType;
  final int quantity;
  final String unit;
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

  List<Item> get items => _items;
}