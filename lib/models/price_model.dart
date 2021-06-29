class PriceData {
  String time;
  String assetIdBase;
  String assetIdQuote;
  double rate;
  List<SrcSideQuote> srcSideQuote;

  PriceData(
      {this.time,
      this.assetIdBase,
      this.assetIdQuote,
      this.rate,
      this.srcSideQuote});

  PriceData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    rate = json['rate'];
    if (json['src_side_quote'] != null) {
      srcSideQuote = new List<SrcSideQuote>();
      json['src_side_quote'].forEach((v) {
        srcSideQuote.add(new SrcSideQuote.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['asset_id_base'] = this.assetIdBase;
    data['asset_id_quote'] = this.assetIdQuote;
    data['rate'] = this.rate;
    if (this.srcSideQuote != null) {
      data['src_side_quote'] =
          this.srcSideQuote.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SrcSideQuote {
  String time;
  String asset;
  double rate;
  double volume;

  SrcSideQuote({this.time, this.asset, this.rate, this.volume});

  SrcSideQuote.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    asset = json['asset'];
    rate = json['rate'];
    // volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['asset'] = this.asset;
    data['rate'] = this.rate;
    // data['volume'] = this.volume;
    return data;
  }
}
