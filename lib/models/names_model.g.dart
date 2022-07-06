// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'names_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamesModel _$NamesModelFromJson(Map<String, dynamic> json) {
  return NamesModel(
    namesList: (json['names'] as List<dynamic>)
        .map((e) => Names.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NamesModelToJson(NamesModel instance) =>
    <String, dynamic>{
      'names': instance.namesList,
    };

Names _$NamesFromJson(Map<String, dynamic> json) {
  return Names(
    nameId: json['nameId'] as int,
    name: json['name'] as String,
    desc: json['desc'] as String,
    gender: json['gender'] as String?,
    negative_votes: json['negative_votes'] as int?,
    positive_votes: json['positive_votes'] as int?,
  );
}

Map<String, dynamic> _$NamesToJson(Names instance) => <String, dynamic>{
      'nameId': instance.nameId,
      'name': instance.name,
      'desc': instance.desc,
      'gender': instance.gender,
      'positive_votes': instance.positive_votes,
      'negative_votes': instance.negative_votes,
    };
