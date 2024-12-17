class LoanViewModel {
  LoanViewModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  LoanViewModel.fromJson(dynamic json) {
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
      this.totalCount, 
      this.loanDetails,});

  Result.fromJson(dynamic json) {
    totalCount = json['TotalCount'];
    if (json['LoanDetails'] != null) {
      loanDetails = [];
      json['LoanDetails'].forEach((v) {
        loanDetails?.add(LoanDetails.fromJson(v));
      });
    }
  }
  int? totalCount;
  List<LoanDetails>? loanDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TotalCount'] = totalCount;
    if (loanDetails != null) {
      map['LoanDetails'] = loanDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class LoanDetails {
  LoanDetails({
      this.applicationId, 
      this.applicationDate, 
      this.applicationStatus, 
      this.name, 
      this.pan, 
      this.status, 
      this.merchant, 
      this.customerCode, 
      this.mobileNumber, 
      this.loanID,});

  LoanDetails.fromJson(dynamic json) {
    applicationId = json['ApplicationId'];
    applicationDate = json['ApplicationDate'];
    applicationStatus = json['ApplicationStatus'];
    name = json['Name'];
    pan = json['PAN'];
    status = json['Status'];
    merchant = json['Merchant'];
    customerCode = json['CustomerCode'];
    mobileNumber = json['MobileNumber'];
    loanID = json['LoanID'];
  }
  String? applicationId;
  String? applicationDate;
  String? applicationStatus;
  String? name;
  String? pan;
  String? status;
  String? merchant;
  String? customerCode;
  int? mobileNumber;
  dynamic loanID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ApplicationId'] = applicationId;
    map['ApplicationDate'] = applicationDate;
    map['ApplicationStatus'] = applicationStatus;
    map['Name'] = name;
    map['PAN'] = pan;
    map['Status'] = status;
    map['Merchant'] = merchant;
    map['CustomerCode'] = customerCode;
    map['MobileNumber'] = mobileNumber;
    map['LoanID'] = loanID;
    return map;
  }

}