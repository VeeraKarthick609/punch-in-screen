import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controllers.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  Controller _c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    print(_c.total_items);
    return Obx(() => Container(
          height: screenheight / 18,
          color: (_c.total_items == 0)
              ? Colors.black
              : Color.fromARGB(255, 0, 41, 112),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Text(
                          '${_c.total_items} Items | ${_c.total}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ))
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'View my Order',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
