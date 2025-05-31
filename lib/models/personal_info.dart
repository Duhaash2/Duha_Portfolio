class PersonalInfo {
  final String name;
  final String title;
  final String summary;
  final String aboutMe;
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
    required this.aboutMe,
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
    summary: "Motivated Flutter Developer with hands-on experience designing and building scalable cross-platform mobile applications. Proficient in Dart, Firebase, and RESTful API integration with a strong grasp of clean architecture and responsive UI/UX implementation. Demonstrated ability to deliver real-time features in fast-paced, agile environments through internships and capstone projects. Eager to contribute innovative, user-focused solutions and continuously expand technical expertise.",
    email: "duha.abu.shanab.234@gmail.com",
    phone: "(+962) 795498085",
    location: "Amman, Jordan",
    linkedinUrl: "https://linkedin.com/in/duha-abu-shanab", // Ensure full URL
    githubUrl: "https://github.com/Duhaash2", // Ensure full URL
   profileImageUrl: "assets/images/duha-ph.jpg",
    aboutMe: "I'm Duha Abu Shanab, a passionate Mobile Developer based in Amman, Jordan. I specialize in building high-quality Flutter applications that transform creative UI/UX designs into fully functional, real-time mobile experiences. With internships at AppTrainers, JCS, and Cellula Technology, I've gained practical exposure to Firebase integration, chat apps, data visualization, and responsive dashboard design. I hold a degree in Business Information Technology from the Hashemite University and thrive in collaborative, agile-driven teams. I'm always eager to learn, improve, and develop apps that make a positive difference in users' lives.  ",


    // Example path
  );
}

