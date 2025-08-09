import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulscripter/data/intro_content.dart';
import 'package:soulscripter/screens/login_screen.dart';
import 'package:soulscripter/widgets/intro_clipper.dart';
import 'package:soulscripter/widgets/gradient_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.13),
                    theme.colorScheme.secondary.withOpacity(0.10),
                    theme.colorScheme.surface,
                  ],
                ),
              ),
            ),
          ),
          // Main Content
          Column(
            children: [
              // Carousel section
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (int index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (_, i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: Image.asset(
                      pages[i].image,
                      fit: BoxFit.contain,
                      height: size.height * 0.30,
                    ),
                  ),
                ),
              ),
              // Info & Button Section
              Expanded(
                flex: 2,
                child: ClipPath(
                  clipper: IntroClipper(),
                  child: Container(
                    width: size.width,
                    color: theme.colorScheme.surface,
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 55),
                        Text(
                          pages[_currentPage].title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.primary,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          pages[_currentPage].description,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontSize: 15.5,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                        const Spacer(),
                        _buildBottomControls(theme),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Page Dots
        Row(
          children: List.generate(
            pages.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 230),
              height: 6,
              width: _currentPage == index ? 18 : 6,
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _currentPage == index
                    ? theme.colorScheme.primary
                    : theme.colorScheme.primary.withOpacity(0.14),
              ),
            ),
          ),
        ),
        _buildNextButton(theme),
      ],
    );
  }

  Widget _buildNextButton(ThemeData theme) {
    bool isLastPage = _currentPage == pages.length - 1;

    return GradientButton(
      text: isLastPage ? "Get Started" : "Next",
      onPressed: () {
        if (isLastPage) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
          );
        }
      },
      gradientColors: [theme.colorScheme.primary, theme.colorScheme.secondary],
      textStyle: GoogleFonts.lobster(
        fontSize: 18,
        color: Colors.white,
        shadows: [
          Shadow(
            blurRadius: 6,
            color: Theme.of(context).focusColor,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      icon: isLastPage
          ? const Icon(Icons.check_circle, color: Colors.white, size: 20)
          : const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
    );
  }
}
