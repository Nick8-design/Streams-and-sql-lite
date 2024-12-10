import 'dart:async';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:reglog/business/custom_dropdown.dart';
import 'package:reglog/data/models/user_models.dart';
import 'package:reglog/provider.dart';

import '../business/email_validation.dart';
import '../business/password.dart';
import 'login_card.dart';
import 'main_screen.dart';

class RegesterCard extends ConsumerStatefulWidget{
  const RegesterCard({super.key, required  this.islog,required this.onSwitch});
  final islog;
  final VoidCallback onSwitch;


  @override
  ConsumerState createState() =>_RegesterCardState();

}
class _RegesterCardState extends    ConsumerState<RegesterCard> {
 DateTime? selectedDate;
 final DateTime _firstDate=DateTime(DateTime.now().year-40);
 final DateTime _lastDate=DateTime.now();
 List<String> genders=['Male','Female','Other'];
 late TextEditingController genderTextController;
 late TextEditingController imglinkTextController;
 late TextEditingController nameTextController;
 late TextEditingController idTextController;
 late TextEditingController contactTextController;
 late TextEditingController emailtc;
 late TextEditingController passTextController;
 bool showpass=false;
 String? errorMessage;
 List<UserModels> user=[];


  String boolkey = 'isLoginVisible';
  bool linktyped=false;


 @override
 void initState() {
   super.initState();


   genderTextController = TextEditingController(text: 'Male');
   imglinkTextController = TextEditingController(text: '');
   passTextController = TextEditingController(text: '');
   emailtc = TextEditingController(text: '');
   contactTextController = TextEditingController();
   idTextController = TextEditingController();
   nameTextController = TextEditingController(text: '');

 }

 @override
 void dispose() {
   genderTextController.dispose();
   imglinkTextController.dispose();
   passTextController.dispose();
   emailtc.dispose();
   contactTextController.dispose();
   idTextController.dispose();
   nameTextController.dispose();





   super.dispose();
 }

String formatedDate(DateTime? dateTime){
  if(dateTime==null){
    return 'Select Date of Birth';
  }
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(dateTime);
}

void _selecteDate(BuildContext context)async{
  final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate?? DateTime.now() ,
      firstDate: _firstDate,
      lastDate: _lastDate,
  );

