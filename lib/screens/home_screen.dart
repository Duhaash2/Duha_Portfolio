import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/app_data_provider.dart';
import 'package:duha_portfolio/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final personalInfo = Provider.of<AppDataProvider>(context).personalInfo;

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
                  colors: [
                    color!,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            );
          },
        ),

        // Your content
        SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if (personalInfo.profileImageUrl.isNotEmpty)
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(personalInfo.profileImageUrl),
                  ),
                ),
              const SizedBox(height: AppPadding.p16),
              Center(
                child: Text(
                  personalInfo.name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppPadding.p8),
              Center(
                child: Text(
                  personalInfo.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppPadding.p24),
              Text(
                'Summary',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppPadding.p8),
              Text(
                personalInfo.summary,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: AppPadding.p24),
              // ✨ Simple Fade-in Animation Example
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                child: Center(
                  child: Text(
                    '🚀 Welcome to my portfolio!',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
