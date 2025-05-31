class Project {
  final String name;
  final String description;
  final String? dates;
  final List<String> imagePaths; // List of asset paths for project images

  Project({
    required this.name,
    required this.description,
     this.dates,
    this.imagePaths = const [],
  });

  static List<Project> get samples => [
    Project(
      name: "Capstone Project: FoodTek",
      description: "Built a Talabat-style food delivery app enabling restaurant ordering and live tracking. Integrated Google Maps API for real-time driver tracking. Collaborated in a 3-member team using Agile methodology (Scrum)",
      dates: "03/2025 - Present",
      imagePaths: [
        "assets/images/foodtek/foodtek8.jpg",
        "assets/images/foodtek/foodtek9.jpg",
        "assets/images/foodtek/foodtek10.jpg",
        "assets/images/foodtek/foodtek11.jpg",
        "assets/images/foodtek/foodtek12.jpg",
        "assets/images/foodtek/foodtek13.jpg",
        "assets/images/foodtek/foodtek14.jpg",
        "assets/images/foodtek/foodtek15.jpg",
        "assets/images/foodtek/foodtek16.jpg",
        "assets/images/foodtek/foodtek17.jpg",
        "assets/images/foodtek/foodtek18.jpg",
        "assets/images/foodtek/foodtek1.jpg",
        "assets/images/foodtek/foodtek2.jpg",
        "assets/images/foodtek/foodtek3.jpg",
        "assets/images/foodtek/foodtek4.jpg",
        "assets/images/foodtek/foodtek5.jpg",
        "assets/images/foodtek/foodtek6.jpg",
        "assets/images/foodtek/foodtek7.jpg",
        "assets/images/foodtek/foodtek19.jpg",
        "assets/images/foodtek/foodtek20.jpg",
        "assets/images/foodtek/foodtek21.jpg",


      ],
    ),
    Project(
      name: "HelpGood",
      description: "Marketplace platform connecting handmade product creators with buyers. Implemented secure checkout and real-time messaging. Added product categories, search ﬁlters, and custom proﬁle options",

      imagePaths: [
        "assets/images/helpgood/img.png",
        "assets/images/helpgood/img_1.png",
        "assets/images/helpgood/img_2.png",
        "assets/images/helpgood/img_3.png",
        "assets/images/helpgood/img_4.png",
        "assets/images/helpgood/img_5.png",
        "assets/images/helpgood/img_6.png",
        "assets/images/helpgood/img_7.png",
        "assets/images/helpgood/helpgood_1.png",

      ], // Add images if available
    ),
  ];
}

