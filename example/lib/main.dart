import 'package:flutter/material.dart';
import 'package:tfk_loading/tfk_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Loading Overlay Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loading Overlay Example")),
      backgroundColor: Colors.green,
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            TfkLoading().show(
              child:
                  Icon(Icons.hourglass_bottom, color: Colors.white, size: 80),
              backgroundColor: Colors.black54,
            );

            await Future.delayed(Duration(seconds: 12));

            TfkLoading().hide();
          },
          child: Text("Show Loading Overlay"),
        ),
      ),
    );
  }
}