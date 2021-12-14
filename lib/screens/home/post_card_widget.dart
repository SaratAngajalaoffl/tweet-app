import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tweet/models/post_model.dart';
import 'package:tweet/screens/home/carousel_without_indicator.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const CircleAvatar(child: Icon(EvaIcons.person)),
            title: Text(post.title),
            subtitle: Text(post.owner.username),
          ),
          CarouselWithOutIndicatorDemo(imageSliders: post.pictures),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.chat),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
