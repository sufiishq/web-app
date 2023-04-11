class HijriDateModel {
  int? code;
  String? status;
  Data? data;

  HijriDateModel({this.code, this.status, this.data});

  HijriDateModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Hijri? hijri;
  Hijri? gregorian;

  Data({this.hijri, this.gregorian});

  Data.fromJson(Map<String, dynamic> json) {
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian =
        json['gregorian'] != null ? Hijri.fromJson(json['gregorian']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hijri != null) {
      data['hijri'] = hijri!.toJson();
    }
    if (gregorian != null) {
      data['gregorian'] = gregorian!.toJson();
    }
    return data;
  }
}

class Hijri {
  String? date;
  String? format;
  String? day;
  Month? month;
  String? year;
  Designation? designation;

  Hijri(
      {this.date,
      this.format,
      this.day,
      this.month,
      this.year,
      this.designation});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['format'] = format;
    data['day'] = day;
    if (month != null) {
      data['month'] = month!.toJson();
    }
    data['year'] = year;
    if (designation != null) {
      data['designation'] = designation!.toJson();
    }
    return data;
  }
}

class Month {
  int? number;
  String? en;
  String? ar;

  Month({this.number, this.en, this.ar});

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['en'] = en;
    data['ar'] = ar;
    return data;
  }
}

class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  Designation.fromJson(Map<String, dynamic> json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abbreviated'] = abbreviated;
    data['expanded'] = expanded;
    return data;
  }
}
