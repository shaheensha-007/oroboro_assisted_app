class LoanEligableModel {
  LoanEligableModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  LoanEligableModel.fromJson(dynamic json) {
    transactionId = json['TransactionId'];
    responseCode = json['ResponseCode'];
    status = json['Status'];
    responseStatus = json['ResponseStatus'];
    responseMessage = json['ResponseMessage'];
    errorMessage = json['ErrorMessage'];
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  int? transactionId;
  int? responseCode;
  String? status;
  int? responseStatus;
  String? responseMessage;
  String? errorMessage;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionId'] = transactionId;
    map['ResponseCode'] = responseCode;
    map['Status'] = status;
    map['ResponseStatus'] = responseStatus;
    map['ResponseMessage'] = responseMessage;
    map['ErrorMessage'] = errorMessage;
    if (result != null) {
      map['Result'] = result?.toJson();
    }
    return map;
  }

}

class Result {
  Result({
      this.loanApplicationStatus,});

  Result.fromJson(dynamic json) {
    loanApplicationStatus = json['LoanApplicationStatus'];
  }
  String? loanApplicationStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LoanApplicationStatus'] = loanApplicationStatus;
    return map;
  }

}