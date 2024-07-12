class MobileagentModel {
  String? version;
  int? statusCode;
  String? message;
  int? transactionId;
  Result? result;

  MobileagentModel(
      {this.version,
        this.statusCode,
        this.message,
        this.transactionId,
        this.result});

  MobileagentModel.fromJson(Map<String, dynamic> json) {
    version = json['Version'];
    statusCode = json['StatusCode'];
    message = json['Message'];
    transactionId = json['TransactionId'];
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Version'] = this.version;
    data['StatusCode'] = this.statusCode;
    data['Message'] = this.message;
    data['TransactionId'] = this.transactionId;
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? activityStatus;

  Result({this.activityStatus});

  Result.fromJson(Map<String, dynamic> json) {
    activityStatus = json['ActivityStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ActivityStatus'] = this.activityStatus;
    return data;
  }
}
