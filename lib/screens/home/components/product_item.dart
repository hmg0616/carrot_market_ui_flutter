import 'package:carrot_market_ui/models/product.dart';
import 'package:carrot_market_ui/screens/home/components/product_detail.dart';
import 'package:flutter/cupertino.dart';

class ProductItem extends StatelessWidget {

  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect( // 이미지 모서리에 곡선 효과를 주기 위해 사용
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              product.urlToImage,
              width: 115,
              height: 115,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          ProductDetail(product: product),
        ],
      ),
    );
  }
}
