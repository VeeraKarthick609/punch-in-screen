import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m/screens/searchpage.dart';
import 'package:m/services/services.dart';
import '../controller/controllers.dart';
import '../widgets/bottombar.dart';
import '../widgets/menucard.dart';
import '../widgets/sidebar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Controller _c = Get.put(Controller());
  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      /* floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(Icons.shopping_cart),
          label: Text(
            'Go to Cart',
            style: TextStyle(fontSize: 18),
          )

          /* child: Container(
          color: Colors.amber,
          width: screenwidth / 3,
        ), */
          ), */
      appBar: AppBar(
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: const Icon(Icons.search))
        ],
        title: Text('New Order'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Color.fromARGB(255, 0, 41, 112),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Punch in order',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _c.type.value = 'veg';
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            decoration: BoxDecoration(
                                color: _c.type.value == 'veg'
                                    ? Colors.green[100]
                                    : Colors.white,
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'VEG',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _c.type.value = 'non-veg';
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                                color: _c.type.value == 'non-veg'
                                    ? Colors.red[100]
                                    : Colors.white,
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'Non-VEG',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SideBar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                          _c.activeCategory.value,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: screenwidth * 0.75,
                      height: screenheight / 1.4,
                      child: Obx(
                        () => MenuCard(
                          category: _c.activeCategory.value,
                          type: _c.type.value,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
