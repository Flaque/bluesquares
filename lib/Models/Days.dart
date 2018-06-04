import 'package:json_annotation/json_annotation.dart';

part 'Days.g.dart';

@JsonSerializable()
class Day extends Object with _$DaySerializerMixin {
  Day(this.date, this.amount);

  DateTime date;
  int amount;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
