import 'package:carrot_market_ui/models/recommend_store.dart';
import 'package:carrot_market_ui/screens/component/appbar_preferred_size.dart';
import 'package:carrot_market_ui/screens/near_me/components/round_border_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/search_text_field.dart';

class NearMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 근처'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.pencil)),
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.bell))
        ],
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchTextField(),
          ),
          SizedBox(
            height: 66, // 수평방향 스크롤은 높이를 지정해주어야함
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // 수평방향 스크롤
              itemCount: searchKeyword.length,
              itemBuilder: (context, index) {
                return Center(
                  child: RoundBorderText(
                    title: searchKeyword[index],
                    position: index
                  ),
                );
              },
            )
          ),
          Divider(
            color: Colors.grey[100],
            thickness: 10.0,
          )
        ],
      ),
    );
  }
}
