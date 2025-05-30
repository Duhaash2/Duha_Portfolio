class Education {
  final String institution;
  final String degree;
  final String dates;

  Education({
    required this.institution,
    required this.degree,
    required this.dates,
  });

  static List<Education> get samples => [
    Education(
      institution: "Hashemite University",
      degree: "Business Information Technology",
      dates: "10/2020 - 06/2024",
    ),
  ];
}

