import 'package:json_annotation/json_annotation.dart';
part 'names_model.g.dart';

@JsonSerializable()
class NamesModel {
  @JsonKey(name: 'names')
  List<Names> namesList;

  NamesModel({required this.namesList});

  factory NamesModel.fromJson(Map<String, dynamic> json) =>
      _$NamesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NamesModelToJson(this);
}

@JsonSerializable()
class Names {
  int nameId;
  String name;
  String desc;
  String? gender;
  int? positive_votes;
  int? negative_votes;

  Names({
    required this.nameId,
    required this.name,
    required this.desc,
    this.gender,
    this.negative_votes,
    this.positive_votes,
  });

  factory Names.fromJson(Map<String, dynamic> json) => _$NamesFromJson(json);

  Map<String, dynamic> toJson() => _$NamesToJson(this);
}
