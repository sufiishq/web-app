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
  Gregorian? gregorian;

  Data({this.hijri, this.gregorian});

  Data.fromJson(Map<String, dynamic> json) {
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json['gregorian'])
        : null;
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
  HijriMonth? month;
  String? year;
  Designation? designation;

  Hijri({date, format, day, month, year, designation});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    month = json['month'] != null ? HijriMonth.fromJson(json['month']) : null;
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

class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  GregorianMonth? month;
  String? year;
  Designation? designation;

  Gregorian(
      {this.date,
      this.format,
      this.day,
      this.weekday,
      this.month,
      this.year,
      this.designation});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month =
        json['month'] != null ? GregorianMonth.fromJson(json['month']) : null;
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
    if (this.weekday != null) {
      data['weekday'] = this.weekday!.toJson();
    }
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

class HijriMonth {
  int? number;
  String? en;
  String? ar;

  HijriMonth({this.number, this.en, this.ar});

  HijriMonth.fromJson(Map<String, dynamic> json) {
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

class GregorianMonth {
  int? number;
  String? en;

  GregorianMonth({this.number, this.en});

  GregorianMonth.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = this.number;
    data['en'] = this.en;
    return data;
  }
}

class Weekday {
  String? en;

  Weekday({this.en});

  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = this.en;
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
