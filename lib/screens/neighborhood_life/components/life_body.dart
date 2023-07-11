import 'package:carrot_market_ui/models/neighborhood_life.dart';
import 'package:carrot_market_ui/screens/component/image_container.dart';
import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LifeBody extends StatelessWidget {
  final NeighborhoodLife neighborhoodLife;

  const LifeBody({super.key, required this.neighborhoodLife});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
          )),
      child: Column(
        children: [
          _buildTop(),
          _buildWriter(),
          _buildWriting(),
          _buildImage(),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[100],
          ),
          _buildTail(neighborhoodLife.commentCount)
        ],
      ),
    );
  }

  Padding _buildTop() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 시작과 끝에 배치
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Color.fromRGBO(247, 247, 247, 1)),
            child:
                Text(neighborhoodLife.category, style: textTheme().bodyText2),
          ),
          Text(
            neighborhoodLife.date,
            style: textTheme().bodyText2,
          )
        ],
      ),
    );
  }

  Padding _buildWriter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ImageContainer(
            width: 30,
            height: 30,
            borderRadius: 15,
            imageUrl: neighborhoodLife.profileImgUri
          ),
          Text.rich( // 문단 단위로 텍스트를 꾸며줄 수 있음
            TextSpan(
              children: [
                TextSpan(
                  text: ' ${neighborhoodLife.userName}',
                  style: textTheme().bodyText1
                ),
                TextSpan(
                  text: ' ${neighborhoodLife.location}', // textTheme().bodyText2 기본
                ),
                TextSpan(
                  text: ' 인증 ${neighborhoodLife.authCount}회'
                )
              ]
            )
          )
        ],
      ),
    );
  }

  Padding _buildWriting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          neighborhoodLife.content,
          style: textTheme().bodyText1,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Visibility _buildImage() {
    return Visibility(
        visible: neighborhoodLife.contentImgUri != "",
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Image.network(
            neighborhoodLife.contentImgUri,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
    );
  }

  Padding _buildTail(int commentCount) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.smile,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(width: 8),
          Text(
            '공감하기',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(width: 22),
          Icon(
            FontAwesomeIcons.commentAlt,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(width: 8),
          Text(
            '댓글쓰기 ${commentCount}',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
