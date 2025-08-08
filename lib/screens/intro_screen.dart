import 'package:soulscripter/data/intro_content.dart';
import 'package:soulscripter/screens/quote_composer.dart';
import 'package:soulscripter/widgets/intro_clipper.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative Background, can swap gradients/colors here
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.colorScheme.primary.withOpacity(0.13),
                      theme.colorScheme.secondary.withOpacity(0.10),
                      theme.colorScheme.background,
                    ],
                  ),
                ),
              ),
            ),

            // Main content
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.06,
                    bottom: 12.0,
                  ),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset('assets/images/logo.png', width: 70),
                  ),
                ),

                // The carousel image area
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (int index) =>
                        setState(() => _currentPage = index),
                    itemBuilder: (_, i) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(horizontal: 38.0),
                        child: Image.asset(
                          pages[i].image,
                          fit: BoxFit.contain,
                          height: size.height * 0.30,
                        ),
                      );
                    },
                  ),
                ),

                // The info panel with clipped background
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
      ),
    );
  }

  Widget _buildBottomControls(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Page dots with nice animation
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

    return GestureDetector(
      onTap: () {
        if (isLastPage) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const QuoteComposer()),
          );
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.12),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isLastPage ? "Get Started" : "Next",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
            if (!isLastPage) ...[
              const SizedBox(width: 9),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ],
            if (isLastPage) ...[
              const SizedBox(width: 6),
              const Icon(Icons.check_circle, color: Colors.white, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
