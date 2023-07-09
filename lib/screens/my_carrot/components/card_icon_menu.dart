import 'package:carrot_market_ui/models/icon_menu.dart';
import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/material.dart';

class CardIconMenu extends StatelessWidget {

  final List<IconMenu> iconMenuList;

  CardIconMenu({required this.iconMenuList});

  @override
  Widget build(BuildContext context) {
    return Card( // 입체감과 모서리에 곡선이 필요한 위젯을 만들 때 사용하는 위젯. 위젯 크기는 지정할 수 없고 부모 위젯의 제약과 자식 위젯 크기에 따라 결정됨. 기본적으로 margin을 가지고 있음.
      elevation: 0.5, // 음영
      margin: EdgeInsets.zero, // 외부여백
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // 내부여백
        child: Column(
          children: List.generate(
            iconMenuList.length,
            (index) => _buildRowIconItem(
              iconMenuList[index].title, iconMenuList[index].iconData
            )
          ),
        ),
      ),

    );
  }

  Widget _buildRowIconItem(String title, IconData iconData) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Icon(iconData, size: 17),
          SizedBox(width: 20),
          Text(title, style: textTheme().subtitle1)
        ],
      ),
    );
  }
}
