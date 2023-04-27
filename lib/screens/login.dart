
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zarea_admin/screens/home_screen.dart';
import 'package:zarea_admin/services/firebase_service.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/Login-Screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameC = TextEditingController();
  final _passC = TextEditingController();

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  bool _isPasswordVisible = true;
  // bool _isLoading = false;
  String err = '';

  void toggle(){
    setState((){
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  final FirebaseService _service = FirebaseService();

  bool _isSaving = false;
   login({username, password}) {
     _service.getAdminCredentials(username).then((value) async {
       if(value.exists){
         if(value['username']== username){
           if(value['password']== password){
             try{
               UserCredential userCredential = await  FirebaseAuth.instance.signInAnonymously();
               if(userCredential != null){
                 // ignore: use_build_context_synchronously
                 Navigator.pushReplacementNamed(context, HomeScreen.id);
               }
             }catch(e){
               _showMyDialog(
                 title: "Failed",
                 messege: e.toString(),
               );
             }
             return;
           }
           _showMyDialog(
             title: 'Incorrect Password',
             messege: 'Password you have entered is Incorrect',
           );
           return;
         }
         _showMyDialog(
           title: 'Invalid username',
           messege: 'Username you have entered is Invalid',
         );
       }else{
         _showMyDialog(
           title: 'Invalid Password',
           messege: 'Password you have entered is InCorrect',
         );
         ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               content: Text('Login Failed'),
               backgroundColor: Colors.pink,
               behavior: SnackBarBehavior.floating,
             ));
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xff84c225),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Zarea Admin Panel DashBoard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: _initialization,
          builder:  (context, snapshot){
            if(snapshot.hasError){
              return const Center(child: Text('Connection Failed'),);
            }
            if(snapshot.connectionState ==ConnectionState.done){
              return  Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff84c225),
                      Colors.white,
                    ],
                    stops: [1.0, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment(0.0, 0.0),
                  ),
                ),
                child: Center(
                  child: Container(
                      width: 500,
                      height: 500,
                      child: Card(
                        elevation: 6,
                        shape: Border.all(color: Colors.green, width: 2),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/logo.png', height: 200,),
                                        const Text('Zarea Admin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                        const SizedBox(height: 20,),
                                        TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: _nameC,
                                          textInputAction: TextInputAction.next,
                                          cursorColor: const Color(0xff84c225),
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return "user name";
                                            }
                                            return null;
                                          },
                                          decoration:  InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            prefixIcon: const Icon(Icons.person,color: Colors.black54),
                                            labelText: "user name",
                                            hintStyle: const TextStyle( color: Colors.black45),
                                            labelStyle: const TextStyle( color: Colors.black45),
                                            hintText: 'user name',
                                            enabledBorder:  const OutlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xff84c225),)
                                            ),
                                            border: const OutlineInputBorder(),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(width: 2.0,  color: Color(0xff84c225)),
                                            ),
                                            focusColor: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        TextFormField(
                                          controller: _passC,
                                          keyboardType: TextInputType.visiblePassword,
                                          obscureText: _isPasswordVisible,
                                          textInputAction: TextInputAction.go,
                                          keyboardAppearance: Brightness.dark,
                                          cursorColor: const Color(0xff84c225),
                                          obscuringCharacter: "*",
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return "Enter Password";
                                            }
                                            if(value.length <6){
                                              return "Enter 6 digit Password";
                                            }
                                            return null;
                                          },
                                          decoration:  InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            prefixIcon: const Icon(Icons.vpn_key, color: Colors.black54),
                                            hintText: 'password',
                                            hintStyle: const TextStyle( color: Colors.black45),
                                            labelStyle: const TextStyle( color: Colors.black45),
                                            fillColor: Colors.black87,
                                            hoverColor: Colors.black87,
                                            labelText: 'Minimum 6 characters',
                                            suffixIcon: InkWell(
                                              onTap: (){
                                                toggle();
                                              },
                                              child: Icon(_isPasswordVisible? Icons.visibility : Icons.visibility_off),
                                            ),
                                            enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: Color(0xff84c225))
                                            ),
                                            border: const OutlineInputBorder(),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(width: 2.0, color: Color(0xff84c225)),
                                            ),
                                            focusColor: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context, HomeScreen.id);
                                                  if(_formKey.currentState!.validate()){
                                                    login(
                                                      username: _nameC.text,
                                                      password: _passC.text,
                                                    );
                                                  }

                                                },
                                                style:  ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                                                ),

                                                child: const Text('Login', style: TextStyle(color: Colors.white),),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          }
      ),
    );
  }
  Future<void> _showMyDialog({title, messege}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog ☠'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
                Text(title),
                 Text(messege),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
