import 'package:flutter/material.dart';

class TrainSafetyScreen extends StatefulWidget {
  const TrainSafetyScreen({super.key});

  @override
  State<TrainSafetyScreen> createState() => _TrainSafetyScreenState();
}

class _TrainSafetyScreenState extends State<TrainSafetyScreen> {
  final _contributionController = TextEditingController();

  final List<Map<String, String>> lessons = [
    {'title': 'Дорожные знаки', 'description': 'Изучение основных знаков и их значения.'},
    {'title': 'Пожарная безопасность', 'description': 'Правила поведения при пожаре.'},
    {'title': 'Безопасность дома', 'description': 'Как избежать бытовых опасностей.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поезд безопасности'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Описание проекта
            const Text(
              'О проекте',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Проект "Поезд безопасности" помогает детям изучить правила безопасности через интерактивные уроки. '
                      'Каждый урок — это "станция", где дети узнают о дорожной, пожарной и личной безопасности.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            // Список уроков
            const Text(
              'Уроки безопасности',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...lessons.map((lesson) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ListTile(
                  leading: const Icon(Icons.train, color: Colors.teal),
                  title: Text(lesson['title']!, style: const TextStyle(fontSize: 18)),
                  subtitle: Text(lesson['description']!, style: const TextStyle(fontSize: 16)),
                ),
              );
            }),
            // Форма участия
            const Text(
              'Как вы можете помочь?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _contributionController,
                      decoration: const InputDecoration(
                        labelText: 'Ваш вклад',
                        border: OutlineInputBorder(),
                        hintText: 'Например, провести урок, предоставить материалы',
                      ),
                      maxLines: 3,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_contributionController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ваше предложение отправлено!')),
                          );
                          _contributionController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Пожалуйста, опишите ваш вклад')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Отправить'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _contributionController.dispose();
    super.dispose();
  }
}