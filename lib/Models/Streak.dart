import 'package:json_annotation/json_annotation.dart';
import 'Days.dart';

part 'Streak.g.dart';

@JsonSerializable()
class Streak extends Object with _$StreakSerializerMixin {
  Streak(this.days);

  List<Day> days;

  factory Streak.fromJson(Map<String, dynamic> json) => _$StreakFromJson(json);
}
