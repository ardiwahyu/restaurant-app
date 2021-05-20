import 'package:flutter/material.dart';
import 'package:sub_flutter_pemula_2/components/text_with_black_shadow.dart';
import 'package:sub_flutter_pemula_2/constans.dart';
import 'package:sub_flutter_pemula_2/screens/detail/detail_screen.dart';

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({
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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                image: image,
                city: city,
                name: name,
                rating: rating,
                description: description,
              )
            )
        );
      },
      child: Container(
        height: size.height * 0.3,
        margin: EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultPadding),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.15), BlendMode.srcATop),
                  image: NetworkImage(image)
              ),
            ),
            // child: CachedNetworkImage(imageUrl: image,),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomLeft,
              child: Wrap(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: kDefaultPadding),
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(kDefaultPadding),
                            topRight: Radius.circular(kDefaultPadding))),
                    child: Text(
                      city.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextWithBlackShadow(
                    text: name,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      TextWithBlackShadow(
                        text: rating.toString(),
                        textStyle: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
