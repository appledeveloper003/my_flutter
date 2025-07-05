import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter/core/pigeon/my_flutter_pigeon.dart';

class PostDetails extends StatelessWidget {
  final FlutterPost selectedPost;
  const PostDetails({super.key, required this.selectedPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              context.pop();
              ModuleNative().closePosts();
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF373866),
            )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 18,
            children: [
              Text(
                selectedPost.title,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedPost.body,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
