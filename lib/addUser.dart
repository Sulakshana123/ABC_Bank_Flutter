import 'package:flutter/material.dart';
import 'package:myapp/sidebar.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text(
              'Transaction',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Color.fromARGB(255, 20, 13, 121)),
        backgroundColor: Colors.white,
      );
}