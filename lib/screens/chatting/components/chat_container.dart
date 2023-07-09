import 'package:carrot_market_ui/models/chat_message.dart';
import 'package:carrot_market_ui/screens/component/image_container.dart';
import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {

  final ChatMessage chatMessage;

  const ChatContainer({
    super.key,
    required this.chatMessage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            ImageContainer(
                borderRadius: 25,
                imageUrl: chatMessage.profileImage,
                width: 50,
                height: 50
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text.rich( // 문단 단위로 텍스트를 꾸며줄 수 있음
                    TextSpan(
                      children: [
                        TextSpan(
                            text: chatMessage.sender,
                            style: textTheme().bodyText1
                        ),
                        TextSpan(text: chatMessage.location),
                        TextSpan(text: ' · ${chatMessage.sendDate}'),
                      ]
                    )
                  ),
                  const Spacer(),
                  Text(
                    chatMessage.message,
                    style: textTheme().bodyText1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                ],
              )
            ),
            Visibility(
              visible: chatMessage.imageUri != null, // 조건에 맞으면 위젯이 보임
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageContainer(
                    borderRadius: 8,
                    imageUrl: chatMessage.imageUri ?? '',
                    width: 50,
                    height: 50
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
