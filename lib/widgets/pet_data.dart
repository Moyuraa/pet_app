class PetData {
  final String imagePath;
  final String name;
  final String date;

  PetData({
    required this.imagePath,
    required this.name,
    required this.date,
    required bool isAdopted,
    required String description,
    required String location,
  });

  get description => null;

  get location => null;

  get isAdopted => null;

  String? get weight => null;

  String? get age => null;

  String? get color => null;

  get attribute3 => null;
}

final List<String> dogs = [
  'dog_1.png',
  'dog_2.png',
  'dog_3.png',
];

final List<String> cats = [
  'cat_1.png',
  'cat_2.png',
  'cat_3.png',
];

final List<String> bunnies = [
  'bunny_1.jpg',
  'bunny_2.png',
  'bunny_3.png',
];

final List<String> birds = [
  'parrot_1.png',
  'parrot_2.png',
  'parrot_3.png',
];

final List<String> dogsName = [
  'Marly',
  'Cocoa',
  'Walt',
];

final List<String> catsName = [
  'Alyx',
  'Brook',
  'Marly',
];

final List<String> bunniesName = [
  'Ali',
  'Brome',
  'Mary',
];

final List<String> birdsName = [
  'Alis',
  'Brik',
  'Mar',
];
