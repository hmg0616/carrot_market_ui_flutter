
import 'package:flutter/material.dart';

PreferredSize appBarBottomLine() { // appBar의 bottom 속성에서 구분선을 만드는 공통 로직
  var height = 0.5;

  return PreferredSize( // 자식 위젯에게 어떤 제약도 부과하지 않고 부모 위젯에게 공간을 차지하는 크기만을 알려주는 위젯
    preferredSize: Size.fromHeight(height),
    child: Divider(
      thickness: height,
      height: height,
      color: Colors.grey,
    ),
  );
}