class PanverificationModel {
  PanverificationModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  PanverificationModel.fromJson(dynamic json) {
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
      this.pANDetails,});

  Result.fromJson(dynamic json) {
    pANDetails = json['PANDetails'] != null ? PanDetails.fromJson(json['PANDetails']) : null;
  }
  PanDetails? pANDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pANDetails != null) {
      map['PANDetails'] = pANDetails?.toJson();
    }
    return map;
  }

}

class PanDetails {
  PanDetails({
      this.name, 
      this.dob,});

  PanDetails.fromJson(dynamic json) {
    name = json['Name'];
    dob = json['DOB'];
  }
  String? name;
  String? dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['DOB'] = dob;
    return map;
  }

}