import 'package:one_two_three_ddaeng_fe/domain/model/global_count_model.dart';

class CountModel {
  final List<GlobalCountModel> data;

  CountModel({required this.data});

  factory CountModel.fromJson(Map<String, dynamic> json) {
    return CountModel(
      data: List<GlobalCountModel>.from(json['data'].map((i) => GlobalCountModel.fromJson(i))).toList(),
    );
  }
}
