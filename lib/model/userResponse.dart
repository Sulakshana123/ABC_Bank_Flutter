// To parse this JSON data, do
//
//     final userResponce = userResponceFromJson(jsonString);

import 'dart:convert';

UserResponce userResponceFromJson(String str) => UserResponce.fromJson(json.decode(str));

String userResponceToJson(UserResponce data) => json.encode(data.toJson());

class UserResponce {
    UserResponce({
        this.body,
        this.status,
        this.message,
    });

    List<Body>? body;
    String? status;
    String? message;

    factory UserResponce.fromJson(Map<String, dynamic> json) => UserResponce(
        body: json["body"] == null ? null : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "body": body == null ? null : List<dynamic>.from(body!.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}

class Body {
    Body({
        this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.password,
        this.type,
        this.account,
    });

    int? userId;
    String? firstName;
    String? lastName;
    String? email;
    String? address;
    String? password;
    String? type;
    List<Account>? account;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        userId: json["user_id"] == null ? null : json["user_id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        password: json["password"] == null ? null : json["password"],
        type: json["type"] == null ? null : json["type"],
        account: json["account"] == null ? null : List<Account>.from(json["account"].map((x) => Account.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "password": password == null ? null : password,
        "type": type == null ? null : type,
        "account": account == null ? null : List<dynamic>.from(account!.map((x) => x.toJson())),
    };
}

class Account {
    Account({
        this.transaction,
        this.accountId,
        this.accountName,
        this.accountBalance,
        this.userId,
        this.cod,
    });

    List<Transaction>? transaction;
    int? accountId;
    String? accountName;
    int? accountBalance;
    int? userId;
    String? cod;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        transaction: json["transaction"] == null ? null : List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
        accountId: json["account_Id"] == null ? null : json["account_Id"],
        accountName: json["account_name"] == null ? null : json["account_name"],
        accountBalance: json["account_balance"] == null ? null : json["account_balance"],
        userId: json["user_id"] == null ? null : json["user_id"],
        cod: json["cod"] == null ? null : json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "transaction": transaction == null ? null : List<dynamic>.from(transaction!.map((x) => x.toJson())),
        "account_Id": accountId == null ? null : accountId,
        "account_name": accountName == null ? null : accountName,
        "account_balance": accountBalance == null ? null : accountBalance,
        "user_id": userId == null ? null : userId,
        "cod": cod == null ? null : cod,
    };
}

class Transaction {
    Transaction({
        this.transactionId,
        this.accountId,
        this.amount,
        this.dateTime,
        this.type,
        this.destinationAccId,
    });

    int? transactionId;
    int? accountId;
    int? amount;
    DateTime? dateTime;
    String? type;
    int? destinationAccId;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
        accountId: json["account_Id"] == null ? null : json["account_Id"],
        amount: json["amount"] == null ? null : json["amount"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        type: json["type"] == null ? null : json["type"],
        destinationAccId: json["destinationAccId"] == null ? null : json["destinationAccId"],
    );

    Map<String, dynamic> toJson() => {
        "transaction_id": transactionId == null ? null : transactionId,
        "account_Id": accountId == null ? null : accountId,
        "amount": amount == null ? null : amount,
        "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
        "type": type == null ? null : type,
        "destinationAccId": destinationAccId == null ? null : destinationAccId,
    };
}
