import 'package:one_two_three_ddaeng_fe/domain/model/global_movie_line_model.dart';

class MovieLineModel {
  final List<GlobalMovieLineModel> data;

  MovieLineModel({required this.data});

  factory MovieLineModel.fromJson(Map<String, dynamic> json) {
    return MovieLineModel(
      data: List<GlobalMovieLineModel>.from(json['data'].map((i) => GlobalMovieLineModel.fromJson(i))).toList(),
    );
  }
}
