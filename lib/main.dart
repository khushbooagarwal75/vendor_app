import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:vendor_app/booksvendor.dart';
import 'package:vendor_app/firebase_options.dart';
import 'package:vendor_app/pencilvendor.dart';
import 'package:vendor_app/penvendor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: (FirebaseAuth.instance.currentUser != null) ? :Login(),
      home: Login(),
    );
  }
}

// (FirebaseAuth.instance.currentUser != null) ?
// ((FirebaseAuth.instance.currentUser?.uid=="PZTlvV8lcOfAvgYVBztLu9pg5d62")?PenVendor():
// ((FirebaseAuth.instance.currentUser?.uid=="PZTlvV8lcOfAvgYVBztLu9pg5d62")?PencilVendor():
// (FirebaseAuth.instance.currentUser?.uid=="PZTlvV8lcOfAvgYVBztLu9pg5d62")?BooksVendor()))
class Login extends StatelessWidget {
   Login({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_tc=TextEditingController();
  TextEditingController password_tc=TextEditingController();

   void _showMessage(String message) {
     Get.snackbar(
       "Authentication",
       message,
       snackPosition: SnackPosition.BOTTOM,
       duration: Duration(seconds: 5),
       backgroundColor: Colors.black,
       colorText: Colors.amberAccent,
     );
   }

   void login() async {
     String email = email_tc.text.trim();
     String password = password_tc.text.trim();
     try {
       UserCredential userCredential = await FirebaseAuth.instance
           .signInWithEmailAndPassword(email: email, password: password);
       if (userCredential.user != null) {
         if(userCredential.user?.uid=="cGHmfEbHNVZX3RRW9KJCpI74Nkb2"){
           Get.off(() => PenVendor());
         }
         else if(userCredential.user?.uid=="LqwYnmCYQeW8Wy8VQbYHns3DJhv2"){
           Get.off(() => PencilVendor());
         }
         else if(userCredential.user?.uid=="2UECvTuWfVaMk0yjy1e8obC86Yd2"){
           Get.off(() => BooksVendor());
         }

       }
     } on FirebaseAuthException catch (ex) {
       _showMessage(ex.code.toString());
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Center(
                        child: Title(color: Colors.black, child: Text("Stationary Vendor",style: TextStyle(
                          fontSize: 30,
                          wordSpacing: 25,
                        ),)),
                      ),
                      Center(
                        child: Text("Log in",style: TextStyle(
                          fontSize: 30,
                        ),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("E-mail",style: TextStyle(fontSize: 18),),
                      TextFormField(
                        controller: email_tc,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                )
                            )
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter  email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Password",style: TextStyle(fontSize: 18),),
                      TextFormField(
                        controller: password_tc,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                )
                            )
                        ),
                        obscureText: true,
                        obscuringCharacter: "*",

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter  password';
                          }
                          return null;
                        },
                      ),

                      TextButton(
                        child: Text("Forgot your password?",style: TextStyle(fontSize: 18)),
                        onPressed: (){

                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {

    if (_formKey.currentState!.validate()) {
    login();

    }

                              else{
                                Get.snackbar("Message:", "Please fill both the fields");
                              }
                            },
                            child: Text("Log In")),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}



