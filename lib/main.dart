import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/bankEmployee.dart';
import 'package:myapp/customer.dart';
import 'package:myapp/model/authenticationResponse.dart';
import 'package:myapp/sidebar.dart';
import 'package:http/http.dart' as http;
import 'model/userResponse.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ' Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  String _username = "";
  AuthenticationResponce? authResponce;
  String _password = "";

var body = {};
  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAuthenticate();
  }

  void getAuthenticate() async {
    // setState(() {
    //   _loading = true;
    // });
    print(_username);
    print(_password);
    body["username"] = _username;
    body["password"] = _password;

     
    String bodyJason = json.encode(body);
    var response = await http.post(
        Uri.parse("http://localhost:8090/authenticate"),
        headers: {"Content-Type": "application/json"},
        body: bodyJason);

   
    
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode==200){
      authResponce=authenticationResponceFromJson(response.body);
      // print(authResponce.body.user.);
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sideBar(token: authResponce!.body!.jwt.toString(),)));
      if (authResponce!.body!.user!.type == 'admin') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => sideBar(
                      token: authResponce!.body!.jwt.toString(),
                    )));
      } else if (authResponce!.body!.user!.type == 'customer') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Customer(
                      token: authResponce!.body!.jwt.toString(),
                    )));
      } else if (authResponce!.body!.user!.type == 'BankEmployee') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BankEmployee(token: authResponce!.body!.jwt.toString(),)));
      } else {
        print('invalid');
      }

    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                color: Color.fromARGB(255, 15, 20, 87),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: const Text(
                        "ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: const Text(
                        "Welcome to ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 6),
              child: SizedBox(
                width: 300,
                child: _formLogin(),
              ),
            ),
          )
        ],
      )),
    );
  }

Widget _formLogin() {
    return Column(
      children: [
        const Text(
          "ABC Bank",
          style: TextStyle(
            color: Color.fromARGB(255, 14, 10, 10),
            fontSize: 50,
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        const Text(
          "We Make Your Life Easier",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 500,
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.blueGrey[50],
                filled: true,
                labelStyle: const TextStyle(fontSize: 12),
                contentPadding: const EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color:  Color.fromARGB(255, 160, 183, 207)),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color:  Color.fromARGB(255, 0, 128, 255)),
                  borderRadius: BorderRadius.circular(15),
                )),
                onChanged: (val){
                  _username = val;
                },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          width: 500,
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Password',
                counterText: 'Forgot password?',
                suffixIcon: const Icon(Icons.visibility_off_outlined,
                    color: Colors.grey),
                fillColor: Colors.blueGrey[50],
                filled: true,
                labelStyle: const TextStyle(fontSize: 12),
                contentPadding: const EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color:  Color.fromARGB(255, 160, 183, 207)),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 128, 255)),
                  borderRadius: BorderRadius.circular(15),
                )),
                onChanged: (val){
                  _password = val;
                },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 500,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 233, 241, 156),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 224, 235, 211),
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]),
          child: ElevatedButton(
            child: Container(
              width: 500,
              height: 50,
              child: const Center(child: Text('Sign in')),
            ),
            onPressed: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sidebar()));
              // print("User Name : "+_username);
              //  print("Password : "+_password);
         //   Authenticate();
        getAuthenticate();
          
           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sideBar()));


            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 41, 16, 153),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        )
      ],
    );
  }
}
