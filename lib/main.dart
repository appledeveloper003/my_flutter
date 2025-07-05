import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter/core/pigeon/my_flutter_pigeon.dart';
import 'package:my_flutter/core/pigeon/my_flutter_pigeon_api.dart';
import 'package:my_flutter/post_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  debugPrint("INitttttt");
  runApp(const MyFlutterModuleHome());
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");
final GlobalKey<NavigatorState> rootNavigatorKey = _rootNavigatorKey;
final GoRouter _router =
    GoRouter(navigatorKey: rootNavigatorKey, routes: nativeRoutes);

final List<GoRoute> nativeRoutes = [
  GoRoute(
      path: NativeRoutes.initial.route,
      name: NativeRoutes.initial.name,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        // Initial(
        //       key: state.pageKey,
        //     ),

        final extra = FlutterPost(
            body:
                "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
            title:
                "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            userId: 1,
            id: 1);

        return PostDetails(key: state.pageKey, selectedPost: extra);
      },
      routes: [
        GoRoute(
            path: NativeRoutes.posts.route,
            name: NativeRoutes.posts.name,
            builder: (context, state) {
              final extra = state.extra as FlutterPost;
              return PostDetails(key: state.pageKey, selectedPost: extra);
            })
      ]),
];

enum NativeRoutes {
  initial("/"),
  posts("posts");

  final String name;

  const NativeRoutes(this.name);

  String get route {
    return name;
  }
}

class Initial extends ConsumerStatefulWidget {
  const Initial({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitialState();
}

class _InitialState extends ConsumerState<Initial> {
  @override
  void initState() {
    super.initState();
    ModuleFlutter.setUp(MyFlutterPigeonApi(context, ref));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class MyFlutterModuleHome extends ConsumerStatefulWidget {
  const MyFlutterModuleHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyFlutterModuleHomeState();
}

class _MyFlutterModuleHomeState extends ConsumerState<MyFlutterModuleHome> {
// @override
//   void initState() {
//     // do
//   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final textScaler = MediaQuery.textScalerOf(context)
            .clamp(minScaleFactor: 0.8, maxScaleFactor: 1.35);

        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: textScaler),
            child: child ?? const Initial());
      },
    );
  }
}
/*

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
//         // counter didn't reset back to zero; the application is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
