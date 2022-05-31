import 'package:flutter/material.dart';
import 'package:myapp/model/transactionResponce.dart';
import 'package:myapp/sidebar.dart';
import 'package:http/http.dart' as http;



class TransactionDetails extends StatefulWidget {
   TransactionDetails({ Key? key, required this.token }) : super(key: key);
   String token;
  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'All Transaction',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Color.fromARGB(255, 20, 13, 121)),
      body:ListVewBuilderTransaction(token: widget.token,)
      

      
    );
  }
}

class ListVewBuilderTransaction extends StatefulWidget {
  ListVewBuilderTransaction({Key? key, required this.token}) : super(key: key);
  String token;
  @override
  State<ListVewBuilderTransaction> createState() =>
      _ListVewBuilderTransactionState();
}

class _ListVewBuilderTransactionState extends State<ListVewBuilderTransaction> {
  List<TransactionResponce>? transactionresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }

  void getAllUsers() async {
    setState(() {
      _loading = true;
    });
    print("${widget.token}");
    var response = await http.get(
      Uri.parse("http://localhost:8090/alltransactions"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
  
    print("Status Code");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      transactionresponse = transactionResponceFromJson(response.body);
      setState(() {});
      for (int i = 0; i < transactionresponse!.length; i++) {
        print(transactionresponse![i].ownerAcc);
      }

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("ListView.builder"),
      // ),
      body: Container(
          child: Column(
        children: [
          _loading
              ? Container(
                  // child: SpinKitCubeGrid(
                  //   color: Colors.amber,
                  // ),
                  child: CircularProgressIndicator(
                  color: Colors.red,)
                )
              : Container(
                  width: 500,
                  height: 500,
                  // color: Colors.blue,
                  child: ListView.builder(
                      itemCount: transactionresponse!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Icon(Icons.person),
                            // trailing: Container(
                            //     child: Column(
                            //   children: [
                            //     TextButton(
                            //         onPressed: () {},
                            //         child: Icon(
                            //           Icons.person,
                            //           color: Colors.black87,
                            //         ))
                            //   ],
                            // )),
                            title: Text("Transaction ID: "+transactionresponse![index]
                                .transactionId
                                .toString()+ " | Transfered Amount: "+transactionresponse![index].amount.toString()));
                      }),
                )
        ],
      )),
      // body: ListView.builder(
      //     itemCount: userresponse!.body!.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(
      //           leading: Icon(Icons.list),
      //           trailing: Text(
      //             "GFG",
      //             style: TextStyle(color: Colors.green, fontSize: 15),
      //           ),
      //           title: Text(userresponse!.body![index].ufname.toString()));
      //     }),
    );
  }
}
