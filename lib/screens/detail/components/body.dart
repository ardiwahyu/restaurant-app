import 'package:flutter/material.dart';
import 'package:sub_flutter_pemula_2/components/text_with_black_shadow.dart';
import 'package:sub_flutter_pemula_2/constans.dart';

import 'bottom_sheet_description.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    this.image,
    this.city,
    this.name,
    this.rating,
    this.description
  }) : super(key: key);

  final String image;
  final String city;
  final String name;
  final double rating;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image)
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 24 + kDefaultPadding,
                left: kDefaultPadding,
                right: kDefaultPadding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                    boxShadow: [BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 50,
                      color: Colors.black
                    )]
                  ),
                  child: IconButton(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: kDefaultPadding,),
                TextWithBlackShadow(text: name,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 8,),
                TextWithBlackShadow(text: "Rating: $rating",
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.blue, size: 20,),
                    SizedBox(width: 8,),
                    TextWithBlackShadow(text: city.toUpperCase(),
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          BottomSheetDescription(description: description)
        ],
      ),
    );
  }
}