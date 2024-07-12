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
  String? nextprocess;
  String? verificationKey;

  Result({this.activityStatus, this.nextprocess, this.verificationKey});

  Result.fromJson(Map<String, dynamic> json) {
    activityStatus = json['ActivityStatus'];
    nextprocess = json['nextprocess'];
    verificationKey = json['VerificationKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ActivityStatus'] = this.activityStatus;
    data['nextprocess'] = this.nextprocess;
    data['VerificationKey'] = this.verificationKey;
    return data;
  }
}
