
import 'package:flutter/material.dart';
import 'package:mvapp/auth/authservice.dart';
import 'package:mvapp/auth/login.dart';
import 'package:mvapp/widgets/mytextfield.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController=TextEditingController();
  void signUp() async{
    if (passController.text != confirmController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password doesn't match")));
      return;
    }
    final _authservice = Provider.of<AuthService>(context, listen: false);
    try {
        await _authservice.signUpemailandPass(emailController.text, passController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(253, 158, 158, 158),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.teal,
                ],
              ),
            ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/128/3063/3063822.png"),
                          fit: BoxFit.fill)),
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Text(
              "You have been missed",
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyTextField(
              ht: "Email",
              controller: emailController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            MyTextField(ht: "Password",controller: passController,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MyTextField(ht: "Confirm Password",controller: confirmController,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: signUp,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 114, 223, 117)),
                  child:const Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alredy have an account! "),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loggin()));
                  },
                  child:const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      )
    );
  }
}