import 'package:flutter/material.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/widget/homesub_card.dart';

class HomesubRowList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: FutureBuilder(
        future: Request.getHomeSub(4, 0),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return HomesubCard(data: snapshot.data.data[index]);
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
