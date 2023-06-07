class ModelFirebase {
  String? name;
  String? surname;
  String? email;
  int? telefon;

  ModelFirebase({this.name, this.surname, this.email, this.telefon});

  ModelFirebase.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    telefon = json['telefon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    data['email'] = email;
    data['telefon'] = telefon;
    return data;
  }
}
