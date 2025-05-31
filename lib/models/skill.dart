class Skill {
  final String name;
  // Add category if needed, e.g., "Language", "Framework", "Tool"
  // final String category;

  Skill({required this.name});

  static List<Skill> get samples => [
    Skill(name: "Dart"),
    Skill(name: "Flutter"),
    Skill(name: "Firebase"),
    Skill(name: "API"),
    Skill(name: "state management"), // Consider consistent casing
    Skill(name: "clean architecture"),
    Skill(name: "Git & GitHub"),
    Skill(name: "Design patterns"),
    Skill(name: "Google Maps"),
    Skill(name: "Agile Methodology"),
    Skill(name: "SQLITE"), // SQLite
    Skill(name: "Android Studio"),
    Skill(name: "python"), // Python
    Skill(name: "general network"), // General Networking
    // Add skills from Python internship if relevant to portfolio
    // Skill(name: "Matplotlib"),
    // Skill(name: "Seaborn"),
  ];
}

