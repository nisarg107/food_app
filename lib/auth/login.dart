
import 'package:flutter/material.dart';
import 'package:mvapp/auth/authservice.dart';
import 'package:mvapp/auth/register.dart';
import 'package:mvapp/widgets/mytextfield.dart';
import 'package:provider/provider.dart';

class Loggin extends StatefulWidget {
  const Loggin({super.key});

  @override
  State<Loggin> createState() => _LogginState();
}

class _LogginState extends State<Loggin> {
  final emailController=TextEditingController();
  final passController=TextEditingController();
  login() async{
    final _authservice=Provider.of<AuthService>(context,listen: false);
    try {
      await _authservice.signInEmailandPass(emailController.text, passController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(253, 158, 158, 158),
      body: Container(
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
                      image: NetworkImage("https://cdn-icons-png.flaticon.com/128/3063/3063822.png"),fit: BoxFit.fill)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.035,),
            Text("You have been missed",style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.5) ),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyTextField(ht: "Email",controller: emailController,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            MyTextField(ht: "Password",controller: passController,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: login,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 114, 223, 117)
                  ),
                  child: Center(child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                  },
                  child: Text("Register now",style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}