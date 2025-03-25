class UserModel {
  final int id;
  final String name;
  final String userName;
  final String emil;
  final AdresModel address;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.emil,
    required this.address,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'] ?? '',
      userName: map['username'] ?? '',
      emil: map['email'] ?? '',
      address: AdresModel.fromMap(
        map['adress'] ?? {},
      ),
    );
  }
}

class AdresModel {
  final String street;
  final String suite;
  final String sity;
  final String zipcode;
  final GeoModel get;

  AdresModel({
    required this.street,
    required this.suite,
    required this.sity,
    required this.zipcode,
    required this.get,
  });

  factory AdresModel.fromMap(Map<String, dynamic> map) {
    return AdresModel(
      street: map['street'] ?? '',
      suite: map['suite'] ?? '',
      sity: map['sity'] ?? '',
      zipcode: map['zipcode'] ?? '',
      get: GeoModel.fromMap(
        map['get'] ?? {},
      ),
    );
  }
}

class GeoModel {
  final String lat;
  final String lng;

  GeoModel({required this.lat, required this.lng});

  factory GeoModel.fromMap(Map<String, dynamic> map) {
    return GeoModel(lat: map['lat'] ?? '', lng: map['lnd'] ?? '');
  }
}
