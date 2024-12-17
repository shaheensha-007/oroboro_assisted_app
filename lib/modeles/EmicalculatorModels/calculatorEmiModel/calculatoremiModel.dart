class CalculatoremiModel {
  CalculatoremiModel({
      this.transactionId, 
      this.responseCode, 
      this.status, 
      this.responseStatus, 
      this.responseMessage, 
      this.errorMessage, 
      this.result,});

  CalculatoremiModel.fromJson(dynamic json) {
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
    this.baseLoanAmount,
    this.loanAmount,
    this.addOnCharge,
    this.downPayment,
    this.tenure,
    this.frequency,
    this.emi,
    this.processingFee,
    this.payableAtStore,
  });

  Result.fromJson(dynamic json) {
    baseLoanAmount = json['BaseLoanAmount'];
    loanAmount = json['LoanAmount'];
    addOnCharge = (json['AddOnCharge'] as num?)?.toInt();
    downPayment = json['DownPayment'];
    tenure = json['Tenure'];
    frequency = json['Frequency'];
    emi = json['EMI'];
    processingFee = (json['ProcessingFee'] as num?)?.toInt();
    payableAtStore = (json['PayableAtStore'] as num?)?.toInt();
  }

  double? baseLoanAmount;
  double? loanAmount;
  int? addOnCharge;
  double? downPayment;
  int? tenure;
  String? frequency;
  double? emi;
  int? processingFee;
  int? payableAtStore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BaseLoanAmount'] = baseLoanAmount;
    map['LoanAmount'] = loanAmount;
    map['AddOnCharge'] = addOnCharge;
    map['DownPayment'] = downPayment;
    map['Tenure'] = tenure;
    map['Frequency'] = frequency;
    map['EMI'] = emi;
    map['ProcessingFee'] = processingFee;
    map['PayableAtStore'] = payableAtStore;
    return map;
  }
}

