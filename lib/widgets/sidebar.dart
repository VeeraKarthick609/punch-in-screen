import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controllers.dart';
import '../services/services.dart';

class SideBar extends StatefulWidget {
  SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<dynamic> category = findCategory();
  Color active = Color.fromARGB(255, 190, 214, 255);

  Color inactive = Color.fromARGB(255, 255, 255, 255);
  bool isActive = true;
  Controller _c = Get.put(Controller());
  late String selectedCategory = _c.activeCategory.value;
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    print(screenwidth);
    return Container(
      decoration: BoxDecoration(
          /* boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 0, 2, 90).withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 3,
        ),
      ],  */
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color.fromARGB(255, 0, 41, 112),
          )),
      height: screenheight / 1.35,
      width: screenwidth / 5,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            for (var item in category)
              GestureDetector(
                onTap: () {
                  _c.setactive(item);
                  setState(() {
                    selectedCategory = _c.activeCategory.value;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: (item == selectedCategory) ? active : inactive,
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 2, 90).withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  width: screenwidth / 7,
                  padding: EdgeInsets.symmetric(vertical: 3),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                        '${item}',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
