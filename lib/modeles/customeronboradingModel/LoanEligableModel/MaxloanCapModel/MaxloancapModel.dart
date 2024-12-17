class MaxloancapModel {
  MaxloancapModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  MaxloancapModel.fromJson(dynamic json) {
    transactionId = json['transactionId'];
    responseCode = json['responseCode'];
    status = json['status'];
    responseStatus = json['responseStatus'];
    responseMessage = json['responseMessage'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
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
    map['transactionId'] = transactionId;
    map['responseCode'] = responseCode;
    map['status'] = status;
    map['responseStatus'] = responseStatus;
    map['responseMessage'] = responseMessage;
    map['errorMessage'] = errorMessage;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

class Result {
  Result({
      this.score, 
      this.maxLoanCap, 
      this.evaluatedResults,});

  Result.fromJson(dynamic json) {
    score = json['score'];
    maxLoanCap = json['maxLoanCap'];
    if (json['evaluatedResults'] != null) {
      evaluatedResults = [];
      json['evaluatedResults'].forEach((v) {
        evaluatedResults?.add(EvaluatedResults.fromJson(v));
      });
    }
  }
  int? score;
  int? maxLoanCap;
  List<EvaluatedResults>? evaluatedResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['score'] = score;
    map['maxLoanCap'] = maxLoanCap;
    if (evaluatedResults != null) {
      map['evaluatedResults'] = evaluatedResults?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class EvaluatedResults {
  EvaluatedResults({
      this.condition, 
      this.expectedValue, 
      this.recievedValue, 
      this.isPassed, 
      this.status, 
      this.exceptionMessage, 
      this.output,});

  EvaluatedResults.fromJson(dynamic json) {
    condition = json['condition'];
    expectedValue = json['expectedValue'];
    recievedValue = json['recievedValue'];
    isPassed = json['isPassed'];
    status = json['status'];
    exceptionMessage = json['exceptionMessage'];
    output = json['output'];
  }
  String? condition;
  String? expectedValue;
  String? recievedValue;
  bool? isPassed;
  String? status;
  dynamic exceptionMessage;
  String? output;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['condition'] = condition;
    map['expectedValue'] = expectedValue;
    map['recievedValue'] = recievedValue;
    map['isPassed'] = isPassed;
    map['status'] = status;
    map['exceptionMessage'] = exceptionMessage;
    map['output'] = output;
    return map;
  }

}