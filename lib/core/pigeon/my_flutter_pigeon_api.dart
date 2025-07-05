import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter/core/pigeon/my_flutter_pigeon.dart';
import 'package:my_flutter/main.dart';

class MyFlutterPigeonApi extends ModuleFlutter {
  final BuildContext context;
  final WidgetRef ref;

  MyFlutterPigeonApi(this.context, this.ref);
  @override
  void reset() {
    context.go("/");
  }

  @override
  void showPosts() {
    context.pushNamed(NativeRoutes.posts.name);
  }

  @override
  void showSelectedPost(FlutterPost post) {
    context.pushNamed(NativeRoutes.posts.name, extra: post);
  }
}
