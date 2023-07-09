import 'package:carrot_market_ui/models/product.dart';
import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {

  final Product product;

  const ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded( // 부모위젯 크기 최대까지 늘어남. ProductDetail의 부모위젯은 Row이므로 가로 방향 최대까지 늘어남.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: textTheme().bodyText1),
            const SizedBox(height: 4.0),
            Text('${product.address} · ${product.publishedAt}'),
            const SizedBox(height: 4.0),
            Text(
              '${numberFormat(product.price)}원',
              style: textTheme().headline2,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: product.commentsCount > 0, // 조건에 맞으면 위젯이 보임
                  child: _buildIcons(
                    product.commentsCount,
                    CupertinoIcons.chat_bubble_2
                  )
                ),
                const SizedBox(width: 8.0),
                Visibility(
                  visible: product.heartCount > 0,
                  child: _buildIcons(
                      product.heartCount,
                      CupertinoIcons.heart
                  )
                )
              ],
            )
          ],
        )
    );
  }

  numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    return formatter.format(int.parse(price));
  }

  _buildIcons(int count, IconData iconData) {
    return Row(
      children: [
        Icon(iconData, size: 14.0),
        const SizedBox(width: 4.0),
        Text('$count'),
      ],
    );
  }
}
