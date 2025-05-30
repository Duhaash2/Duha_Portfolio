import 'package:flutter/material.dart';
import '../models/personal_info.dart';
import '../models/education.dart';
import '../models/skill.dart';
import '../models/experience.dart';
import '../models/project.dart';
import '../models/course.dart';
import '../models/language.dart';

// This provider holds the portfolio data.
// In a real app, this might load from a JSON file or an API.
class AppDataProvider with ChangeNotifier {
  final PersonalInfo personalInfo = PersonalInfo.sample;
  final List<Education> education = Education.samples;
  final List<Skill> skills = Skill.samples;
  final List<Experience> experiences = Experience.samples;
  final List<Project> projects = Project.samples;
  final List<Course> courses = Course.samples;
  final List<Language> languages = Language.samples;

  // No need for notifyListeners() here as the data is static for this example.
  // If data were dynamic (e.g., loaded asynchronously), you would call it after loading.
}

