// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Streak.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Streak _$StreakFromJson(Map<String, dynamic> json) => new Streak(
    (json['days'] as List)
        ?.map((e) =>
            e == null ? null : new Day.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['title'] as String)
  ..id = json['id'] as String;

abstract class _$StreakSerializerMixin {
  List<Day> get days;
  String get title;
  String get id;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'days': days, 'title': title, 'id': id};
}
