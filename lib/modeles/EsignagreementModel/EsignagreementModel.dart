class EsignagreementModel {
  EsignagreementModel({
      this.version, 
      this.statusCode, 
      this.message, 
      this.transactionId, 
      this.result,});

  EsignagreementModel.fromJson(dynamic json) {
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
      this.fileBytes, 
      this.fileName, 
      this.nextProcess, 
      this.mesaage,});

  Result.fromJson(dynamic json) {
    activityStatus = json['ActivityStatus'];
    fileBytes = json['FileBytes'];
    fileName = json['FileName'];
    nextProcess = json['NextProcess'];
    mesaage = json['Mesaage'];
  }
  String? activityStatus;
  String? fileBytes;
  String? fileName;
  String? nextProcess;
  String? mesaage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ActivityStatus'] = activityStatus;
    map['FileBytes'] = fileBytes;
    map['FileName'] = fileName;
    map['NextProcess'] = nextProcess;
    map['Mesaage'] = mesaage;
    return map;
  }

}