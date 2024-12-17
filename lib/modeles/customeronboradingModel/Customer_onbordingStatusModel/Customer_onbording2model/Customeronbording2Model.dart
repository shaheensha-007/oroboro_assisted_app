class Customeronbording2Model {
  Customeronbording2Model({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  Customeronbording2Model.fromJson(dynamic json) {
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
      this.applicationID,
      this.flowId,
      this.pageId,
      this.pageName, 
      this.controllerName,
      this.pageOrder,
      this.pageType,
      this.generateLoan,});

  Result.fromJson(dynamic json) {
    applicationID = json['ApplicationID'];
    flowId = json['FlowId'];
    pageId = json['PageId'];
    pageName = json['PageName'];
    controllerName = json['ControllerName'];
    pageOrder = json['PageOrder'];
    pageType = json['PageType'];
    generateLoan = json['GenerateLoan'];
  }
  String? applicationID;
  String? flowId;
  String? pageId;
  String? pageName;
  String? controllerName;
  int? pageOrder;
  String? pageType;
  bool? generateLoan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ApplicationID'] = applicationID;
    map['FlowId'] = flowId;
    map['PageId'] = pageId;
    map['PageName'] = pageName;
    map['ControllerName'] = controllerName;
    map['PageOrder'] = pageOrder;
    map['PageType'] = pageType;
    map['GenerateLoan'] = generateLoan;
    return map;
  }

}