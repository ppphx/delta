import 'package:flutter/material.dart';

class MuseumScreen extends StatefulWidget {
  const MuseumScreen({super.key});

  @override
  State<MuseumScreen> createState() => _MuseumScreenState();
}

class _MuseumScreenState extends State<MuseumScreen> {
  final _suggestionController = TextEditingController();

  final List<String> tasks = [
    'Сохранение истории лицея через экспонаты.',
    'Организация выставок для учеников и родителей.',
    'Создание интерактивных экскурсий.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наш музей'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Задачи музея
            const Text(
              'Задачи музея',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...tasks.map((task) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ListTile(
                  leading: const Icon(Icons.museum, color: Colors.teal),
                  title: Text(task, style: const TextStyle(fontSize: 16)),
                ),
              );
            }),
            const SizedBox(height: 16),
            // Форма предложений
            const Text(
              'Ваши предложения',
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
                      controller: _suggestionController,
                      decoration: const InputDecoration(
                        labelText: 'Ваше предложение',
                        border: OutlineInputBorder(),
                        hintText: 'Идеи для развития музея',
                      ),
                      maxLines: 3,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_suggestionController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ваше предложение отправлено!')),
                          );
                          _suggestionController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Пожалуйста, введите предложение')),
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
    _suggestionController.dispose();
    super.dispose();
  }
}