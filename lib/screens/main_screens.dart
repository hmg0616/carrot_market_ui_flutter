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
          Container( // index 0
            color: Colors.orange[100],
            child: Center(
              child: Text(
                'IndexedStack 1',
                style: TextStyle(fontSize: 20, color: Colors.black)
              ),
            ),
          ),
          Container( // index 1
            color: Colors.redAccent[100],
            child: Center(
              child: Text(
                  'IndexedStack 2',
                  style: TextStyle(fontSize: 20, color: Colors.black)
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( // 하단 네비게이션 바
        items: [
          BottomNavigationBarItem(
              label: '홈',
              icon: Icon(
                CupertinoIcons.home
              )
          ),
          BottomNavigationBarItem(
              label: '채팅',
              icon: Icon(
                  CupertinoIcons.chat_bubble
              )
          ),
        ],
        onTap: (index) { // 사용자 클릭 시 이벤트
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex, // 현재 선택된 인덱스
      ),
    );
  }
}
