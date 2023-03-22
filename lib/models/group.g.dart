// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group()
  ..name = json['name'] as String
  ..data = Map<String, int>.from(json['data'] as Map)
  ..creatorName = json['creatorName'] as String
  ..creator = json['creator'] as String;

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
      'creatorName': instance.creatorName,
      'creator': instance.creator,
    };
