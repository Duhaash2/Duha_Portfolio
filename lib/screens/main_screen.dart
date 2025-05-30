import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duha_portfolio/providers/theme_provider.dart';
import 'package:duha_portfolio/utils/app_themes.dart'; // Import AppTheme enum
import 'package:duha_portfolio/widgets/common/download_button.dart';

// Import screen skeletons
import 'home_screen.dart';
import 'about_screen.dart';
import 'experience_screen.dart';
import 'projects_screen.dart';
import 'skills_screen.dart';
import 'contact_screen.dart';

// Import animation package
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Define the screens to be displayed
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const AboutScreen(),
    const ExperienceScreen(),
    const ProjectsScreen(),
    const SkillsScreen(),
    const ContactScreen(),
  ];

  // Define titles for the AppBar
  static const List<String> _appBarTitles = <String>[
    'Home',
    'About Me',
    'Experience',
    'Projects',
    'Skills',
    'Contact',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isCurrentlyDark = themeProvider.currentThemeData.brightness == Brightness.dark;

    // Determine the base theme (light version) for the dropdown
    AppTheme baseTheme = themeProvider.currentThemeEnum;
    if (baseTheme == AppTheme.blueDark) baseTheme = AppTheme.blue;
    if (baseTheme == AppTheme.greenDark) baseTheme = AppTheme.green;
    if (baseTheme == AppTheme.purpleDark) baseTheme = AppTheme.purple;

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        actions: [
          // Theme Color Picker Dropdown
          DropdownButton<AppTheme>(
            value: baseTheme, // Show the base light theme
            icon: Icon(Icons.palette, color: Theme.of(context).appBarTheme.iconTheme?.color),
            dropdownColor: Theme.of(context).colorScheme.surface,
            underline: Container(), // Remove underline
            onChanged: (AppTheme? newTheme) {
              if (newTheme != null) {
                // Apply the selected theme (light or dark based on current mode)
                themeProvider.setTheme(isCurrentlyDark ? _getDarkVariant(newTheme) : newTheme);
              }
            },
            items: const [
              // Only list the light themes for selection
              DropdownMenuItem(value: AppTheme.blue, child: Text('Blue Theme')),
              DropdownMenuItem(value: AppTheme.green, child: Text('Green Theme')),
              DropdownMenuItem(value: AppTheme.purple, child: Text('Purple Theme')),
            ],
          ),
          // Dark Mode Switch
          Switch(
            value: isCurrentlyDark,
            onChanged: (value) {
              // Toggle between light and dark variant of the current base theme
              themeProvider.setTheme(value ? _getDarkVariant(baseTheme) : baseTheme);
            },
          ),
          // CV Download Button
          const DownloadButton(),
          const SizedBox(width: 8),
        ],
      ),
      body: AnimationLimiter(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            // Use FadeTransition and SlideTransition
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0.0, 0.1), // Slide up slightly
              end: Offset.zero,
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: offsetAnimation, child: child),
            );
          },
          // Use key to ensure AnimatedSwitcher detects widget change
          child: Container(
            key: ValueKey<int>(_selectedIndex),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Experience'),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Skills'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        // Theme colors are applied via BottomNavigationBarThemeData in AppThemes
      ),
    );
  }

  // Helper to get the dark variant of a theme
  AppTheme _getDarkVariant(AppTheme theme) {
    switch (theme) {
      case AppTheme.blue:
        return AppTheme.blueDark;
      case AppTheme.green:
        return AppTheme.greenDark;
      case AppTheme.purple:
        return AppTheme.purpleDark;
      // Dark themes already return themselves
      case AppTheme.blueDark:
      case AppTheme.greenDark:
      case AppTheme.purpleDark:
        return theme;
    }
  }
}

