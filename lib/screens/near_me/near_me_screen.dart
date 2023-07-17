import 'package:carrot_market_ui/models/recommend_store.dart';
import 'package:carrot_market_ui/screens/component/appbar_preferred_size.dart';
import 'package:carrot_market_ui/screens/near_me/components/round_border_text.dart';
import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/bottom_title_icon.dart';
import 'components/search_text_field.dart';
import 'components/store_item.dart';

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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Wrap( // 자식을 Row나 Column으로 배치할 수 있고, 배치할 공간이 부족해 지면 자식 위젯을 다음 줄에 배치함. 반응형 웹에도 활용 가능.
              alignment: WrapAlignment.start,
              spacing: 22.0, // 위젯간의 간격
              runSpacing: 30, // 윗줄과 아랫줄 사이 간격
              children: [
                const ButtomTitleIcon(
                  title: '구인구직',
                  iconData: FontAwesomeIcons.user,
                ),
                const ButtomTitleIcon(
                  title: '과외/클래스',
                  iconData: FontAwesomeIcons.edit,
                ),
                const ButtomTitleIcon(
                  title: '농수산물',
                  iconData: FontAwesomeIcons.appleAlt,
                ),
                const ButtomTitleIcon(
                  title: '부동산',
                  iconData: FontAwesomeIcons.hotel,
                ),
                const ButtomTitleIcon(
                  title: '중고차',
                  iconData: FontAwesomeIcons.car,
                ),
                const ButtomTitleIcon(
                  title: '전시/행사',
                  iconData: FontAwesomeIcons.chessBishop,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('이웃들의 추천 가게', style: textTheme().headline2),
          ),
          const SizedBox(height: 20),
          Container(
            height: 288,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendStoreList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: StoreItem(
                    recommendStore: recommendStoreList[index]
                  ),
                );
              },
            )
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
