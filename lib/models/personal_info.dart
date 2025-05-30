class PersonalInfo {
  final String name;
  final String title;
  final String summary;
  final String email;
  final String phone;
  final String location;
  final String linkedinUrl;
  final String githubUrl;
  final String profileImageUrl; // Placeholder for a profile image asset path

  PersonalInfo({
    required this.name,
    required this.title,
    required this.summary,
    required this.email,
    required this.phone,
    required this.location,
    required this.linkedinUrl,
    required this.githubUrl,
    this.profileImageUrl = "", // Add path like 'assets/images/profile.jpg'
  });

  // Placeholder data - Rewritten for a more engaging portfolio style
  static PersonalInfo get sample => PersonalInfo(
    name: "Duha Abu Shanab",
    title: " Mobile Application Developer",
    summary: "Passionate Flutter developer focused on crafting intuitive and scalable mobile experiences. With hands-on experience in Dart, Firebase, and clean architecture principles, I excel at transforming complex requirements into functional, responsive applications. I thrive on continuous learning and am dedicated to building user-centric solutions with real-time capabilities and elegant UI/UX.",
    email: "duha.abu.shanab.234@gmail.com",
    phone: "(+962) 795498085",
    location: "Amman, Jordan",
    linkedinUrl: "https://linkedin.com/in/duha-abu-shanab", // Ensure full URL
    githubUrl: "https://github.com/Duhaash2", // Ensure full URL
   profileImageUrl: "assets/images/duha-ph.jpg", // Example path
  );
}

