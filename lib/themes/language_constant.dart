List<Language> langList = [
  Khmer(),
  Language(),
];

class Language {
  String get appName => "NaRa";

  String get titleList => "Pet List";
  String get search => "Search Pets";

  String get developer => "Our Developers";

  String get age => "Age";
  String get color => "Color";
  String get weight => "Weight";
  String get aboutMe => "About Me";
  String get album => "Photo Album";

  String get toLightMode => "Light Mode";
  String get toDarkMode => "Dark Mode";
  String get language => "Language";
  String get english => "English";
  String get khmer => "Khmer";
  String get en => "EN";
  String get kh => "KH";
  String get theme => "Theme";
  String get fontSize => "Size";
  String get smallerSize => "Small";
  String get biggerSize => "Big";
}

class Khmer implements Language {
  String get appName => "ណារ៉ា";

  String get titleList => "បញ្ជីសត្វ";
  String get search => "ស្វែងរកសត្វ";

  String get developer => "វិស្វករ​កម្មវិធី";

  String get age => "អាយុ";
  String get color => "ពណ៌";
  String get weight => "ទម្ងន់";
  String get aboutMe => "អំពី​ខ្ញុំ";
  String get album => "អាល់ប៊ុម";

  String get toLightMode => "ពន្លឺ";
  String get toDarkMode => "ងងឹត";
  String get language => "ភាសា";
  String get english => "ភាសាអង់គ្លេស";
  String get khmer => "ភាសាខ្មែរ";
  String get en => "អង់";
  String get kh => "ខ្មែរ";
  String get theme => "ប្រភេទ";
  String get fontSize => "ទំហំ";
  String get smallerSize => "តូច";
  String get biggerSize => "ធំ";
}
