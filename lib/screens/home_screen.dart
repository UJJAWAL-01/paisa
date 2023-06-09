import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome"),centerTitle: true,),
      body: Center(
        child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("assets/logo1.jpg", fit: BoxFit.contain),
              ),
              Text("Welcome Back",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Name",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black38
              )),
              SizedBox(
                height: 15,
              ),
              ActionChip(label: Text("Logut"),onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
