import 'package:flutter/material.dart';

class TrainSafetyScreen extends StatelessWidget {
  const TrainSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stations = [
      {'title': 'Дорожные знаки', 'description': 'Изучи знаки и пройди тест'},
      {'title': 'Безопасность дома', 'description': 'Узнай, как избежать опасностей'},
      {'title': 'Пожарная безопасность', 'description': 'Правила поведения при пожаре'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Поезд безопасности'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Пройди уроки безопасности!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: stations.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.train, color: Colors.teal, size: 40),
                      title: Text(stations[index]['title']!),
                      subtitle: Text(stations[index]['description']!),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Открытие урока: ${stations[index]['title']}')),
                        );
                      },
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