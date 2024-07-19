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

  get attribute3 => null;
}

final List<String> dogs = [
  'dogs/dog_1.png',
  'dogs/dog_2.jpg',
  'dogs/dog_3.jpg',
];

final List<String> cats = [
  'cats/cat_1.jpg',
  'cats/cat_2.jpg',
  'cats/cat_3.jpg',
];

final List<String> bunnies = [
  'rabbits/bunny_1.jpg',
  'rabbits/bunny_2.jpg',
  'rabbits/bunny_3.jpg',
];

final List<String> birds = [
  'birds/parrot_1.jpg',
  'birds/parrot_2.jpg',
  'birds/parrot_3.jpg',
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

final List<String> dogsDate = [
  "17 June 2024",
  "22 May 2024",
  "3 August 2024",
];

final List<String> catsDate = [
  "17 June 2024",
  "17 June 2024",
  "22 May 2024",
];

final List<String> bunniesDate = [
  "17 June 2024",
  "3 August 2024",
  "17 June 2024",
];

final List<String> birdsDate = [
  "17 June 2024",
  "22 May 2024",
  "3 August 2024",
];
