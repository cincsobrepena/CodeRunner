import 'package:flutter/material.dart';
import 'code_snippet_widget.dart';
import 'snippets.dart';

class LevelSelectScreen extends StatefulWidget {
  final String language;

  LevelSelectScreen({required this.language});

  @override
  _LevelSelectScreenState createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends State<LevelSelectScreen> {
  Set<int> completedLevels = {};

  void markLevelAsCompleted(int levelIndex) {
    setState(() {
      completedLevels.add(levelIndex);
    });
  }

  List<CodeSnippet> getSnippetsForDifficulty(
      String language, String difficulty) {
    switch (language) {
      case 'Flutter':
        switch (difficulty) {
          case 'easy':
            return flutterEasySnippets;
          case 'medium':
            return flutterMediumSnippets;
          case 'hard':
            return flutterHardSnippets;
        }
        break;
      case 'Swift':
        switch (difficulty) {
          case 'easy':
            return swiftEasySnippets;
          case 'medium':
            return swiftMediumSnippets;
          case 'hard':
            return swiftHardSnippets;
        }
        break;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.language} Level Select')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                List<CodeSnippet> snippets =
                    getSnippetsForDifficulty(widget.language, 'easy');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CodeSnippetWidget(
                      snippets: snippets,
                      title: 'Easy Level',
                      onLevelCompleted: () => markLevelAsCompleted(0),
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Easy'),
                  if (completedLevels.contains(0))
                    Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<CodeSnippet> snippets =
                    getSnippetsForDifficulty(widget.language, 'medium');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CodeSnippetWidget(
                      snippets: snippets,
                      title: 'Medium Level',
                      onLevelCompleted: () => markLevelAsCompleted(1),
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Medium'),
                  if (completedLevels.contains(1))
                    Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<CodeSnippet> snippets =
                    getSnippetsForDifficulty(widget.language, 'hard');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CodeSnippetWidget(
                      snippets: snippets,
                      title: 'Hard Level',
                      onLevelCompleted: () => markLevelAsCompleted(2),
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hard'),
                  if (completedLevels.contains(2))
                    Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
