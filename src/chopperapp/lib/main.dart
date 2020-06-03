import 'package:chopperapp/data/PostApiService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

import 'homepage.dart';

void main() {  
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}: ${event.time}: ${event.message}');
  });
}

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
