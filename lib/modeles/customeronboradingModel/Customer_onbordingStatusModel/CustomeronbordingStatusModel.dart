class CustomeronbordingstatusModel {
  CustomeronbordingstatusModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  CustomeronbordingstatusModel.fromJson(dynamic json) {
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
      this.pageName, 
      this.controllerName, 
      this.pageId, 
      this.flowId, 
      this.pageOrder, 
      this.pageType, 
      this.generateLoan,});

  Result.fromJson(dynamic json) {
    pageName = json['PageName'];
    controllerName = json['ControllerName'];
    pageId = json['PageId'];
    flowId = json['FlowId'];
    pageOrder = json['PageOrder'];
    pageType = json['PageType'];
    generateLoan = json['GenerateLoan'];
  }
  String? pageName;
  String? controllerName;
  String? pageId;
  String? flowId;
  int? pageOrder;
  String? pageType;
  bool? generateLoan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PageName'] = pageName;
    map['ControllerName'] = controllerName;
    map['PageId'] = pageId;
    map['FlowId'] = flowId;
    map['PageOrder'] = pageOrder;
    map['PageType'] = pageType;
    map['GenerateLoan'] = generateLoan;
    return map;
  }

}