import 'package:flutter/material.dart';

class ParentsSchoolScreen extends StatefulWidget {
  const ParentsSchoolScreen({super.key});

  @override
  State<ParentsSchoolScreen> createState() => _ParentsSchoolScreenState();
}

class _ParentsSchoolScreenState extends State<ParentsSchoolScreen> {
  final _topicController = TextEditingController();
  final _specialistController = TextEditingController();
  final _experienceController = TextEditingController();

  final List<Map<String, String>> events = [
    {
      'title': 'Как мотивировать ребенка к учебе',
      'date': '20 мая 2025, 18:00',
      'description': 'Практические советы от психолога.'
    },
    {
      'title': 'Цифровая безопасность',
      'date': '25 мая 2025, 19:00',
      'description': 'Как защитить детей в интернете.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Школа для родителей'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Секция мероприятий
            const Text(
              'Ближайшие мероприятия',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...events.map((event) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.event, color: Colors.teal),
                        title: Text(
                          event['title']!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Дата: ${event['date']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          event['description']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Вы записаны на "${event['title']}"')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Записаться'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 16),
            // Секция предложения тем и специалистов
            const Text(
              'Предложить тему или специалиста',
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
                      controller: _topicController,
                      decoration: const InputDecoration(
                        labelText: 'Тема',
                        border: OutlineInputBorder(),
                        hintText: 'Например, "Эмоциональный интеллект"',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _specialistController,
                      decoration: const InputDecoration(
                        labelText: 'Специалист',
                        border: OutlineInputBorder(),
                        hintText: 'Имя или профессия (например, психолог Иванова)',
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_topicController.text.isNotEmpty || _specialistController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ваше предложение отправлено!')),
                          );
                          _topicController.clear();
                          _specialistController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Заполните хотя бы одно поле')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Отправить предложение'),
                    ),
                  ],
                ),
              ),
            ),
            // Секция для выступления с опытом
            const Text(
              'Поделиться своим опытом',
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
                      controller: _experienceController,
                      decoration: const InputDecoration(
                        labelText: 'Ваш опыт',
                        border: OutlineInputBorder(),
                        hintText: 'Опишите, о чем хотите рассказать',
                      ),
                      maxLines: 3,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_experienceController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ваше предложение отправлено!')),
                          );
                          _experienceController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Пожалуйста, опишите ваш опыт')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Отправить заявку'),
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
    _topicController.dispose();
    _specialistController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}