import 'package:flutter/material.dart';

class ParentsSchoolScreen extends StatelessWidget {
  const ParentsSchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {'title': 'Воспитание без стресса', 'description': 'Как находить общий язык с ребенком', 'duration': '4 недели'},
      {'title': 'Эмоциональный интеллект', 'description': 'Учимся понимать эмоции', 'duration': '2 недели'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Школа для родителей'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Добро пожаловать в "Школу для родителей"!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Полезные материалы и советы для поддержки обучения ваших детей.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.school, color: Colors.teal, size: 40),
                      title: Text(courses[index]['title']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(courses[index]['description']!),
                          Text('Длительность: ${courses[index]['duration']}'),
                        ],
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Запись на курс: ${courses[index]['title']}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Запись на курс...')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Записаться на курс'),
            ),
          ],
        ),
      ),
    );
  }
}