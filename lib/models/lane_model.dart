import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LaneModel {
  final String id;
  final String name;
  final String avatar;
  final String banner;
  final List<String> members;
  LaneModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.banner,
    required this.members,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'avatar': avatar,
      'banner': banner,
      'members': members,
    };
  }

  factory LaneModel.fromMap(Map<String, dynamic> map) {
    return LaneModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      banner: map['banner'] ?? '',
      members: List<String>.from(map['members']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LaneModel.fromJson(String source) =>
      LaneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
