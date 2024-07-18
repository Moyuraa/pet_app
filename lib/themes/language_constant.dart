List<Language> langList = [
  Khmer(),
  Language(),
];

class Language {
  String get appName => "Pet App";

  String get detailScreen => "Detail Screen";

  String get settings => "Settings";
  String get general => "General";
  String get toLightMode => "To Light Mode";
  String get toDarkMode => "To Dark Mode";
  String get language => "Languages";
  String get theme => "Theme";
  String get fontSize => "Size";
  String get smallerSize => "Smaller Size";
  String get biggerSize => "Bigger Size";
}

class Khmer implements Language {
  String get appName => "";

  String get detailScreen => "ទំព័រលម្អិត";

  String get settings => "កំណត់កែប្រែ";
  String get general => "";
  String get toLightMode => "ប្តូរទៅ";
  String get toDarkMode => "ប្តូរទៅងងឹត";
  String get language => "ភាសា";
  String get theme => "";
  String get fontSize => "";
  String get smallerSize => "";
  String get biggerSize => "";
}
