class GlobalCountModel {
  final int count;

  GlobalCountModel({
    required this.count,
  });

  factory GlobalCountModel.fromJson(Map<String, dynamic> json) {
    return GlobalCountModel(count: json['count']);
  }
}
