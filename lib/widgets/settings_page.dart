import 'package:flutter/material.dart';
import '../resources/auth_methods.dart';
import 'custom_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/log out.png'),
          CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
          const Text('App developed by Abhishek Agrawal'),
          
        ],
      );
    
  }
}