  if(picked!=null && picked!=selectedDate) {
    setState(() {
      selectedDate = picked;
    });

  }
}


  void savetopref(bool isLoginVisible){
  final logpref = ref.read(sharedPrefProvider);
  logpref.setBool(boolkey, isLoginVisible);
}

  @override
  Widget build(BuildContext context) {
    bool isLoginVisible=widget.islog;


    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String sex;
    if(genderTextController.text=='Female'||genderTextController.text=='female'){
      sex='Female';
    }else if(genderTextController.text=='Male'||genderTextController.text=='male'){
      sex='Male';
    }else{
      sex='Other';
    }

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      left: isLoginVisible ? screenWidth * 0.6 : screenWidth * 0.1,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isLoginVisible ? 0.2 : 1.0, // Fade effect
        child: Card(
          elevation: isLoginVisible ? 4 : 10,
          color: Colors.blue[100],
          child: SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
               Row(
                  children: [
                  const Text('Name'),
              const SizedBox(width: 8,),
              Expanded(
                child: TextField(
                      decoration:
                      const InputDecoration(labelText: "Name")
                , keyboardType: TextInputType.text,
                  controller: nameTextController,

                ),

              )]),


               Row(
                  children: [
                  const Text('Photo'),
              const SizedBox(width: 8,),
              Expanded(
                child: ListTile(
                    title:  TextField(

                        decoration:
                        const InputDecoration(labelText: "Link to your image"),
                      controller: imglinkTextController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      onChanged: (value){
                          setState(() {
                            linktyped=true;
                          });
                      },

                    ),

                    trailing:Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                       //   color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      child: topImage(context,imglinkTextController.text),

                    ),

                ),  
                  
              ),
  ]
              ),


               Row(
                  children: [
                  const Text('Id Number'),
              const SizedBox(width: 8,),
              Expanded(
                child: TextField(
                      decoration:
                      const InputDecoration(labelText: "Id"),
                      keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly, // Only allows digits
                  ],
                  controller: idTextController,
                  ),
              )]
              ),

                   Row(
                      children: [
                        const Text('Email'),
                         const SizedBox(width: 8,),
                        Expanded(
                          child:
                   TextField(
                      decoration:
                       InputDecoration(
                          labelText: "Email",
                        errorText: errorMessage,
                      ),
                      controller: emailtc,
                      keyboardType: TextInputType.emailAddress,
                     onChanged: (value){
                       setState(() {
                         if (value.isEmpty) {
                           errorMessage = null;
                         } else if (!isValidEmail(value)) {
                           errorMessage = "Please enter a valid email";
                         } else {
                           errorMessage = null; // Valid email
                         }
                       });
                     },


                  ),
                        )
                ]),

               Row(
                  children: [
                  const Text('Contact'),
              const SizedBox(width: 8,),
              Expanded(
                child:  TextField(
                      decoration:
                      const InputDecoration(labelText: "Contact "),
                    keyboardType: TextInputType.phone,
                  controller: contactTextController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly, // Only allows digits
                    ],

                  ),
              )
                    ]
              ),


                  Row(
                    children: <Widget>[
                      const Text('Gender'),
                      const SizedBox(width: 8,),
                      Expanded(
                       child:  TextField(
                           decoration: const InputDecoration(
                              border: InputBorder.none,
                          ),
                         autofocus: false,
                         controller: genderTextController,
                       ),
                      ),

                      PopupMenuButton(
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                          onSelected: (String value){
                              genderTextController.text = value;
                          },
                          itemBuilder: (BuildContext context){
                            return genders
                                .map<CustomDropdownMenuItem<String>>((String value){
                              return CustomDropdownMenuItem<String>(
                                  value: value,
                                  text: value
                              );
                            }).toList();

                          }
                      ),

                    ],
                  ),




                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Text("Date of Birth "),
                    const SizedBox(width: 8,),
                    TextButton(
                      onPressed: ()=>_selecteDate(context),
                      child: Text(formatedDate(selectedDate)),
                    ),

                  ],
                ),

                   Row(
                      children: [
                        const Text('Password'),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: ListTile(
                            title: TextField(
                                decoration:
                                const InputDecoration(labelText: "Password"),
                            controller: passTextController,
                              obscureText: !showpass,
                            ),

                            trailing: GestureDetector(
                              onTap: (){
                                setState(() {
                                  showpass=!showpass;
                                });
                              },
                              child: showPsd(),



                            ),

                          ),
                        )
                      ]),

                  const SizedBox(height: 5),
                  ElevatedButton(
                      onPressed: () {
                        int? userId = int.tryParse(idTextController.text);
                        if (userId == null) {
                          Fluttertoast.showToast(msg: "Invalid ID");
                          return;
                        }

                        if (!isValidEmail(emailtc.text)) {
                          Fluttertoast.showToast(msg: "Invalid Email Address");
                          return;
                        }

                        if (selectedDate == null) {
                          Fluttertoast.showToast(msg: "Please select a valid date of birth");
                          return;
                        }

                        try {
                          final repository = ref.read(repositoryProvider.notifier);
                          repository.insertUser(UserModels(
                            id: userId,
                            linkimg: imglinkTextController.text,
                            name: nameTextController.text,
                            email: emailtc.text,
                            gender: sex,
                            contact: int.tryParse(contactTextController.text) ?? 0,
                            password: hashPassword(passTextController.text),
                            dob: selectedDate!,
                          ));

                          Fluttertoast.showToast(
                            msg: "Saved successfully",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.lightGreen,
                            textColor: Colors.white,
                          );

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                        } catch (e) {
                          Fluttertoast.showToast(
                            msg: e.toString(),
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      },

                    child: const Text("Register"),
                  ),
                  TextButton(
                    onPressed: widget.onSwitch,
                    child: const Text("Switch to Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget showPsd(){

 IconData iconeye =   showpass?

    Icons.visibility
        :
    Icons.visibility_off_outlined;
   return Icon(
     iconeye
   );

  }


 Widget topImage(BuildContext context,String imgurl) {

   return linktyped && imgurl.isNotEmpty ?
   Hero(
           tag: 'My photo',
           child: CachedNetworkImage(
             imageUrl:imgurl,
             alignment: Alignment.topCenter,
             fit: BoxFit.contain,
             placeholder: (context, url) =>
             const CircularProgressIndicator(),
             height: 150,
             width: 200,
           ),
         )

       :
   const CircularProgressIndicator();



 }

}



