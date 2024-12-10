import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reglog/provider.dart';

import 'main_screen.dart';

class LoginCard extends ConsumerStatefulWidget{
  const LoginCard({super.key, required  this.islog,required this.onSwitch,});
  final islog;
  final VoidCallback onSwitch;

  @override
  ConsumerState createState() =>_LoginCardState();

}
class _LoginCardState extends    ConsumerState<LoginCard> {

 String boolkey = 'isLoginVisible';

  void savetopref(bool isLoginVisible){
    final logpref = ref.read(sharedPrefProvider);
    logpref.setBool(boolkey, isLoginVisible);
  }



  @override
  Widget build(BuildContext context) {
    bool isLoginVisible=widget.islog;



    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      left: isLoginVisible ? screenWidth * 0.1 : screenWidth * 0.6,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isLoginVisible ? 1.0 : 0.4, // Fade effect
        child: Card(
          elevation: isLoginVisible ? 10 : 4,
          color: Colors.green[100],
          child: SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                      decoration:
                      InputDecoration(labelText: "Email")),
                  const TextField(
                      decoration:
                      InputDecoration(labelText: "Password")),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context){
                                return const MainScreen();
                              }
                          )
                      );
                    },
                    child: const Text("Login"),
                  ),
                  TextButton(
                    onPressed: widget.onSwitch,
                    child: const Text("Switch to Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
/*
 bool isUser(String password){

   final repository = ref.read(repositoryProvider.notifier);
    repository.findAllUsers();

    String savedPassword=repository.



 }
 */

}