class MobileOtpverifyModel {
  String? version;
  int? statusCode;
  String? message;
  int? transactionId;
  Result? result;

  MobileOtpverifyModel(
      {this.version,
        this.statusCode,
        this.message,
        this.transactionId,
        this.result});

  MobileOtpverifyModel.fromJson(Map<String, dynamic> json) {
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
  String? nextprocess;
  String? verificationKey;

  Result({this.activityStatus, this.nextprocess, this.verificationKey});

  Result.fromJson(Map<String, dynamic> json) {
    activityStatus = json['ActivityStatus'];
    nextprocess = json['nextprocess'];
    verificationKey = json['VerificationKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ActivityStatus'] = activityStatus;
    data['nextprocess'] = nextprocess;
    data['VerificationKey'] = verificationKey;
    return data;
  }
}
