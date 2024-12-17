class CustomercodecreateModel {
  CustomercodecreateModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  CustomercodecreateModel.fromJson(dynamic json) {
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
      this.customerCodes,});

  Result.fromJson(dynamic json) {
    if (json['CustomerCodes'] != null) {
      customerCodes = [];
      json['CustomerCodes'].forEach((v) {
        customerCodes?.add(CustomerCodes.fromJson(v));
      });
    }
  }
  List<CustomerCodes>? customerCodes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customerCodes != null) {
      map['CustomerCodes'] = customerCodes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CustomerCodes {
  CustomerCodes({
      this.customerCode, 
      this.status,
      this.pan,
  });

  CustomerCodes.fromJson(dynamic json) {
    customerCode = json['CustomerCode'];
    status = json['Status'];
    pan=json['PAN'];

  }
  String? customerCode;
  bool? status;
  String? pan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CustomerCode'] = customerCode;
    map['Status'] = status;
    map['PAN']=pan;
    return map;
  }

}