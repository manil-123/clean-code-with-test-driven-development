import 'package:ecom_clean_code/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: _usernameController,
                labelText: "Username",
                keyboardType: TextInputType.name,
                validator: (String? username) {
                  if (username!.isEmpty) {
                    return "User name cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: _passwordController,
                labelText: "Password",
                obsecure: true,
                validator: (String? username) {
                  if (username!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
