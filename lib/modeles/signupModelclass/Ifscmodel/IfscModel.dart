class IfscModel {
  IfscModel({
      this.version, 
      this.statusCode, 
      this.message, 
      this.transactionId, 
      this.result,});

  IfscModel.fromJson(dynamic json) {
    version = json['Version'];
    statusCode = json['StatusCode'];
    message = json['Message'];
    transactionId = json['TransactionId'];
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  String? version;
  int? statusCode;
  String? message;
  int? transactionId;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Version'] = version;
    map['StatusCode'] = statusCode;
    map['Message'] = message;
    map['TransactionId'] = transactionId;
    if (result != null) {
      map['Result'] = result?.toJson();
    }
    return map;
  }

}

class Result {
  Result({
      this.activityStatus, 
      this.bankDetails,});

  Result.fromJson(dynamic json) {
    activityStatus = json['ActivityStatus'];
    bankDetails = json['BankDetails'] != null ? BankDetails.fromJson(json['BankDetails']) : null;
  }
  String? activityStatus;
  BankDetails? bankDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ActivityStatus'] = activityStatus;
    if (bankDetails != null) {
      map['BankDetails'] = bankDetails?.toJson();
    }
    return map;
  }

}

class BankDetails {
  BankDetails({
      this.bankName, 
      this.branchName,});

  BankDetails.fromJson(dynamic json) {
    bankName = json['BankName'];
    branchName = json['BranchName'];
  }
  String? bankName;
  String? branchName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BankName'] = bankName;
    map['BranchName'] = branchName;
    return map;
  }

}