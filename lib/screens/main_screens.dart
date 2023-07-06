import 'package:carrot_market_ui/screens/chatting/chatting_screen.dart';
import 'package:carrot_market_ui/screens/home/home_screen.dart';
import 'package:carrot_market_ui/screens/my_carrot/my_carrot_screen.dart';
import 'package:carrot_market_ui/screens/near_me/near_me_screen.dart';
import 'package:carrot_market_ui/screens/neighborhood_life/neighborhood_life_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreens extends StatefulWidget {
  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold : 기본적인 시각적 레이아웃 구조를 간편하게 만들어 주는 위젯
      body: IndexedStack( // IndexedStack : 한 번에 하위 항목 하나만을 보여주는 위젯
        index: _selectedIndex,
        children: [
          HomeScreen(), // index 0
          NeighborhoodLifeScreen(), // index 1
          NearMeScreen(), // index 2
          ChattingScreen(), // index 3
          MyCarrotScreen(), // index 4
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( // 하단 네비게이션 바
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, // 3개 이상 item 표시할때 설정
        currentIndex: _selectedIndex, // 현재 선택된 인덱스
        onTap: (index) { // 사용자 클릭 시 이벤트
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem( // const를 붙이면 변하지 않은 위젯임을 알려, 컴파일 시점에 미리 위젯을 생성하여 성능에 도움.
              label: '홈',
              icon: Icon(
                  CupertinoIcons.home
              )
          ),
          const BottomNavigationBarItem(
              label: '동네생활',
              icon: Icon(
                  CupertinoIcons.square_on_square
              )
          ),
          const BottomNavigationBarItem(
              label: '내 근처',
              icon: Icon(
                  CupertinoIcons.placemark
              )
          ),
          const BottomNavigationBarItem(
              label: '채팅',
              icon: Icon(
                  CupertinoIcons.chat_bubble_2
              )
          ),
          const BottomNavigationBarItem(
              label: '나의 당근',
              icon: Icon(
                  CupertinoIcons.person
              )
          ),
        ],
      ),
    );
  }
}
