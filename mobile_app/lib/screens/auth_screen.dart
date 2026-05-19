import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  void _toggleMode() {
    setState(() => _isLogin = !_isLogin);
  }

  void _submit() {
    final email = _emailController.text.trim();
    final pass = _passwordController.text.trim();
    // TODO: call backend auth API
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_isLogin ? 'تسجيل دخول...' : 'تسجيل حساب...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'تسجيل الدخول' : 'إنشاء حساب')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text(_isLogin ? 'دخول' : 'إنشاء حساب'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: _toggleMode,
              child: Text(_isLogin ? 'إنشاء حساب جديد' : 'لدي حساب بالفعل'),
            )
          ],
        ),
      ),
    );
  }
}
