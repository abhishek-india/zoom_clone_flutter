import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthMethods _authMethods=AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        const Text('ZOOM CLONE',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical:40.0),
          child: Image.asset('assets/images/video chat.png'),
        ),

      CustomButton(
        text:'Sign in with Google',
        onPressed: () async{
            bool res= await _authMethods.signInWithGoogle(context);
            if(res){
              Navigator.pushNamed(context, '/home');
            }
        },
      ),
      ],
      ),
    );
  }
}