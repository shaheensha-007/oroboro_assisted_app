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
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Version'] = version;
    data['StatusCode'] = statusCode;
    data['Message'] = message;
    data['TransactionId'] = transactionId;
    if (result != null) {
      data['Result'] = result!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ActivityStatus'] = activityStatus;
    return data;
  }
}
