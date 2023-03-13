import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<MySqlConnection> _getConnection() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'your_host',
      port: 3306,
      user: 'your_user',
      password: 'your_password',
      db: 'your_database',
    ));

    return conn;
  }

  Future<bool> _validateUser(String email, String password) async {
    final conn = await _getConnection();
    var result = await conn.query(
      'SELECT COUNT(*) as count FROM users WHERE email = ? AND password = ?',
      [email, password],
    );
    var count = result.first['count'] as int;
    await conn.close();

    return count > 0;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      var email = _emailController.text;
      var password = _passwordController.text;
      var isUserValid = await _validateUser(email, password);

      if (isUserValid) {
        var validLogin = 'valid_login'; // замените на ваш валидный логин
        var validPassword = 'valid_password'; // замените на ваш валидный пароль

        if (email == validLogin && password == validPassword) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NextScreen()),
          );
        } else {
          // обработка ошибки авторизации
        }
      } else {
        // User is not valid, show error message
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
