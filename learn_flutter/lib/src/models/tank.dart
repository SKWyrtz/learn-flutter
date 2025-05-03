import 'package:learn_flutter/src/models/guess_option.dart';

class Tank implements GuessOption {
  @override
  final String id;
  @override
  final String name;
  @override
  final String imagePath;

  Tank(this.id, this.name, this.imagePath);
}
//   final String name;
//   final String imagePath;
//   final String description;
//   final String country;
//   final int year;
//   final int armor;
//   final int speed;
//   final int firepower;

//   Tank({
//     required this.name,
//     required this.imagePath,
//     required this.description,
//     required this.country,
//     required this.year,
//     required this.armor,
//     required this.speed,
//     required this.firepower,
//   });

//   @override
//   String toString() {
//     return 'Tank{name: $name, imagePath: $imagePath, description: $description, country: $country, year: $year, armor: $armor, speed: $speed, firepower: $firepower}';
//   }
// }
