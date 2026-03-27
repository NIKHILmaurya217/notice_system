import 'package:flutter/material.dart';

void main() {
  runApp(const NoticeBoardApp());
}

class NoticeBoardApp extends StatelessWidget {
  const NoticeBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Notice System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoticeHomePage(),
    );
  }
}

class NoticeHomePage extends StatefulWidget {
  const NoticeHomePage({super.key});

  @override
  State<NoticeHomePage> createState() => _NoticeHomePageState();
}

class _NoticeHomePageState extends State<NoticeHomePage> {
  final TextEditingController _noticeController = TextEditingController();
  final List<String> _notices = [
    "Welcome to the Peer-to-Peer Learning Class!",
    "Flutter Workshop scheduled for tomorrow at 10 AM.",
    "Please submit your assignments by Friday.",
  ];

  void _addNotice() {
    if (_noticeController.text.trim().isNotEmpty) {
      setState(() {
        _notices.insert(0, _noticeController.text.trim());
        _noticeController.clear();
      });
    }
  }

  @override
  void dispose() {
    _noticeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College Notice System'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image widget showing a placeholder logo
            Center(
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.school,
                  size: 100,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Input and Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noticeController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a new notice...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addNotice,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Post Notice'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            const Text(
              'Recent Notices:',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            
            // List of notices
            Expanded(
              child: ListView.builder(
                itemCount: _notices.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.announcement, color: Colors.white),
                      ),
                      title: Text(
                        _notices[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}