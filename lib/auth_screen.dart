import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'forgot_password_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _parentNameController = TextEditingController();
  final _classController = TextEditingController();
  bool isLogin = true;
  bool _obscurePassword = true; // Управление видимостью пароля

  // Валидация email
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _submit() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String name = _nameController.text.trim();
    String parentName = _parentNameController.text.trim();
    String studentClass = _classController.text.trim();

    // Проверка полей
    if (isLogin) {
      if (email.isNotEmpty && isValidEmail(email) && password.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              userData: {
                'name': name.isNotEmpty ? name : 'Не указано',
                'parentName': parentName.isNotEmpty ? parentName : 'Не указано',
                'studentClass': studentClass.isNotEmpty ? studentClass : 'Не указано',
              },
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пожалуйста, введите корректный email и пароль')),
        );
      }
    } else {
      if (email.isNotEmpty &&
          isValidEmail(email) &&
          password.length >= 6 &&
          name.isNotEmpty &&
          parentName.isNotEmpty &&
          studentClass.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              userData: {
                'name': name,
                'parentName': parentName,
                'studentClass': studentClass,
              },
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пожалуйста, заполните все поля корректно (пароль минимум 6 символов)')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Вход' : 'Регистрация'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Поля для регистрации
            if (!isLogin) ...[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'ФИО',
                  border: OutlineInputBorder(),
                  hintText: 'Иванов Иван Иванович',
                ),
                textInputAction: TextInputAction.next,
                enabled: true,
                keyboardType: TextInputType.text,
                onChanged: (value) => print('ФИО: $value'), // Для отладки
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _parentNameController,
                decoration: const InputDecoration(
                  labelText: 'ФИО родителя',
                  border: OutlineInputBorder(),
                  hintText: 'Иванова Анна Петровна',
                ),
                textInputAction: TextInputAction.next,
                enabled: true,
                keyboardType: TextInputType.text,
                onChanged: (value) => print('ФИО родителя: $value'), // Для отладки
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _classController,
                decoration: const InputDecoration(
                  labelText: 'Класс учащегося',
                  border: OutlineInputBorder(),
                  hintText: 'Например, 5А или 10Б',
                ),
                textInputAction: TextInputAction.done,
                enabled: true,
                keyboardType: TextInputType.text,
                onChanged: (value) => print('Класс: $value'), // Для отладки
              ),
              const SizedBox(height: 16),
            ],
            // Общие поля
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Электронная почта',
                border: OutlineInputBorder(),
                hintText: 'example@domain.com',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              enabled: true,
              onChanged: (value) => print('Email: $value'), // Для отладки
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Пароль',
                border: const OutlineInputBorder(),
                hintText: 'Минимум 6 символов',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
              textInputAction: isLogin ? TextInputAction.done : TextInputAction.next,
              enabled: true,
              onChanged: (value) => print('Пароль: $value'), // Для отладки
            ),
            const SizedBox(height: 16),
            // Кнопка "Не помню пароль"
            if (isLogin)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const Text('Не помню пароль'),
                ),
              ),
            const SizedBox(height: 8),
            // Кнопка отправки
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text(isLogin ? 'Войти' : 'Зарегистрироваться'),
            ),
            const SizedBox(height: 16),
            // Переключение режимов
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                  _nameController.clear();
                  _parentNameController.clear();
                  _classController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                });
              },
              child: Text(
                isLogin ? 'Нет аккаунта? Зарегистрируйтесь' : 'Уже есть аккаунт? Войдите',
                style: const TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _parentNameController.dispose();
    _classController.dispose();
    super.dispose();
  }
}