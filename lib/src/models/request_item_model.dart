import 'package:cakra_asset_management/src/models/common/item_unit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class RequestItem {
  final String department;
  final String name;
  final String dateRequested;
  final int quantity;
  final ItemUnit unit;
  final String? description;
  const RequestItem({
    required this.department,
    required this.name,
    required this.dateRequested,
    required this.quantity,
    required this.unit,
    this.description,
  });
}

class RequestItemModel extends ChangeNotifier {
  final List<RequestItem> _items = [];
  void add(RequestItem item){
    _items.add(item);
    notifyListeners();
  }

  void remove(RequestItem item){
    _items.remove(item);
  }

  RequestItem? find(String key){
    return _items.firstWhereOrNull((element) => element.name.toLowerCase() == key.toLowerCase());
  }

  bool contains(String key){
    return _items.any((element) => element.name.toLowerCase() == key.toLowerCase());
  }

  Map<String, List<RequestItem>> get groupedItems => groupBy(_items, (RequestItem item) => item.name);
  
  List<RequestItem> get items => _items;
}