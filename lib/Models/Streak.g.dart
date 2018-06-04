// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Streak.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Streak _$StreakFromJson(Map<String, dynamic> json) => new Streak((json['days']
        as List)
    ?.map((e) => e == null ? null : new Day.fromJson(e as Map<String, dynamic>))
    ?.toList());

abstract class _$StreakSerializerMixin {
  List<Day> get days;
  Map<String, dynamic> toJson() => <String, dynamic>{'days': days};
}
