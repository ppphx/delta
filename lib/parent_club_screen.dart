import 'package:flutter/material.dart';

class ParentsClubScreen extends StatefulWidget {
  const ParentsClubScreen({super.key});

  @override
  State<ParentsClubScreen> createState() => _ParentsClubScreenState();
}

class _ParentsClubScreenState extends State<ParentsClubScreen> {
  final _patrolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Родительский клуб'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Раздел 1: День родительских профессий
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'День родительских профессий',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Мероприятие, где родители делятся опытом и рассказывают о своих профессиях. '
                          'Это отличная возможность для детей узнать о различных карьерных путях и вдохновиться!',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Запись на мероприятие...')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Записаться'),
                    ),
                  ],
                ),
              ),
            ),
            // Раздел 2: Мои герои (Родители на СВО)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Мои герои (Родители на СВО)',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Раздел посвящен историям родителей, участвующих в специальной военной операции. '
                          'Мы гордимся их мужеством и хотим сохранить их подвиги для будущих поколений.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Открытие историй...')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Посмотреть истории'),
                    ),
                  ],
                ),
              ),
            ),
            // Раздел 3: Родительский патруль
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Родительский патруль',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Инициатива, созданная родителями для обеспечения безопасности и поддержки школьной среды. '
                          'Поделитесь своими идеями и предложениями!',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _patrolController,
                      decoration: const InputDecoration(
                        labelText: 'Ваше предложение',
                        border: OutlineInputBorder(),
                        hintText: 'Идеи по безопасности или поддержке',
                      ),
                      maxLines: 3,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_patrolController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ваше предложение отправлено!')),
                          );
                          _patrolController.clear();
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
    _patrolController.dispose();
    super.dispose();
  }
}