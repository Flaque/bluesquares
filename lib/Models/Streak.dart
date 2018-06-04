import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'Days.dart';

part 'Streak.g.dart';

@JsonSerializable()
class Streak extends Object with _$StreakSerializerMixin {
  Streak(this.days, this.title) {
    this.days ??= [];
    this.id = new Uuid().v4();
  }

  List<Day> days;
  String title;
  String id;

  factory Streak.fromJson(Map<String, dynamic> json) => _$StreakFromJson(json);
}
