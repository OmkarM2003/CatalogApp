import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {



  

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


}


class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    // Access the store directly without the `?` operator
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    // Access the store directly without the `?` operator
    store!.cart._itemIds.remove(item.id);
  }
}