import 'package:flutter/material.dart';
import 'package:laza_ecom/core/constants/app_constants.dart';
import 'package:laza_ecom/core/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of onboarding pages data
  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': 'Discover Your Next\nFavorite Thing.',
      'description': 'Welcome! Explore millions of products across every category imaginable, right at your fingertips. From fashion to electronics, we"ve got  something for everyone.',
      'image': 'assets/images/onboarding_2.png',
      'buttonText': 'Next',
    },
    {
      'title': 'Unlock exclusive\noffers and discounts',
      'description': 'Get access to limited-time deals and special promotions available only to our valued customers.',
      'image': 'assets/images/onboarding_3.png',
      'buttonText': 'Next',
    },
    {
      'title': 'Shop with\nConfidence.',
      'description': 'Your security is our priority. Enjoy hassle-free and secure payment options, knowing your transactions are always protected. ',
      'image': 'assets/images/onboarding_4.png',
      'buttonText': 'Log In',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Removed skip button
            const SizedBox(height: 16),
            
            // Page content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    title: _onboardingData[index]['title'],
                    description: _onboardingData[index]['description'],
                    image: _onboardingData[index]['image'],
                    buttonText: _onboardingData[index]['buttonText'],
                  );
                },
              ),
            ),
            
            // Simple page indicator and navigation button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Simple dot indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppTheme.primaryColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Simple navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous button - with fixed width and content constraints
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: _currentPage > 0
                          ? TextButton(
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Previous',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold, // Fully bold
                                ),
                              ),
                            )
                          : const SizedBox.shrink(), // Empty space for first page
                      ),
                      
                      // Next/Login button - always visible
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage == _onboardingData.length - 1) {
                              Navigator.pushReplacementNamed(context, AppRoutes.login);
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            _onboardingData[_currentPage]['buttonText'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

// Widget for each onboarding page
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final String buttonText;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    this.image,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.5,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 0, left: 32, right: 32, bottom: 16),
                width: MediaQuery.of(context).size.width * 0.85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    image ?? 'assets/images/onboarding_2.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback if image fails to load
                      return Container(
                        color: Colors.grey.shade100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_not_supported,
                                size: 80,
                                color: AppTheme.primaryColor,
                              ),
                              const SizedBox(height: 16),
                              Text("Image not found",
                                  style: TextStyle(color: AppTheme.darkGrayColor))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 24, right: 24), // Reduced top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          height: 1.2,
                          color: AppTheme.primaryColor,
                          fontSize: 28, // Increased title size
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.darkGrayColor,
                          height: 1.5,
                          fontSize: 18, // Increased description size
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}