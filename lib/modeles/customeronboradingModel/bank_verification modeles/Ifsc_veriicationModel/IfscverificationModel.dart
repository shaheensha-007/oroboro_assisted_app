class IfscverificationModel {
  IfscverificationModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  IfscverificationModel.fromJson(dynamic json) {
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
      this.iFSCDetails,});

  Result.fromJson(dynamic json) {
    iFSCDetails = json['IFSCDetails'] != null ? IfscDetails.fromJson(json['IFSCDetails']) : null;
  }
  IfscDetails? iFSCDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (iFSCDetails != null) {
      map['IFSCDetails'] = iFSCDetails?.toJson();
    }
    return map;
  }

}

class IfscDetails {
  IfscDetails({
      this.ifsc, 
      this.bankName, 
      this.branchName, 
      this.address, 
      this.city, 
      this.state, 
      this.district, 
      this.contact,});

  IfscDetails.fromJson(dynamic json) {
    ifsc = json['IFSC'];
    bankName = json['BankName'];
    branchName = json['BranchName'];
    address = json['Address'];
    city = json['City'];
    state = json['State'];
    district = json['District'];
    contact = json['Contact'];
  }
  String? ifsc;
  String? bankName;
  String? branchName;
  String? address;
  String? city;
  String? state;
  String? district;
  String? contact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IFSC'] = ifsc;
    map['BankName'] = bankName;
    map['BranchName'] = branchName;
    map['Address'] = address;
    map['City'] = city;
    map['State'] = state;
    map['District'] = district;
    map['Contact'] = contact;
    return map;
  }

}