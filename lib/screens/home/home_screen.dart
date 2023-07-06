import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(),
    );
  }
}
