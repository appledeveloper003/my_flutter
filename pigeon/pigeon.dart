// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pigeon/pigeon.dart';

// To generate pigeon files, run:
// flutter pub run pigeon --input pigeon/pigeon.dart

@ConfigurePigeon(
  PigeonOptions(
    dartOut: "lib/core/pigeon/my_flutter_pigeon.dart",
    swiftOut: "pigeon/MyFlutterProtocol.swift",
    kotlinOut: "pigeon/MyFlutteInterface.kt",
    kotlinOptions: KotlinOptions(
      package: "com.appledeveloper003.royalwiki",
    ),
  ),
)

/// Flutter -> Native communication
/// Requires implementation on Native side
@HostApi()
abstract class ModuleNative {
  User getUser(String userId);
  void closePosts();
}

/// Native -> Flutter communicaton
/// Requires implementation on Flutter side
@FlutterApi()
abstract class ModuleFlutter {
  void reset();
  void showPosts();
  void showSelectedPost(FlutterPost post);
}

class User {
  String id;
  String? name;

  User({required this.id, this.name});
}

class FlutterPost {
  int userId;
  int id;
  String title;
  String body;
  FlutterPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}
