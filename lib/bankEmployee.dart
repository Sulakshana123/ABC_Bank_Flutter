import 'package:flutter/material.dart';
import 'package:myapp/deposit.dart';
import 'package:myapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/model/userResponse.dart';
import 'package:myapp/transaction.dart';
import 'package:myapp/user.dart';
import 'package:myapp/withdraw.dart';

// class bankEmployee extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: bankEmployee());
//   }
// }

class BankEmployee extends StatelessWidget {
  BankEmployee({Key? key, required this.token}) : super(key: key);
  String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(token: token,),
      appBar: AppBar(
        title: Text('ABC Bank'),
        backgroundColor: Color.fromARGB(255, 20, 13, 121),
      ),
     body: Center(  
          child: Column(              
            children: <Widget>[  
              Image.asset('images/first.jpg'), 
              
            ],  
          
        ),
      ),
      
    );
  }
}

class SideDrawer extends StatelessWidget {
  SideDrawer({Key? key, required this.token}) : super(key: key);
  String token;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Bank Employee',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 13, 121),
            ),
          ),
          ListTile(
            title: Text('Home', textAlign: TextAlign.center),
            onTap: () {},
          ),
          ListTile(
            title: Text('Transaction', textAlign: TextAlign.center),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TransactionPage(token: token,)));
            },
          ),
          ListTile(
            title: Text('Withdraw', textAlign: TextAlign.center),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>  withdrawPage(token: token,)));
            },
          ),
          ListTile(
            title: Text('Deposit', textAlign: TextAlign.center),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>   depositPage(token: token,)));
            },
          ),
          ListTile(
            title: Text('Logout', textAlign: TextAlign.center),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
        ],
      ),
    );
  }
}






