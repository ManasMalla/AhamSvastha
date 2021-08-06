import 'package:ahamsvastha/screens/landscape/onboarding/gender.dart';

enum Unit { CMS, INCHES, FEET, KGS, LBS, NO_UNIT }

extension UnitValue on Unit {
  static const Map<Unit, String> _values = {
    Unit.CMS: 'cms',
    Unit.INCHES: 'in',
    Unit.FEET: "foot",
    Unit.KGS: "kgs",
    Unit.LBS: "lbs",
    Unit.NO_UNIT: "NO_UNIT"
  };

  static Unit fromRaw(String raw) {
    return _values.entries
        .firstWhere((element) => element.value == raw,
            orElse: () => _values.entries.last)
        .key;
  }

  String get value => _values[this]!;
}

extension UnitDeclaration on String {
  static const _values = [
    Unit.CMS,
    Unit.INCHES,
    Unit.FEET,
    Unit.KGS,
    Unit.LBS,
    Unit.NO_UNIT
  ];
}

class AhamSvasthaUser {
  late String username;
  late String password;
  late Gender gender;
  DateTime? birthday;
  Unit? heightUnit;
  Unit? weightUnit;
  late int age;
  double? height;
  double? weight;

  void setGender(Gender gender) {
    this.gender = gender;
  }

  void setBirthday(DateTime birthday) {
    this.birthday = birthday;
    this.age = (DateTime.now().difference(birthday).inDays / 365).toInt();
    print("Age is ${this.age}");
  }

  void setHeight(double height, Unit unit) {
    this.height = height;
    heightUnit = unit;
  }

  void setWeight(double weight, Unit unit) {
    this.weight = weight;
    weightUnit = unit;
  }
}
