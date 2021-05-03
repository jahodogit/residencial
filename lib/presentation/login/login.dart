import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:residencial/presentation/providers/auth_provider.dart';

import '../../styles.dart';

class LoginPage extends StatelessWidget {
  String email;
  String pass;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 300,
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.local_activity_outlined),
              Text("Company name"),
              TextField(
                decoration: kInputDecorationLogin,
                onChanged: (value) => email = value,
              ),
              TextField(
                decoration: kInputDecorationPass,
                obscureText: true,
                onChanged: (value) => pass = value,
              ),
              TextButton(
                  onPressed: () async {
                    await authProvider.signin(email, pass);
                    if (authProvider.isLogedIn)
                      Navigator.of(context).pushReplacementNamed("/home");
                  },
                  child: Text("Sign in"))
            ],
          ),
        ),
      ),
    );
  }
}
