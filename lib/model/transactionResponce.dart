// To parse this JSON data, do
//
//     final transactionResponce = transactionResponceFromJson(jsonString);

import 'dart:convert';

List<TransactionResponce> transactionResponceFromJson(String str) => List<TransactionResponce>.from(json.decode(str).map((x) => TransactionResponce.fromJson(x)));

String transactionResponceToJson(List<TransactionResponce> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionResponce {
    TransactionResponce({
        this.transactionId,
        this.accountId,
        this.amount,
        this.dateTime,
        this.type,
        this.destinationAccId,
        this.ownerAcc,
    });

    int? transactionId;
    int? accountId;
    int? amount;
    DateTime? dateTime;
    String? type;
    int? destinationAccId;
    OwnerAcc? ownerAcc;

    factory TransactionResponce.fromJson(Map<String, dynamic> json) => TransactionResponce(
        transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
        accountId: json["account_Id"] == null ? null : json["account_Id"],
        amount: json["amount"] == null ? null : json["amount"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        type: json["type"] == null ? null : json["type"],
        destinationAccId: json["destinationAccId"] == null ? null : json["destinationAccId"],
        ownerAcc: json["ownerAcc"] == null ? null : OwnerAcc.fromJson(json["ownerAcc"]),
    );

    Map<String, dynamic> toJson() => {
        "transaction_id": transactionId == null ? null : transactionId,
        "account_Id": accountId == null ? null : accountId,
        "amount": amount == null ? null : amount,
        "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
        "type": type == null ? null : type,
        "destinationAccId": destinationAccId == null ? null : destinationAccId,
        "ownerAcc": ownerAcc == null ? null : ownerAcc!.toJson(),
    };
}

class OwnerAcc {
    OwnerAcc({
        this.owner,
        this.accountId,
        this.accountName,
        this.accountBalance,
        this.userId,
        this.cod,
    });

    Owner? owner;
    int? accountId;
    String? accountName;
    int? accountBalance;
    int? userId;
    String? cod;

    factory OwnerAcc.fromJson(Map<String, dynamic> json) => OwnerAcc(
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        accountId: json["account_Id"] == null ? null : json["account_Id"],
        accountName: json["account_name"] == null ? null : json["account_name"],
        accountBalance: json["account_balance"] == null ? null : json["account_balance"],
        userId: json["user_id"] == null ? null : json["user_id"],
        cod: json["cod"] == null ? null : json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "owner": owner == null ? null : owner!.toJson(),
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
