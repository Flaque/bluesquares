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

  bool _sameDay(DateTime a, DateTime b) {
    return (a.day == b.day && a.month == b.month && a.year == b.year);
  }

  void increment() {
    int index =
        days.indexWhere((day) => _sameDay(new DateTime.now(), day.date));
    if (index != -1) {
      days[index].amount++;
    } else {
      days.add(new Day(new DateTime.now(), 1));
    }
  }

  void decrement() {
    int index =
        days.indexWhere((day) => _sameDay(new DateTime.now(), day.date));
    if (index != -1) {
      days[index].amount--;
    }
  }

  List<Month> generateMonths() {
    List<Month> months = [new Month(new DateTime.now().month)];
    if (days.isEmpty) {
      return months;
    }
    days.sort((Day a, Day b) => b.date.compareTo(a.date));

    DateTime oldest = days.last.date;
    int range = new DateTime.now().difference(oldest).inDays;

    for (int i = 0; i <= range; i++) {
      DateTime currentDate = new DateTime.now().subtract(new Duration(days: i));
      if (currentDate.month !=
          new DateTime.now().subtract(new Duration(days: i - 1)).month) {
        months.add(new Month(currentDate.month));
      }

      bool foundDay = false;

      eachDay:
      for (Day day in days) {
        if (_sameDay(currentDate, day.date)) {
          months[months.length - 1].days.insert(0, day);
          foundDay = true;
          break eachDay;
        }
      }
      if (!foundDay) {
        months[months.length - 1].days.insert(0, new Day(currentDate, 0));
      }
    }

    return months;
  }

  factory Streak.fromJson(Map<String, dynamic> json) => _$StreakFromJson(json);
}

class Month {
  static List<String> MONTHS = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  Month(int month) {
    if (month >= 1 && month <= MONTHS.length) this.name = MONTHS[month - 1];
  }

  String name;
  List<Day> days = [];
}
