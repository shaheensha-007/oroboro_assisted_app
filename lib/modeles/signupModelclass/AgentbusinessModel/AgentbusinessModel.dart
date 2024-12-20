class AgentbusinessModel {
  AgentbusinessModel({
      this.version, 
      this.statusCode, 
      this.message, 
      this.transactionId, 
      this.result,});

  AgentbusinessModel.fromJson(dynamic json) {
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
      this.nextProcess,});

  Result.fromJson(dynamic json) {
    activityStatus = json['ActivityStatus'];
    nextProcess = json['NextProcess'];
  }
  String? activityStatus;
  String? nextProcess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ActivityStatus'] = activityStatus;
    map['NextProcess'] = nextProcess;
    return map;
  }

}