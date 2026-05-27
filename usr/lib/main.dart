import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeScreen(),
      },
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Jane Doe',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                'Software Engineer',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle('Experience'),
            _buildExperienceItem(
              'Senior Developer',
              'Tech Corp',
              '2020 - Present',
              'Led development of cross-platform apps using Flutter.',
            ),
            _buildExperienceItem(
              'Developer',
              'Web Solutions',
              '2018 - 2020',
              'Developed and maintained web applications.',
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Education'),
            _buildExperienceItem(
              'B.S. Computer Science',
              'State University',
              '2014 - 2018',
              '',
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Skills'),
            Wrap(
              spacing: 8,
              children: const [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('React')),
                Chip(label: Text('Node.js')),
                Chip(label: Text('SQL')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildExperienceItem(String role, String company, String date, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                company,
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(description),
          ],
        ],
      ),
    );
  }
}
