import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {

  final double borderRadius;
  final String imageUrl;
  final double width;
  final double height;

  const ImageContainer({
    Key? key,
    required this.borderRadius,
    required this.imageUrl,
    required this.width,
    required this.height
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect( // 이미지 모서리에 곡선 효과를 주기 위해 사용
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
