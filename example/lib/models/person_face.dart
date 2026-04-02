import 'dart:convert';

class PersonFace {
  final String faceId;
  final String faceFeature;
  final String facePath;

  PersonFace({
    required this.faceId,
    required this.faceFeature,
    required this.facePath,
  });

  factory PersonFace.fromJson(Map<String, dynamic> json) {
    return PersonFace(
      faceId: json['faceId'] as String,
      faceFeature: json['faceFeature'] as String,
      facePath: json['facePath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'faceId': faceId,
      'faceFeature': faceFeature,
      'facePath': facePath,
    };
  }

  String encode() => jsonEncode(toJson());

  static PersonFace decode(String source) =>
      PersonFace.fromJson(jsonDecode(source) as Map<String, dynamic>);
}
