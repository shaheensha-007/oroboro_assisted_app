class SignloginModel {
  SignloginModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  SignloginModel.fromJson(dynamic json) {
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
      this.userId, 
      this.name, 
      this.permissions,});

  Result.fromJson(dynamic json) {
    userId = json['UserId'];
    name = json['Name'];
    if (json['Permissions'] != null) {
      permissions = [];
      json['Permissions'].forEach((v) {
        permissions?.add(Permissions.fromJson(v));
      });
    }
  }
  String? userId;
  String? name;
  List<Permissions>? permissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserId'] = userId;
    map['Name'] = name;
    if (permissions != null) {
      map['Permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Permissions {
  Permissions({
      this.pageId, 
      this.pageName, 
      this.navigationHeader, 
      this.controllerName, 
      this.methodName,});

  Permissions.fromJson(dynamic json) {
    pageId = json['PageId'];
    pageName = json['PageName'];
    navigationHeader = json['NavigationHeader'];
    controllerName = json['ControllerName'];
    methodName = json['MethodName'];
  }
  String? pageId;
  String? pageName;
  String? navigationHeader;
  String? controllerName;
  String? methodName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PageId'] = pageId;
    map['PageName'] = pageName;
    map['NavigationHeader'] = navigationHeader;
    map['ControllerName'] = controllerName;
    map['MethodName'] = methodName;
    return map;
  }

}