class Experience {
  final String company;
  final String role;
  final String? dates;
  final List<String> achievements;

  Experience({
    required this.company,
    required this.role,
     this.dates,
    required this.achievements,
  });

  static List<Experience> get samples => [
    Experience(
      company: "AppTrainers",
      role: "Mobile Developer Intern",
      dates: "", // Note: CV says 12/2024, might be a typo for 12/2023?
      achievements: [
        "Developed a Flutter-based WhatsApp-style chat interface with real-time messaging",
        "Integrated Firebase Authentication and Firestore for dynamic data sync",
      ],
    ),
    Experience(
      company: "Cellula Technology",
      role: "Python Developer Intern",
      dates: "", // Note: CV dates seem future/incorrect?
      achievements: [
        "Built interactive data visualizations using Matplotlib and Seaborn",
        "Designed a responsive web dashboard to present KPIs to internal teams",
      ],
    ),
    Experience(
      company: "Jordan computer society (JCS)",
      role: "Mobile Application Developer Intern",
      dates: "",
      achievements: [
        "Developed a mobile app using Flutter & Firebase Authentication.",
        "Implemented user proﬁle management and conﬁgurable UI settings.",
      ],
    ),
  ];
}

