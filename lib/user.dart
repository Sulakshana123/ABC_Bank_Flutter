import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/sidebar.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/model/userResponse.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key, required this.token}) : super(key: key);

  String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'User',
            style: TextStyle(color: Colors.white, fontSize: 20),

          ),
          actions: [Container(child: TextButton(onPressed: (() {
            }), child: Text("Create")),)],
          backgroundColor: Color.fromARGB(255, 20, 13, 121)),
         
      // backgroundColor: Colors.white,

      body: Row(
        children: [ Expanded(flex: 6,child:  Container(height: 500, width: 500, child: ListViewUser(token: token))),
         Expanded( flex: 6,child: AddUser(token: token))
        ],
      ),
    );
  }
}

class ListViewUser extends StatefulWidget {
  ListViewUser({Key? key, required this.token}) : super(key: key);

  String token;

  @override
  State<ListViewUser> createState() => _ListViewUserState();
}

class _ListViewUserState extends State<ListViewUser> {
  UserResponce? userResponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }

  void deleteUser(String user_id) async {
    setState(() {
      _loading = true;
    });
     print(widget.token);
    var response = await http.delete(
      Uri.parse("http://localhost:8090/userdelete/${user_id}"  ),
      // headers: {"Authorization": "Bearer ${widget.token}"
      // "Access-Control-Allow-Origin: *"},
    );
    print("Status Code from delete");
    print(response.statusCode);
    setState(() {
      _loading = false;
    });
  }

  void getAllUsers() async {
    setState(() {
      _loading = true;
    });
    var response = await http.get(Uri.parse("http://localhost:8090/userall"),
        headers: {"Authorization": "Bearer ${widget.token}"});

    print("Status code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      userResponse = userResponceFromJson(response.body);
      // for (int i = 0; i < userResponse!.body!.length; i++) {
      //   print(userResponse!.body![i].email);
      // }
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        _loading
            ? Container(
                child: CircularProgressIndicator(color: Colors.red),
              )
            : Container(
                width: 500,
                height: 300,
                child: ListView.builder(
                    itemCount: userResponse!.body!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: Icon(Icons.person),
                          trailing: Container(
                              child: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    deleteUser(userResponse!.body![index].userId
                                        .toString());
                                        print(userResponse!.body![index].userId);
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserPage(token: widget.token)));
                                  },
                                  child: Icon(Icons.delete))
                            ],
                          )),
                          title: Text(
                              userResponse!.body![index].email.toString()));
                    }),
              ),
      ]),
    ));
  }
}

class AddUser extends StatelessWidget {
  AddUser({Key? key,required this.token}) : super(key: key);
  String token;
 
    String _ufname = '';
    String _ulname = '';
    String _address = '';
    String _email ='';
    String _password = '';
    String _usertype = '';
  // String _username = "";
  // String _password = "";
  // AuthResponse? authresponse;
  var body = {};
  // bool _loading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAuthenticate();
  // }

  void createUser() async {
    // setState(() {
    //   _loading = true;
    // });
    body["first_name"] = _ufname;
    body["last_name"] = _ulname;
    body["email"] = _email;
    body["address"] = _address;
    body["password"] = _password;
    body["type"] = _usertype;
    String bodyJason = json.encode(body);
    var response = await http.post(
        Uri.parse("http://localhost:8090/CreateUser"),
        headers: {"Content-Type": "application/json"},
        body: bodyJason);

    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Welcome  " + _ufname.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        body: Row(
      children: [
        // Expanded(
        //       flex: 3,
        //       child: Container(
        //         color: Colors.black87,
        //         child: Column(
        //           // mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children:
        //            [
        //             Container(
        //               padding: const EdgeInsets.all(50),
        //               child: const Text(
        //                 "ABC Bank",
        //                 style: TextStyle(color: Colors.white, fontSize: 30),
        //               ),
        //             ),
        //             Container(
        //               // padding: const EdgeInsets.all(50),
        //               child: const Text(
        //                 "Admin Menu",
        //                 style: TextStyle(color: Colors.white, fontSize: 30),
        //               ),
        //             ),
        //             AdminSidebar(
        //               token: token,
        //               userID: userID.toString(),
        //             ),
        //           ],
        //         ),
        //       )),
        Expanded(
            flex: 9,
            child: Container(
              child: Column(
                children: [
                  // const Text(
                  //   "ABC Bank",
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 50,
                  //   ),
                  // ),
                  // // ignore: prefer_const_constructors
                  // SizedBox(
                  //   height: 20,
                  // ),
                  const Text(
                    "Create New User",
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
                          labelText: 'First Name',
                          suffixIcon: const Icon(Icons.account_circle_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          labelStyle: const TextStyle(fontSize: 12),
                          contentPadding: const EdgeInsets.only(left: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _ufname = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          suffixIcon: const Icon(Icons.monetization_on_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          labelStyle: const TextStyle(fontSize: 12),
                          contentPadding: const EdgeInsets.only(left: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _ulname = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Address',
                          suffixIcon: const Icon(Icons.date_range_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          labelStyle: const TextStyle(fontSize: 12),
                          contentPadding: const EdgeInsets.only(left: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _address = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: const Icon(Icons.account_circle_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          labelStyle: const TextStyle(fontSize: 12),
                          contentPadding: const EdgeInsets.only(left: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _email = val;
                      },
                    ),
                  ),const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: const Icon(Icons.account_circle_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          labelStyle: const TextStyle(fontSize: 12),
                          contentPadding: const EdgeInsets.only(left: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _password = val;
                      },
                    ),
                  ),const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'User Type',
                          suffixIcon: const Icon(Icons.account_circle_outlined,
                              color: Colors.grey),
                          fillColor: Colors.blueGrey[50],
                          filled: true,
                          labelStyle: const TextStyle(fontSize: 12),
                          contentPadding: const EdgeInsets.only(left: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _usertype = val;
                      },
                    ),
                  ),
                  // ignore: sized_box_for_whitespace
                  // Container(
                  //   width: 500,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         labelText: 'Destination Account Number',
                  //         // counterText: 'Forgot password?',
                  //         suffixIcon: const Icon(Icons.account_circle_outlined,
                  //             color: Colors.grey),
                  //         fillColor: Colors.blueGrey[50],
                  //         filled: true,
                  //         labelStyle: const TextStyle(fontSize: 12),
                  //         contentPadding: const EdgeInsets.only(left: 30),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(color: Colors.grey),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(
                  //               color: Color.fromARGB(255, 0, 128, 255)),
                  //           borderRadius: BorderRadius.circular(15),
                  //         )),
                  //     onChanged: (val) {
                  //       _DessAccNumber = val;
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 209, 196, 233),
                            spreadRadius: 10,
                            blurRadius: 20,
                          )
                        ]),
                    child: ElevatedButton(
                      child: Container(
                        width: 500,
                        height: 50,
                        child: const Center(child: Text('Create New User')),
                      ),
                      onPressed: () {
                        // print(_accNumber)
                        print("Account Number : " + _ufname);
                        print("Widraw Amount : " + _ulname);
                        print("Date/Time : " + _address);
                        print("Destination Account Number : " + _email);
                        print("Date/Time : " + _password);
                        print("Destination Account Number : " + _usertype);
                        createUser();
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AdminHome()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary:Color.fromARGB(255, 20, 13, 121),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            )),
      ],
    ));
  }
}