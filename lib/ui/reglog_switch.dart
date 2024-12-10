import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reglog/ui/regester_card.dart';

import '../provider.dart';
import 'login_card.dart';

class ReglogSwitch extends ConsumerStatefulWidget{
   const ReglogSwitch({super.key});


   @override
  ConsumerState createState()=>_ReglogSwitch();

}
class _ReglogSwitch extends ConsumerState<ReglogSwitch> {
 bool isLoginVisible=true;
 late final StreamController<bool> _tapStreamController;
  String boolkey = 'isLoginVisible';


 @override
 void initState() {
   super.initState();
   _tapStreamController=StreamController<bool>();
   _tapStreamController.stream.listen((event)
   {
    setState(() {
      isLoginVisible=event;
    });
   });

 }

 @override
 void dispose() {
   _tapStreamController.close();
   super.dispose();
 }



 @override
  Widget build(BuildContext coontext) {



   return Scaffold(
       appBar: AppBar(
         title: const Text('Sqlite and stream app'),
       ),
       body: Center(
         child: Padding(
           padding: const EdgeInsets.only(left: 8,right: 8),
           child: Stack(
             alignment: Alignment.center,
             children: [

               LoginCard(
                 islog: isLoginVisible,
                 onSwitch: () => _tapStreamController.add(false),

               ),
               RegesterCard(
                 islog: isLoginVisible,
                 onSwitch: () => _tapStreamController.add(true),

               ),


             ],
           ),


         ),
         // Text('or'),


         //   ],

       ),
   );

  }
}