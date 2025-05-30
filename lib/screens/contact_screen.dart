import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/app_data_provider.dart';
import 'package:duha_portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // 🌐 URL launcher helper
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      print('Could not launch $urlString');
    }
  }

  // 📧 Email launcher
  Future<void> _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(emailLaunchUri)) {
      print('Could not launch email to $email');
    }
  }

  // 📞 Phone launcher
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(phoneLaunchUri)) {
      print('Could not launch phone dialer for $phoneNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    final personalInfo = Provider.of<AppDataProvider>(context).personalInfo;

    return Stack(
      children: [
        // 🌈 Animated Background Gradient
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

        // 📋 Foreground Content
        SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Get In Touch', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppPadding.p24),

              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text(personalInfo.email),
                onTap: () => _launchEmail(personalInfo.email),
              ),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                subtitle: Text(personalInfo.phone),
                onTap: () => _launchPhone(personalInfo.phone),
              ),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location'),
                subtitle: Text(personalInfo.location),
              ),
              const Divider(),

              ListTile(
                leading: const FaIcon(FontAwesomeIcons.linkedin, size: AppSizes.iconSizeMedium),
                title: const Text('LinkedIn'),
                subtitle: Text(personalInfo.linkedinUrl.replaceFirst('https://', '')),
                onTap: () => _launchUrl(personalInfo.linkedinUrl),
              ),
              const Divider(),

              ListTile(
                leading: const FaIcon(FontAwesomeIcons.github, size: AppSizes.iconSizeMedium),
                title: const Text('GitHub'),
                subtitle: Text(personalInfo.githubUrl.replaceFirst('https://', '')),
                onTap: () => _launchUrl(personalInfo.githubUrl),
              ),

              const SizedBox(height: AppPadding.p24),

            ],
          ),
        ),
      ],
    );
  }
}
