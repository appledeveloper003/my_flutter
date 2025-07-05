import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter/core/pigeon/my_flutter_pigeon.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModuleNative().getUser("userr");
    debugPrint("userrrrrr $user");
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
        child: Text("Helllllllo"),
      ),
    );
  }
}
