class AgentKycModel {
  AgentKycModel({
      this.version, 
      this.statusCode, 
      this.message, 
      this.transactionId, 
      this.result,});

  AgentKycModel.fromJson(dynamic json) {
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
      this.nextprocess, 
      this.result,});

  Result.fromJson(dynamic json) {
    activityStatus = json['ActivityStatus'];
    nextprocess = json['nextprocess'];
    result = json['result'];
  }
  String? activityStatus;
  String? nextprocess;
  String? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ActivityStatus'] = activityStatus;
    map['nextprocess'] = nextprocess;
    map['result'] = result;
    return map;
  }

}