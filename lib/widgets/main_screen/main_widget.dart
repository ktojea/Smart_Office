import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_office/models/news/news_model.dart';
import 'package:smart_office/models/poll/poll_model.dart';
import 'package:smart_office/models/problem_and_solution/problem_model.dart';
import 'package:smart_office/requests/news_requests/news_service.dart';
import 'package:smart_office/requests/polls_requests/polls_service.dart';
import 'package:smart_office/requests/problems_requests/problems_requests.dart';
import 'package:smart_office/requests/profile_requests/profile_requests.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/main_screen/news/news_widget.dart';
import 'package:smart_office/widgets/main_screen/polls/poll_topic_widget.dart';
import 'package:smart_office/widgets/main_screen/stack_over_flow/problems.dart';
import 'package:smart_office/widgets/profile_screen/profile_screen.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() {
    return _MainWidgetState();
  }
}

class _MainWidgetState extends State<MainWidget> {
  void _checkActiveProblems() async {
    List<Problem> activeProblems = await ProblemsService().getActiveProblems();
    _activeProblems = activeProblems;
    setState(() {});
  }

  void _checkActivePolls() async {
    List<PollTopic> activePollTopics =
        await PollsService().getActivePollTopic();
    _activePollTopics = activePollTopics;
    setState(() {});
  }

  void _checkNews() async {
    List<News> activeNews = await NewsService().getNews();
    _activeNews = activeNews;
    setState(() {});
  }

  _openProfile(int creatorId, BuildContext context) async {
    final profie = await ProfileService().getProfile(creatorId);
    if (!context.mounted) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(profile: profie),
        ));
  }

  bool newsOnScreen = true;
  final _textFieldSearch = TextEditingController();
  List<PollTopic> _activePollTopics = [];
  List<Problem> _activeProblems = [];
  List<News> _activeNews = [];

  void _checkScreen() {
    if (newsOnScreen) {
      newsOnScreen = false;
      _checkActiveProblems();
    } else {
      newsOnScreen = true;
      _checkActivePolls();
      _checkNews();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _checkActivePolls();
    _checkNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: newsOnScreen ? bgForPollTopic : bgForProblems,
              fit: BoxFit.cover)),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Объявления',
                        style: TextStyle(
                            height: 0.8,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () async {
                          var prefs = await SharedPreferences.getInstance();
                          _openProfile(prefs.getInt('user_id')!, context);
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://apronhub.in/wp-content/uploads/2022/01/team14-scaled.jpg'),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: newsOnScreen
                            ? null
                            : () {
                                _checkScreen();
                              },
                        style: ButtonStyle(
                          minimumSize:
                              const MaterialStatePropertyAll(Size.zero),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          foregroundColor: MaterialStatePropertyAll(
                              newsOnScreen ? AppColors.purple : Colors.grey),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 5)),
                        ),
                        child: const Text(
                          'Важное',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: newsOnScreen
                            ? () {
                                _checkScreen();
                              }
                            : null,
                        style: ButtonStyle(
                          minimumSize:
                              const MaterialStatePropertyAll(Size.zero),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          foregroundColor: MaterialStatePropertyAll(
                              newsOnScreen ? Colors.grey : AppColors.cyan),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 5)),
                        ),
                        child: const Text(
                          'StackOverflow',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _textFieldSearch,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                        size: 24,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Поиск',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (!newsOnScreen) ...activeProblemsWidgets(_activeProblems, context),
          if (newsOnScreen)
            ..._activePollTopics.map((p) => PollTopicWidget(pollTopic: p)),
          if (newsOnScreen) ..._activeNews.map((n) => NewsWidget(news: n)),
        ],
      ),
    );
  }
}
