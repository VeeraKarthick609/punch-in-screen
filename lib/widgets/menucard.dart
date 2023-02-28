import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controllers.dart';
import '../services/services.dart';
import 'foodcard.dart';

class MenuCard extends StatelessWidget {
  String? category;
  String? type;
  MenuCard({super.key, required this.category, required this.type});
  Controller _c = Get.put(Controller());
  late dynamic foodItem = foodItems(category, type);

  @override
  Widget build(BuildContext context) {
    //print(_c.category.value);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                for (var item in foodItem)
                  FoodCard(
                    image_url: item["img_url"],
                    name: item["name"],
                    price: item["price"],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
