// To parse this JSON data, do
//
//     final accountResponce = accountResponceFromJson(jsonString);

import 'dart:convert';

List<AccountResponce> accountResponceFromJson(String str) => List<AccountResponce>.from(json.decode(str).map((x) => AccountResponce.fromJson(x)));

String accountResponceToJson(List<AccountResponce> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccountResponce {
    AccountResponce({
        this.owner,
        this.transaction,
        this.accountId,
        this.accountName,
        this.accountBalance,
        this.userId,
        this.cod,
    });

    Owner? owner;
    List<Transaction>? transaction;
    int? accountId;
    String? accountName;
    int? accountBalance;
    int? userId;
    String? cod;

    factory AccountResponce.fromJson(Map<String, dynamic> json) => AccountResponce(
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        transaction: json["transaction"] == null ? null : List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
        accountId: json["account_Id"] == null ? null : json["account_Id"],
        accountName: json["account_name"] == null ? null : json["account_name"],
        accountBalance: json["account_balance"] == null ? null : json["account_balance"],
        userId: json["user_id"] == null ? null : json["user_id"],
        cod: json["cod"] == null ? null : json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "owner": owner == null ? null : owner!.toJson(),
        "transaction": transaction == null ? null : List<dynamic>.from(transaction!.map((x) => x.toJson())),
        "account_Id": accountId == null ? null : accountId,
        "account_name": accountName == null ? null : accountName,
        "account_balance": accountBalance == null ? null : accountBalance,
        "user_id": userId == null ? null : userId,
        "cod": cod == null ? null : cod,
    };
}

class Owner {
    Owner({
        this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.password,
        this.type,
    });

    int? userId;
    String? firstName;
    String? lastName;
    String? email;
    String? address;
    String? password;
    String? type;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        userId: json["user_id"] == null ? null : json["user_id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        password: json["password"] == null ? null : json["password"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "password": password == null ? null : password,
        "type": type == null ? null : type,
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
