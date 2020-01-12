import 'package:flutter/material.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/widget/pay_card.dart';

class PayRowList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Request.getPayCard(0),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<PayCard> payCards = [];
        // ignore: missing_return
        if (snapshot.hasData) {
          for (var item in snapshot.data.data) {
            payCards.add(PayCard(
              payData: item,
            ));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "购买栏目",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                        child: Text(
                      "更多",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ))
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 290,
                    ),
                    Container(
                      height: 290,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: payCards,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
