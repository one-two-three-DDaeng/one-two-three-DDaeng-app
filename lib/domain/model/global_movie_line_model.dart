class GlobalMovieLineModel {
  final int lineSeq;
  final String movieName;
  final String line;

  GlobalMovieLineModel({
    required this.lineSeq,
    required this.movieName,
    required this.line,
  });

  factory GlobalMovieLineModel.fromJson(Map<String, dynamic> json) {
    return GlobalMovieLineModel(
      lineSeq: json['line_seq'],
      movieName: json['movie_name'],
      line: json['line'],
    );
  }
}
