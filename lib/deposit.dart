import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/customer.dart';
import 'package:myapp/sidebar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class depositPage extends StatelessWidget {
   depositPage({Key? key, required this.token}) : super(key: key);
  String token;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text(
              'Deposit',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Color.fromARGB(255, 20, 13, 121)),
           body: Deposit(token: token,),
        backgroundColor: Colors.white,
      );
}

class Deposit extends StatelessWidget {
  Deposit({Key? key, required this.token}) : super(key: key);
  String token;
  String _accNumber = '';
  String _amount = '';
  String _datetime = '';
  // String _dateTime = '';
  //String _DessAccNumber = '';
  // AuthResponse? authresponse;
  var body = {};
  bool _loading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   //super.initState();
  //   //getAuthenticate();
  // }

  
void deposit() async {
    // setState(() {
    //   _loading = true;
    // });
    body["account_Id"] = _accNumber;
    body["amount"] = _amount;
    body["dateTime"] = _datetime;
    body["type"] = "deposit";
  //  body["destinationAccId"] = _DessAccNumber;
    print(_accNumber);
    print(_amount);
    print(_datetime);
   // print(_DessAccNumber);
    print(token);
    // print(DateFormat.yMMMd().format(DateTime.now()));

    String bodyJason = json.encode(body);
    var response =
        await http.post(Uri.parse("http://localhost:8090/d"),
            headers: {
              "Content-Type": "application/json",
            //   "Authorization": "Bearer $token",
            //   // "Authorization": "Bearer ${widget.token}",
            //   "Access-Control-Allow-Origin": "*"
            },
            body: bodyJason);

    print("Status Code from transaction");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // BuildContext? context;
      // Navigator.pushReplacement(
      //     context!,
      //     MaterialPageRoute(
      //         builder: (context) => Customer(
      //               token: token,
      //             )));
      // Navigator.of(context).pushNamed("/SecondPage");
      Fluttertoast.showToast(
        msg: "Successfully Transfers",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    }else{Fluttertoast.showToast(
        msg: "Something Gone Wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);}
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  const Text(
                    "ABC Bank",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Deposit",
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
                          labelText: 'Account Number',
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
                        _accNumber = val;
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
                          labelText: 'Deposit Amount',
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
                        _amount = val;
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
                          labelText: 'Date/Time',
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
                        _datetime = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ignore: sized_box_for_whitespace
                  
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
                        child: const Center(child: Text('deposit')),
                      ),
                      onPressed: () {
                        // print(_accNumber)
                        print("Account Number : " + _accNumber);
                        print("Widraw Amount : " + _amount);
                        print("Date/Time : " + _datetime);
                        //print("Destination Account Number : " + _DessAccNumber);
                       deposit();

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => customer()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 20, 13, 121),
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