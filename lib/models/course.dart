class Course {
  final String name;
  final String platform;

  Course({required this.name, required this.platform});

  static List<Course> get samples => [
    Course(name: "Flutter & Dart - The Complete Guide", platform: "Udemy"),
    Course(name: "Python for Data Science and Machine Learning", platform: "Coursera"),
  ];
}

