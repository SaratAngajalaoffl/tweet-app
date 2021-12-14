import 'package:flutter/material.dart';
import 'package:tweet/models/post_model.dart';
import 'package:tweet/screens/home/post_card_widget.dart';
import 'package:tweet/services/brain/brain_service.dart';
import 'package:tweet/widgets/loading_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool loading = true;
  List<PostModel> posts = <PostModel>[];

  @override
  void initState() {
    super.initState();
    _handleGetPosts();
  }

  Future<void> _handleGetPosts() async {
    List<PostModel> postData = await getPosts();

    setState(() {
      posts = postData;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Column(
        children: const [LoadingIndicator()],
      );
    }

    return ListView(
      children: posts.map<Widget>((post) => PostCard(post: post)).toList(),
    );
  }
}
