import 'package:flutter/material.dart';
import 'package:sub_flutter_pemula_2/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWithSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 24 + kDefaultPadding,
                left: kDefaultPadding,
                right: kDefaultPadding
            ),
            child: Row(
              children: <Widget>[
                Text('Hunger Apps',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding
              ),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245,246,249,0.8),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: false,
                      style: TextStyle(color: kTextColor),
                      decoration: InputDecoration(
                        hintText: "Search restaurant",
                        hintStyle: TextStyle(
                          color: kHintTextColor,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}