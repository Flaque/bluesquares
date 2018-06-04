// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Days.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => new Day(
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['amount'] as int);

abstract class _$DaySerializerMixin {
  DateTime get date;
  int get amount;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'date': date?.toIso8601String(), 'amount': amount};
}
