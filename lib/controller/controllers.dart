import 'package:get/get.dart';

class Controller extends GetxController {
  RxString activeCategory = 'All'.obs;
  RxString type = 'veg'.obs;
  RxMap items = {}.obs;
  RxDouble total = 0.0.obs;
  RxInt quantity = 0.obs;
  RxInt total_items = 0.obs;
  void setactive(selectedCategory) {
    activeCategory.value = selectedCategory;
  }

  void add(name, price) {
    if (items.containsKey(name)) {
      quantity = items[name][1]++;
      items[name] = [price, quantity];
    } else {
      RxInt qty = 1.obs;
      items[name] = [price, qty];
    }
    total_items += 1;
  }

  void remove(name, price) {
    if (items.containsKey(name)) {
      if (items[name][1].value > 0) {
        quantity = items[name][1]--;
        items[name] = [price, quantity];
      }
    }
    total_items -= 1;
  }

  dynamic get_qty(name) {
    if (items.isEmpty) {
      return 0;
    } else if (quantity.value == 0) {
      return 0;
    } else {
      List? item = items[name];
      return item?[1].value ?? 0;
    }
  }

  dynamic get_total() {
    total = 0.0.obs;
    items.forEach((key, value) {
      var qty = items[key][1].value as int;
      var price = items[key][0];
      total = total + (qty * price) as RxDouble;
    });
  }
}
