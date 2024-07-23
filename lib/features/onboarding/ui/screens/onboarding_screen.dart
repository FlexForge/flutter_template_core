import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template_core/core/extensions/ui_extensions.dart';
import 'package:flutter_template_core/features/onboarding/ui/components/onboarding_intro.dart';
import 'package:flutter_template_core/features/onboarding/ui/components/onboarding_step_one.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routePath = 'onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageViewController;
  late int currentStep = 1;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    _pageViewController.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      currentStep = index;
    });

    _pageViewController.animateToPage(
      index - 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: SafeArea(
        child: PageView(
          controller: _pageViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OnboardingIntro(next: () => _updateCurrentPageIndex(2)),
            const OnboardingStepOne(),
          ],
        ),
      ),
    );
  }
}
