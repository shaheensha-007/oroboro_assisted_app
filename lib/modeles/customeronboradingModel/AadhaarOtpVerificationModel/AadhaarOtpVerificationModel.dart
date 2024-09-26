class AadhaarOtpVerificationModel {
  AadhaarOtpVerificationModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  AadhaarOtpVerificationModel.fromJson(dynamic json) {
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
      this.aadhaarDetails,});

  Result.fromJson(dynamic json) {
    aadhaarDetails = json['AadhaarDetails'] != null ? AadhaarDetails.fromJson(json['AadhaarDetails']) : null;
  }
  AadhaarDetails? aadhaarDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (aadhaarDetails != null) {
      map['AadhaarDetails'] = aadhaarDetails?.toJson();
    }
    return map;
  }

}

class AadhaarDetails {
  AadhaarDetails({
      this.name, 
      this.dob, 
      this.address1, 
      this.address2, 
      this.address3, 
      this.city, 
      this.pinCode, 
      this.district, 
      this.state, 
      this.aadhaarPhoto,});

  AadhaarDetails.fromJson(dynamic json) {
    name = json['Name'];
    dob = json['DOB'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    address3 = json['Address3'];
    city = json['City'];
    pinCode = json['PinCode'];
    district = json['District'];
    state = json['State'];
    aadhaarPhoto = json['Aadhaar_Photo'];
  }
  String? name;
  String? dob;
  String? address1;
  String? address2;
  String? address3;
  String? city;
  int? pinCode;
  String? district;
  String? state;
  String? aadhaarPhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['DOB'] = dob;
    map['Address1'] = address1;
    map['Address2'] = address2;
    map['Address3'] = address3;
    map['City'] = city;
    map['PinCode'] = pinCode;
    map['District'] = district;
    map['State'] = state;
    map['Aadhaar_Photo'] = aadhaarPhoto;
    return map;
  }

}