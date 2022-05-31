import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/model/userResponse.dart';
import 'package:myapp/account.dart';
import 'package:myapp/transaction.dart';
import 'package:myapp/user.dart';
import 'package:myapp/model/transactionResponce.dart';
import 'package:myapp/viewtransaction.dart';



class sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sidebar(),
    );
  }
}

class sideBar extends StatelessWidget {
   sideBar({Key? key,required this.token}) : super(key: key);

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
   SideDrawer({Key? key,required this.token}) : super(key: key);

   String token;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Admin',
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
                  MaterialPageRoute(builder: (context) =>  TransactionDetails(token: token,)));
            },
          ),
          ListTile(
            title: Text('Users', textAlign: TextAlign.center),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>  UserPage(token: token)));
            },
          ),
          ListTile(
            title: Text('Accounts', textAlign: TextAlign.center),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  AccountPage(token: token,)));
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





