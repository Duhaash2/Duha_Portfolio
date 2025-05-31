import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/app_data_provider.dart';
import 'package:duha_portfolio/utils/constants.dart';
import 'package:duha_portfolio/utils/app_themes.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = Provider.of<AppDataProvider>(context).projects;
    final cardGradient =
        Theme.of(context).extension<AppThemeGradients>()?.cardGradient;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Stack(
      children: [
        // 🌈 Animated background
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

        // 📋 Animated project list
        AnimationLimiter(
          child: ListView.builder(
            padding: const EdgeInsets.all(AppPadding.p8),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.r12)),
                      elevation: Theme.of(context).cardTheme.elevation ?? 2,
                      margin: Theme.of(context).cardTheme.margin ??
                          const EdgeInsets.symmetric(
                              vertical: AppPadding.p8,
                              horizontal: AppPadding.p16),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: cardGradient,
                          borderRadius: BorderRadius.circular(AppRadius.r12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                              ),
                              const SizedBox(height: AppPadding.p4),

                              const SizedBox(height: AppPadding.p12),
                              Text(
                                project.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: textColor),
                              ),
                              const SizedBox(height: AppPadding.p20),

                              // 🖼️ Scrollable project images
                              if (project.imagePaths.isNotEmpty)
                                SizedBox(
                                  height: 150,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: project.imagePaths.length,
                                    itemBuilder: (ctx, imgIndex) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: AppPadding.p8),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppRadius.r8),
                                          child: Image.asset(
                                            project.imagePaths[imgIndex],
                                            fit: BoxFit.fill,
                                            width: 100,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              print(
                                                  "Error loading asset: ${project.imagePaths[imgIndex]}, $error");
                                              return Container(
                                                width: 150,
                                                color: Colors.grey.shade300,
                                                child: const Center(
                                                  child: Icon(Icons.error,
                                                      color:
                                                          AppColors.errorColor),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
