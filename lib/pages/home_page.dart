import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../models/live_quiz_model.dart';
import '../models/recent_quiz_model.dart';
import '../widgets/live_quiz.dart';
import '../widgets/quiz_header.dart';
import '../widgets/recent_quiz.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const QuizHeader(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 25, left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                    "Recent Quiz",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 15),
                  // Quiz Card which has an icon, title, total questions, and difficulty level
                  ...List.generate(
                    recentQuizzes.length,
                    (index) {
                      return RecentQuiz(recentQuizModel: recentQuizzes[index]);
                    },
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Live Quiz",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 15),
                  ...List.generate(
                    liveQuizzes.length,
                    (index) {
                      return LiveQuiz(liveQuizModel: liveQuizzes[index]);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.ribbon_outline),
            label: "Awards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbox_ellipses_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
