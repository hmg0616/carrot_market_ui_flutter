import 'package:carrot_market_ui/screens/component/appbar_preferred_size.dart';
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
          )
        ],
      ),
    );
  }
}
