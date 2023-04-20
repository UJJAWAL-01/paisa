import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;

  //keys
  final _formKey = GlobalKey<FormState>();

  //editing controllers
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    //firstname field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("First name required");
        }
        if(!regex.hasMatch(value)){
          return ("Enter a valid name(min. 3 characters)");
        }
        return null;
      },
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )
      ),
    );


    //second name field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        if(value!.isEmpty){
          return ("Second name required");
        }
        return null;
      },
      onSaved: (value){
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )
      ),
    );


    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value)
      {
        if(value!.isEmpty){
          return ("Please enter your Email");
        }
        //REGEX for email validation
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)){
          return ("Please enter a valid Email");
        }
        return null;
      },
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )
      ),
    );


    //password field
    final passwordField = TextFormField(
    autofocus: false,
    controller: passwordEditingController,
    obscureText: true,
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return ("password is required for login");
        }
        if(!regex.hasMatch(value)){
          return ("Please enter a valid password(min. 6 characters)");
        }
      },
    onSaved: (value){
      passwordEditingController.text = value!;
    },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.vpn_key),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    hintText: "Password",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    )
    ),
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value){
        if(confirmPasswordEditingController.text.length > 6 && passwordEditingController.text != value){
          return "Password do not match";
        }
        return null;
      },
      onSaved: (value){
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          )
      ),
    );

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){},
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            //passing this to the root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 120,
                        child: Image.asset("assets/logo1.jpg",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 60),
                    firstNameField,
                    SizedBox(height: 25),
                    secondNameField,
                    SizedBox(height: 25),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 25),
                    confirmPasswordField,
                    SizedBox(height: 25),
                    signUpButton,
                    SizedBox(height: 15,)
                      ],
                    )
                ),
              ),
            ),
          ),
        ),
      );
  }

  void signUp(String email , String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
      }).catchError((e)
          {
            Fluttertoast.showToast(msg: e!.message);
          });
    }
  }

  postDetailsToFirestore()async {

  }

}