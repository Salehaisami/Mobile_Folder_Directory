
///contains folder object

class Folder{
  //in the format of  file path: example; Desktop/work/github
  final String pathToConstruct;
  int levels = 0;

  List<String> path = [];

  Folder(this.pathToConstruct){
    path = pathToConstruct.split("/");
    levels = path.length;
  }

}