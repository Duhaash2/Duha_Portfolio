import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/app_data_provider.dart';
import 'package:duha_portfolio/utils/constants.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> with TickerProviderStateMixin {
  final int _sectionCount = 4;
  final Duration _staggerDelay = const Duration(milliseconds: 200);

  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      _sectionCount,
          (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      ),
    );

    _slideAnimations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0.0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    }).toList();

    _fadeAnimations = _controllers.map((controller) {
      return CurvedAnimation(parent: controller, curve: Curves.easeIn);
    }).toList();

    _startStaggeredAnimations();
  }

  void _startStaggeredAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(_staggerDelay);
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppDataProvider>(context);
    final personalInfo = appData.personalInfo;
    final education = appData.education;
    final languages = appData.languages;
    final courses = appData.courses;

    return Stack(
      children: [
        TweenAnimationBuilder<Color?>(
          tween: ColorTween(
            begin: const Color(0xFF4D87E3),
            end: const Color(0xFF7C879C),
          ),
          duration: const Duration(seconds: 5),
          builder: (context, color, _) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color!, Theme.of(context).scaffoldBackgroundColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            );
          },
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAnimatedSection(
                context,
                index: 0,
                title: 'About Me',
                child: Text(
                  personalInfo.aboutMe,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: AppPadding.p16),

              _buildAnimatedSection(
                context,
                index: 1,
                title: 'Education',
                child: Column(
                  children: education.map((edu) {
                    return ListTile(
                      leading: const Icon(Icons.school),
                      title: Text(edu.degree),
                      subtitle: Text('${edu.institution}\n${edu.dates}'),
                      isThreeLine: true,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: AppPadding.p16),
              const SizedBox(height: AppPadding.p16),
              //
              // _buildAnimatedSection(
              //   context,
              //   index: 2,
              //   title: 'Languages',
              //   child: Column(
              //     children: languages.map((lang) {
              //       return ListTile(
              //         title: Text(lang.name),
              //         trailing: Text(lang.proficiency),
              //       );
              //     }).toList(),
              //   ),
              // ),
              // const SizedBox(height: AppPadding.p16),
              //
              // _buildAnimatedSection(
              //   context,
              //   index: 3,
              //   title: 'Courses',
              //   child: Column(
              //     children: courses.map((course) {
              //       return ListTile(
              //         leading: const Icon(Icons.book),
              //         title: Text(course.name),
              //         subtitle: Text(course.platform),
              //       );
              //     }).toList(),
              //   ),
              // ),
              const SizedBox(height: AppPadding.p24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedSection(BuildContext context, {
    required int index,
    required String title,
    required Widget child,
  }) {
    return SlideTransition(
      position: _slideAnimations[index],
      child: FadeTransition(
        opacity: _fadeAnimations[index],
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppPadding.p16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.95),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: AppPadding.p8),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
