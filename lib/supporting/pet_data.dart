class PetData {
  final String imagePath;
  final String name;
  final String date;

  PetData({
    required this.imagePath,
    required this.name,
    required this.date, required bool isAdopted, required String description, required String location,
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
  'dog_marly.png',
  'dog_cocoa.png',
  'dog_walt.png',
];

final List<String> cats = [
  'cat_alyx.png',
  'cat_brook.png',
  'cat_marly.png',
];

final List<String> bunnies = [
  'bunny_one.jpg',
  'bunny_two.png',
  'bunny_three.png',
];

final List<String> birds = [
  'parrot_one.png',
  'parrot_two.png',
  'parrot_three.png',
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
