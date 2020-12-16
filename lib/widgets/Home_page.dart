import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/controllers/stockController.dart';
import 'package:intl/intl.dart';

final symbolController = TextEditingController();
final now = new DateTime.now();
String formatter = DateFormat('yMd').format(now);

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  StockController stockController = Get.put(StockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Rapid Stocks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$formatter",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                        height: 50,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              hintText: "Search",
                              prefix: Icon(Icons.search),
                              fillColor: Colors.grey[800],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                          controller: symbolController,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
