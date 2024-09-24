class UserdetalisModel {
  UserdetalisModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  UserdetalisModel.fromJson(dynamic json) {
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
      this.userId, 
      this.name, 
      this.emailId, 
      this.mobileNumber, 
      this.roleId, 
      this.roleName, 
      this.userType, 
      this.userName, 
      this.status, 
      this.partnerCodes, 
      this.regions, 
      this.agentCode, 
      this.onboardingRights,});

  Result.fromJson(dynamic json) {
    userId = json['UserId'];
    name = json['Name'];
    emailId = json['EmailId'];
    mobileNumber = json['Mobile_Number'];
    roleId = json['RoleId'];
    roleName = json['RoleName'];
    userType = json['UserType'];
    userName = json['UserName'];
    status = json['Status'];
    partnerCodes = json['PartnerCodes'] != null ? json['PartnerCodes'].cast<String>() : [];
    regions = json['Regions'] != null ? json['Regions'].cast<String>() : [];
    agentCode = json['AgentCode'];
    onboardingRights = json['OnboardingRights'];
  }
  String? userId;
  String? name;
  String? emailId;
  int? mobileNumber;
  String? roleId;
  String? roleName;
  String? userType;
  String? userName;
  bool? status;
  List<String>? partnerCodes;
  List<String>? regions;
  String? agentCode;
  bool? onboardingRights;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserId'] = userId;
    map['Name'] = name;
    map['EmailId'] = emailId;
    map['Mobile_Number'] = mobileNumber;
    map['RoleId'] = roleId;
    map['RoleName'] = roleName;
    map['UserType'] = userType;
    map['UserName'] = userName;
    map['Status'] = status;
    map['PartnerCodes'] = partnerCodes;
    map['Regions'] = regions;
    map['AgentCode'] = agentCode;
    map['OnboardingRights'] = onboardingRights;
    return map;
  }

}