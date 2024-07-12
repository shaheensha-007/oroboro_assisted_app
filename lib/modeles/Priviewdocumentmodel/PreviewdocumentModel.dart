class PreviewdocumentModel {
  PreviewdocumentModel({
      this.version, 
      this.statusCode, 
      this.message, 
      this.transactionId, 
      this.result,});

  PreviewdocumentModel.fromJson(dynamic json) {
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
      this.base64string, 
      this.mesaage,});

  Result.fromJson(dynamic json) {
    activityStatus = json['ActivityStatus'];
    fileBytes = json['FileBytes'];
    base64string = json['base64string'];
    mesaage = json['Mesaage'];
  }
  String? activityStatus;
  String? fileBytes;
  String? base64string;
  String? mesaage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ActivityStatus'] = activityStatus;
    map['FileBytes'] = fileBytes;
    map['base64string'] = base64string;
    map['Mesaage'] = mesaage;
    return map;
  }

}