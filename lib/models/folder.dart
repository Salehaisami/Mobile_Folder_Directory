
///contains folder object

class Folder{
  //in the format of  file path: example; Desktop/work/github
  final String pathToConstruct;

  //depth of path
  final int levels;

  //split path (list of directories/documents)
  final List<String> path;

  Folder(this.pathToConstruct) :
        levels = pathToConstruct.split("/").length,
        path = pathToConstruct.split("/");

}