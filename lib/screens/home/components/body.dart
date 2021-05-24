import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:sub_flutter_pemula_2/constans.dart';
import 'package:sub_flutter_pemula_2/screens/home/components/card_restaurant.dart';

import 'bottom_navigation.dart';
import 'header_with_search_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _list = [];
  List dummyList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);
    setState(() {
      _list = data["restaurants"];
      dummyList = _list;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        HeaderWithSearchBox(function: (String text) {
          setState(() {
            if(text != null) {
              List filter = [];
              dummyList.forEach((element) {
                if(element['city'].toUpperCase().contains(text.toUpperCase()))
                  filter.add(element);
              });
              _list = filter;
            } else {
              _list = dummyList;
            }
          });
        }),
        Container(
          height: size.height * 0.77 - kDefaultPadding,
          margin: EdgeInsets.only(top: kDefaultPadding),
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Text(
                          "Explore Restaurant",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      for(var item in _list)
                        CardRestaurant(
                          image: item['pictureId'],
                          city: item['city'],
                          name: item['name'],
                          rating: item['rating'],
                          description: item['description'],
                        ),
                    ],
                  ),
                ),
              ),
              BottomNavigation()
            ],
          ),
        )
      ],
    );
  }
}
