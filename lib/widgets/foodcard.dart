import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllers.dart';

class FoodCard extends StatefulWidget {
  String image_url;
  String name;
  double price;

  FoodCard(
      {super.key,
      required this.image_url,
      required this.name,
      required this.price});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    final Controller _c = Get.put(Controller());
    int qty = _c.get_qty(widget.name);
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
      height: screenwidth * 0.4,
      width: screenwidth * 0.35,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(14)),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            _c.add(widget.name, widget.price);
            _c.get_total();
            setState(() {
              qty = _c.get_qty(widget.name);
            });
          },
          child: Column(
            children: [
              Container(
                  width: screenwidth * 0.35,
                  height: screenwidth / 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14)),
                    child: Image.network(
                      widget.image_url.toString(),
                      fit: BoxFit.cover,
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.name}',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                child: (_c.get_qty(widget.name) != 0)
                    ? Text(
                        '${_c.get_qty(widget.name)}',
                        style: TextStyle(color: Colors.grey),
                      )
                    : null,
              )
            ],
          ),
        ),
        SizedBox(
          height: 4.4,
        ),
        Container(
            child: (qty != 0)
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _c.remove(widget.name, widget.price);
                          _c.get_total();
                          setState(() {
                            qty = _c.get_qty(widget.name);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(14))),
                          height: screenwidth * 0.089,
                          width: (screenwidth * 0.35) / 2,
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: screenwidth * 0.089,
                            width: (screenwidth * 0.3) / 2,
                            child: Center(
                              child: Icon(
                                Icons.more_horiz,
                              ),
                            )),
                      )
                    ],
                  )
                : null)
      ]),
    );
  }
}
