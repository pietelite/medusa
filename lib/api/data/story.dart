class Story {

  final List<String> anecdotes;

  const Story({this.anecdotes});

  String get formatted {
    return anecdotes.join("\n");
  }

}