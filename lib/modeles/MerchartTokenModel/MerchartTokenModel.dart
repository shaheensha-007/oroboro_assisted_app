class MerchartTokenModel {
  MerchartTokenModel({
      this.jwtToken, 
      this.expiry,});

  MerchartTokenModel.fromJson(dynamic json) {
    jwtToken = json['jwtToken'];
    expiry = json['expiry'];
  }
  String? jwtToken;
  String? expiry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jwtToken'] = jwtToken;
    map['expiry'] = expiry;
    return map;
  }

}