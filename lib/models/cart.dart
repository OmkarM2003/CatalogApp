import 'package:flutter_application_1/models/catalog.dart';

class CartModel {

  static final cartModel =CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  

  CatalogModel? _catalog; // Make _catalog nullable with '?'
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog!; // Use non-null assertion operator '!'

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds
    .map((id) => _catalog!.getById(id))
    .toList()
    .cast<Item>(); // Cast the result to List<Item>

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
