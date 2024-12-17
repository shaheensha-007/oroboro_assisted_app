class StatecodeModel {
  StatecodeModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  StatecodeModel.fromJson(dynamic json) {
    transactionId = json['TransactionId'];
    responseCode = json['ResponseCode'];
    status = json['Status'];
    responseStatus = json['ResponseStatus'];
    responseMessage = json['ResponseMessage'];
    errorMessage = json['ErrorMessage'];
    if (json['Result'] != null) {
      result = [];
      json['Result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
  }
  int? transactionId;
  int? responseCode;
  String? status;
  int? responseStatus;
  String? responseMessage;
  String? errorMessage;
  List<Result>? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionId'] = transactionId;
    map['ResponseCode'] = responseCode;
    map['Status'] = status;
    map['ResponseStatus'] = responseStatus;
    map['ResponseMessage'] = responseMessage;
    map['ErrorMessage'] = errorMessage;
    if (result != null) {
      map['Result'] = result?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Result {
  Result({
      this.stateCode, 
      this.stateName,});

  Result.fromJson(dynamic json) {
    stateCode = json['StateCode'];
    stateName = json['StateName'];
  }
  String? stateCode;
  String? stateName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StateCode'] = stateCode;
    map['StateName'] = stateName;
    return map;
  }

}