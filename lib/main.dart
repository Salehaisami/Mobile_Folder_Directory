import 'package:flutter/material.dart';
import 'package:mobile/ExpandingDirTile.dart';

import 'folder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(folders: const ["folder1/document1","folder2/folder3/document2","document3"]),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> folders;
  List<ExpandingDirTile> tiles = [];

  MyHomePage({Key? key, required this.folders}) : super(key: key){
    for (var folderPath in folders) {
      tiles.add(ExpandingDirTile(folder: Folder(folderPath)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Folder Directory"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: tiles,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
