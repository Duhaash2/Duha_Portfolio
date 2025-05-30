class Language {
  final String name;
  final String proficiency;

  Language({required this.name, required this.proficiency});

  static List<Language> get samples => [
    Language(name: "Arabic", proficiency: "Full Professional Proﬁciency"), // Native or Full Professional Proficiency
    Language(name: "English", proficiency: "Professional Working Proﬁciency"),
  ];
}

