import 'package:chopperapp/data/PostApiService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PostApiService.create(),
      dispose: (_,PostApiService service){
        service.client.dispose();
      },
      child: MaterialApp(
        title:"Material App",
        home: HomePage(),
      ),
    );
  }
}
