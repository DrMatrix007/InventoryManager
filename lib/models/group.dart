import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  Group() {
    data = {};
    name = "";
    creator = "";
    creatorName = "";
  }
  Group.from({
    required this.data,
    required this.name,
    required this.creator,
    required this.creatorName,
  });

  late String name;
  late Map<String, int> data;
  late String creatorName;
  late String creator;

  factory Group.fromJson(Map<String, dynamic> data) {
    return _$GroupFromJson(data);
  }
  Map<String, dynamic> toJson() {
    return _$GroupToJson(this);
  }
}
