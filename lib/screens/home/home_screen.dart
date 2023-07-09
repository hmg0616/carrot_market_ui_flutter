import 'package:carrot_market_ui/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/product_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row( // 왼쪽 타이틀 영역
          children: [
            const Text('좌동'),
            const SizedBox(width: 4.0,),
            const Icon(
              CupertinoIcons.chevron_down,
              size: 15.0,
            )
          ],
        ),
        actions: [ // 오른쪽 액션 영역
          IconButton(
            onPressed: (){},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(CupertinoIcons.list_dash),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(CupertinoIcons.bell),
          )
        ],
        bottom: const PreferredSize( // 하단 영역
            child: Divider(
              thickness: 0.5,
              height: 0.5,
              color: Colors.grey,
            ),
            preferredSize: Size.fromHeight(0.5),
        ),
      ),
      body: ListView.separated( // 구분자가 있는 리스트뷰
        separatorBuilder: (context, index) => const Divider( // 구분자
          height: 0,
          indent: 16, // 구분자 시작 위치
          endIndent: 16, // 구분자 끝 위치
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            product: productList[index]
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
