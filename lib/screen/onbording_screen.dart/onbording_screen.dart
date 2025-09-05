import 'package:cookify/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            isLastPage = (index == 2);
          });
        },
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/onb1.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Find the Best Meal',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Discover a variety of delicious meals from\ntop restaurants near you.',
                ),
              ],
            ),
          ),

          // second screen
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/onb2.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Secure Online Payment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Get your favorite food delivered to your\n doorstep in no time.',
                ),
              ],
            ),
          ),

          // third screen
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/onb1.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Enjoy with Family',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Share tasty moments and enjoy meals\n together with your loved ones.',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  // Navigate to Home/Login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text("Get Started", style: TextStyle(fontSize: 18)),
              ),
            )
          : SizedBox(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _pageController.jumpToPage(2),
                    child: Text("Skip"),
                  ),
                  SmoothPageIndicator(controller: _pageController, count: 3),
                  TextButton(
                    onPressed: () => _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
    );
  }
}
