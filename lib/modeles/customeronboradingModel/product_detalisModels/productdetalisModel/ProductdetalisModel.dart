class ProductdetalisModel {
  final int transactionId;
  final int responseCode;
  final String status;
  final int responseStatus;
  final String responseMessage;
  final String errorMessage;
  final LoanProduct result;

  ProductdetalisModel({
    required this.transactionId,
    required this.responseCode,
    required this.status,
    required this.responseStatus,
    required this.responseMessage,
    required this.errorMessage,
    required this.result,
  });

  factory ProductdetalisModel.fromJson(Map<String, dynamic> json) {
    return ProductdetalisModel(
      transactionId: json['TransactionId'] ?? 0,
      responseCode: json['ResponseCode'] ?? 0,
      status: json['Status'] ?? '',
      responseStatus: json['ResponseStatus'] ?? 0,
      responseMessage: json['ResponseMessage'] ?? '',
      errorMessage: json['ErrorMessage'] ?? '',
      result: LoanProduct.fromJson(json['Result'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TransactionId': transactionId,
      'ResponseCode': responseCode,
      'Status': status,
      'ResponseStatus': responseStatus,
      'ResponseMessage': responseMessage,
      'ErrorMessage': errorMessage,
      'Result': result.toJson(),
    };
  }
}

class LoanProduct {
  final String productId;
  final String productName;
  final String productType;
  final String loanType;
  final double minLoanAmount;
  final double maxLoanAmount;
  final double irr;
  final bool dtiStatus;
  final double dtiRatio;
  final List<LoanTenure> tenure;
  final List<AddOn> addOns;
  final List<AllowedAmount> allowedAmounts;
  final dynamic repaySchedule;

  LoanProduct({
    required this.productId,
    required this.productName,
    required this.productType,
    required this.loanType,
    required this.minLoanAmount,
    required this.maxLoanAmount,
    required this.irr,
    required this.dtiStatus,
    required this.dtiRatio,
    required this.tenure,
    required this.addOns,
    required this.allowedAmounts,
    this.repaySchedule,
  });

  factory LoanProduct.fromJson(Map<String, dynamic> json) {
    return LoanProduct(
      productId: json['Product_Id'] ?? '',
      productName: json['Product_Name'] ?? '',
      productType: json['Product_Type'] ?? '',
      loanType: json['Loan_Type'] ?? '',
      minLoanAmount: (json['Min_LoanAmount'] ?? 0.0).toDouble(),
      maxLoanAmount: (json['Max_LoanAmount'] ?? 0.0).toDouble(),
      irr: (json['IRR'] ?? 0.0).toDouble(),
      dtiStatus: json['DTI_Status'] ?? false,
      dtiRatio: (json['DTI_Ratio'] ?? 0.0).toDouble(),
      tenure: (json['Tenure'] as List?)
          ?.map((tenureJson) => LoanTenure.fromJson(tenureJson))
          .toList() ?? [],
      addOns: (json['AddOns'] as List?)
          ?.map((addOnJson) => AddOn.fromJson(addOnJson))
          .toList() ?? [],
      allowedAmounts: (json['AllowedAmounts'] as List?)
          ?.map((amountJson) => AllowedAmount.fromJson(amountJson))
          .toList() ?? [],
      repaySchedule: json['RepaySchedule'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Product_Id': productId,
      'Product_Name': productName,
      'Product_Type': productType,
      'Loan_Type': loanType,
      'Min_LoanAmount': minLoanAmount,
      'Max_LoanAmount': maxLoanAmount,
      'IRR': irr,
      'DTI_Status': dtiStatus,
      'DTI_Ratio': dtiRatio,
      'Tenure': tenure.map((t) => t.toJson()).toList(),
      'AddOns': addOns.map((a) => a.toJson()).toList(),
      'AllowedAmounts': allowedAmounts.map((a) => a.toJson()).toList(),
      'RepaySchedule': repaySchedule,
    };
  }
}

class LoanTenure {
  final String tenureId;
  final int tenure;
  final String frequency;
  final double brInterest;
  final double flatInterest;
  final bool dpStatus;
  final String dpChargeType;
  final double dpValue;
  final bool advanceEmiStatus;
  final int advanceEmiCount;
  final bool penalChargeStatus;
  final bool otherChargeStatus;
  final dynamic ntcLimit;
  final bool status;

  LoanTenure({
    required this.tenureId,
    required this.tenure,
    required this.frequency,
    required this.brInterest,
    required this.flatInterest,
    required this.dpStatus,
    required this.dpChargeType,
    required this.dpValue,
    required this.advanceEmiStatus,
    required this.advanceEmiCount,
    required this.penalChargeStatus,
    required this.otherChargeStatus,
    this.ntcLimit,
    required this.status,
  });

  factory LoanTenure.fromJson(Map<String, dynamic> json) {
    return LoanTenure(
      tenureId: json['Tenure_Id'] ?? '',
      tenure: json['Tenure'] ?? 0,
      frequency: json['Frequency'] ?? '',
      brInterest: (json['BR_interest'] ?? 0.0).toDouble(),
      flatInterest: (json['Flat_interest'] ?? 0.0).toDouble(),
      dpStatus: json['DP_Status'] ?? false,
      dpChargeType: json['DP_ChargeType'] ?? '',
      dpValue: (json['DP_Value'] ?? 0.0).toDouble(),
      advanceEmiStatus: json['Advance_EMI_Status'] ?? false,
      advanceEmiCount: json['Advance_EMI_Count'] ?? 0,
      penalChargeStatus: json['PenalCharge_Status'] ?? false,
      otherChargeStatus: json['OtherCharge_Status'] ?? false,
      ntcLimit: json['NTCLimit'],
      status: json['Status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Tenure_Id': tenureId,
      'Tenure': tenure,
      'Frequency': frequency,
      'BR_interest': brInterest,
      'Flat_interest': flatInterest,
      'DP_Status': dpStatus,
      'DP_ChargeType': dpChargeType,
      'DP_Value': dpValue,
      'Advance_EMI_Status': advanceEmiStatus,
      'Advance_EMI_Count': advanceEmiCount,
      'PenalCharge_Status': penalChargeStatus,
      'OtherCharge_Status': otherChargeStatus,
      'NTCLimit': ntcLimit,
      'Status': status,
    };
  }
}

class AddOn {
  final String addOnId;
  final String addOnName;
  final String chargeType;
  final double value;
  final double gst;
  final bool status;

  AddOn({
    required this.addOnId,
    required this.addOnName,
    required this.chargeType,
    required this.value,
    required this.gst,
    required this.status,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) {
    return AddOn(
      addOnId: json['AddOn_Id'] ?? '',
      addOnName: json['AddOn_Name'] ?? '',
      chargeType: json['Charge_Type'] ?? '',
      value: (json['Value'] ?? 0.0).toDouble(),
      gst: (json['GST'] ?? 0.0).toDouble(),
      status: json['Status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AddOn_Id': addOnId,
      'AddOn_Name': addOnName,
      'Charge_Type': chargeType,
      'Value': value,
      'GST': gst,
      'Status': status,
    };
  }
}

class AllowedAmount {
  final double amount;
  final bool status;

  AllowedAmount({
    required this.amount,
    required this.status,
  });

  factory AllowedAmount.fromJson(Map<String, dynamic> json) {
    return AllowedAmount(
      amount: (json['Amount'] ?? 0.0).toDouble(),
      status: json['Status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount,
      'Status': status,
    };
  }
}