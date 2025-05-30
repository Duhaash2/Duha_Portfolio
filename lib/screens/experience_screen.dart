import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/app_data_provider.dart';
import 'package:duha_portfolio/utils/constants.dart';
import 'package:duha_portfolio/utils/app_themes.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = Provider.of<AppDataProvider>(context).experiences;
    final cardGradient = Theme.of(context).extension<AppThemeGradients>()?.cardGradient;

    return Stack(
      children: [
        // 🌈 Animated background gradient
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

        // 📋 Experience list with animations
        AnimationLimiter(
          child: ListView.builder(
            padding: const EdgeInsets.all(AppPadding.p8),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              final exp = experiences[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: ExperienceCard(exp: exp, gradient: cardGradient),
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

// ✅ Reusable and structured ExperienceCard with colorful icon
class ExperienceCard extends StatelessWidget {
  final dynamic exp; // Replace with actual model type if defined
  final Gradient? gradient;

  const ExperienceCard({super.key, required this.exp, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.r12)),
      elevation: Theme.of(context).cardTheme.elevation ?? 2,
      margin: Theme.of(context).cardTheme.margin ??
          const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p16),
      child: Stack(
        children: [
          // 🌈 Gradient background content
          Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(AppRadius.r12),
            ),
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exp.role,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppPadding.p4),
                Text(
                  exp.company,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: AppPadding.p4),
                Text(
                  exp.dates,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: AppPadding.p12),
                Text(
                  'Achievements/Tasks:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppPadding.p8),
                ...exp.achievements.map<Widget>((task) => Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p4, left: AppPadding.p8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('• ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onSurface)),
                      Expanded(
                        child: Text(task,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),

          // 🎨 Bottom-right colorful icon
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.workspace_premium_rounded,
                color: Colors.deepOrangeAccent,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
