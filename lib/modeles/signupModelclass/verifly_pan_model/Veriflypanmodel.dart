

class VerifypanModel {
  final String version;
  final int statusCode;
  final String message;
  final int transactionId;
  final Result result;

  VerifypanModel({
    required this.version,
    required this.statusCode,
    required this.message,
    required this.transactionId,
    required this.result,
  });

  factory VerifypanModel.fromJson(Map<String, dynamic> json) {
    return VerifypanModel(
      version: json['Version'] ?? "",
      statusCode: json['StatusCode'] ?? 0,
      message: json['Message'] ?? "",
      transactionId: json['TransactionId'] ?? 0,
      result: Result.fromJson(json['Result'] ?? {}),
    );
  }
}

class Result {
  final String activityStatus;
  final InnerResult? innerResult;
  final String nextprocess;
  final String requestId;
  final String statusCode;

  Result({
    required this.activityStatus,
    required this.innerResult,
    required this.nextprocess,
    required this.requestId,
    required this.statusCode,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      activityStatus: json['ActivityStatus'] ?? "",
      innerResult: json['result'] != null && json['result'] != "" ? InnerResult
          .fromJson(json['result']) : null,
      nextprocess: json["NextProcess"] ?? "",
      requestId: json['requestId'] ?? "",
      statusCode: json['statusCode'] ?? "",
    );
  }

}

class InnerResult {
  final String name;
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String aadhaarLinked;
  final String dob;
  final Address address;
  final dynamic mobileNo;
  final dynamic emailId;
  final String status;
  final String issueDate;
  final bool isSalaried;
  final bool isDirector;
  final bool isSoleProp;

  InnerResult({
    required this.name,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.aadhaarLinked,
    required this.dob,
    required this.address,
    required this.mobileNo,
    required this.emailId,
    required this.status,
    required this.issueDate,
    required this.isSalaried,
    required this.isDirector,
    required this.isSoleProp,
  });

  factory InnerResult.fromJson(Map<String, dynamic> json) {
    return InnerResult(
      name: json['name'] ?? "",
      firstName: json['firstName'] ?? "",
      middleName: json['middleName'] ?? "",
      lastName: json['lastName'] ?? "",
      gender: json['gender'] ?? "",
      aadhaarLinked: json['aadhaarLinked'] ?? "",
      dob: json['dob'] ?? "",
      address: Address.fromJson(json['address'] ?? {}),
      mobileNo: json['mobileNo'] ?? "",
      emailId: json['emailId'] ?? "",
      status: json['status'] ?? "",
      issueDate: json['issueDate'] ?? "",
      isSalaried: json['isSalaried'] ?? false,
      isDirector: json['isDirector'] ?? false,
      isSoleProp: json['isSoleProp'] ?? false,
    );
  }
}

class Address {
  final String buildingName;
  final String locality;
  final String streetName;
  final String pinCode;
  final String city;
  final String state;

  Address({
    required this.buildingName,
    required this.locality,
    required this.streetName,
    required this.pinCode,
    required this.city,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      buildingName: json['buildingName'] ?? "",
      locality: json['locality'] ?? "",
      streetName: json['streetName'] ?? "",
      pinCode: json['pinCode'] ?? "",
      city: json['city'] ?? "",
      state: json['state'] ?? "",
    );
  }
}