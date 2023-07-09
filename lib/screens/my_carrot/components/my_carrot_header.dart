import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCarrotHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card( // 입체감과 모서리에 곡선이 필요한 위젯을 만들 때 사용하는 위젯. 위젯 크기는 지정할 수 없고 부모 위젯의 제약과 자식 위젯 크기에 따라 결정됨. 기본적으로 margin을 가지고 있음.
      elevation: 0.5, // 음영? 그림자?
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding( // padding 지정
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            const SizedBox(height: 30),
            _buildProfileButton(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton('판매구역', FontAwesomeIcons.receipt),
                _buildRoundTextButton('구매내역', FontAwesomeIcons.shoppingBag),
                _buildRoundTextButton('관심목록', FontAwesomeIcons.heart),
              ],
            )
          ],
        )
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      children: [
        Stack( // 여러 위젯 쌓기
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  'https://placeimg.com/200/100/people',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100]
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 15
                ),
              )
            )
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('developer', style: textTheme().headline2),
            SizedBox(height: 10),
            Text('좌동 #00912')
          ],
        )
      ],
    );
  }

  Widget _buildProfileButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFD4D5DD),
            width: 1.0
          ),
          borderRadius: BorderRadius.circular(6.0)
        ),
        height: 45,
        child: Center(
          child: Text(
            '프로필기 보기',
            style: textTheme().subtitle1,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTextButton(String title, IconData iconData) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color.fromRGBO(255, 226, 208, 1),
            border: Border.all(color: Color(0XFFD4D5DD), width: 0.5)
          ),
          child: Icon(
            iconData,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: textTheme().subtitle1,
        )
      ],
    );
  }
}
