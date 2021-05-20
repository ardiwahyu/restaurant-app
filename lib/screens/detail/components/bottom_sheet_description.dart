import 'package:flutter/material.dart';
import 'package:sub_flutter_pemula_2/constans.dart';

class BottomSheetDescription extends StatelessWidget {
  const BottomSheetDescription({
    Key key,
    this.description
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.2,
        maxChildSize: 0.7,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(kDefaultPadding),
                    topLeft: Radius.circular(kDefaultPadding)
                ),
                color: Colors.white
            ),
            padding: EdgeInsets.only(
                top: kDefaultPadding,
                right: kDefaultPadding,
                left: kDefaultPadding
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: kDefaultPadding),
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deskripsi",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Divider(
                    color: kTextColor,
                    thickness: 2,
                  ),
                  SizedBox(height: 8,),
                  Text(description,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}