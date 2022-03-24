import 'package:flutter/material.dart';

import '../models/folder.dart';

class ExpandingDirTile extends StatefulWidget {
  const ExpandingDirTile({Key? key, required this.folder}) : super(key: key);

  final Folder folder;

  @override
  State<ExpandingDirTile> createState() => _ExpandingDirTileState();
}

class _ExpandingDirTileState extends State<ExpandingDirTile> {


  String directoryTreeIndicator(depth){
    return "${"\t"* (depth)}|\n""${"\t"* (depth)}|"+" _ _ _"* (depth);
  }
  List<ExpansionTile> folderToTile(List<String> path){
    int treeDepth = path.length;

    if (treeDepth <= 1) return [];

    ExpansionTile childTile = ExpansionTile(
        title: Text(path.last),
      subtitle: const Text("Levels to be expanded: 0"),
      leading: Text(directoryTreeIndicator(treeDepth-1))
    );

    //traverse from the last folder in the directory or path and build the tree bottom-up
    for(int i = treeDepth-2; i >= 1; i--){
      childTile = ExpansionTile(
          title: Text(path[i]),
          subtitle: Text("Levels to be expanded: $i"),
        leading: Text(directoryTreeIndicator(i)),
        children: [
            childTile
          ],
      );
    }
    return [childTile];
  }

  @override
  Widget build(BuildContext context) {
    List<String> path = widget.folder.path;
    String name = path.isNotEmpty ? widget.folder.path[0] : "Untitled";
    int levels = widget.folder.levels-1;
    List<ExpansionTile> childTile = folderToTile(path);
    return Flexible(
      child: ExpansionTile(
        title: Text(name),
        subtitle: Text("Levels to be expanded: $levels"),
        children: childTile.isNotEmpty ? childTile : [],
      ),
    );
  }
}
