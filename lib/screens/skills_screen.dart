import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/app_data_provider.dart';
import 'package:duha_portfolio/utils/constants.dart';
import 'package:duha_portfolio/utils/app_themes.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = Provider.of<AppDataProvider>(context).skills;
    final chipGradient = Theme.of(context).extension<AppThemeGradients>()?.cardGradient;
    final chipTextColor = Theme.of(context).colorScheme.onSurface;
    final chipBackgroundColor = Theme.of(context).chipTheme.backgroundColor ??
        Theme.of(context).colorScheme.secondary.withOpacity(0.1);

    return Stack(
      children: [
        // 🌈 Animated gradient background
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

        // 🖼️ Medium-sized background image in the center (opacity 0.1)
        Center(
          child: IgnorePointer(
            ignoring: true,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/elegant/abstract_illustration_1.png',
                height: 600,
                width: 600,
                fit: BoxFit.contain,
                errorBuilder: (ctx, err, st) =>
                const Icon(Icons.image_not_supported),
              ),
            ),
          ),
        ),

        // 💡 Foreground scrollable animated skill chips
        SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  Text(
                    'Technical Skills',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppPadding.p16),

                  Wrap(
                    spacing: AppPadding.p12,
                    runSpacing: AppPadding.p12,
                    children: skills.map((skill) {
                      return Chip(
                        label: Text(skill.name),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p16,
                          vertical: AppPadding.p12,
                        ),
                        backgroundColor: chipBackgroundColor,
                        labelStyle: Theme.of(context)
                            .chipTheme
                            .labelStyle
                            ?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.3),
                          ),
                        ),
                        elevation: 1,
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: AppPadding.p24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
