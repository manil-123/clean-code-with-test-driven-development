class ProfileEntity {
  final Address? address;
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final String? phone;
  final int? iV;

  ProfileEntity(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});
}

class Address {
  final Geolocation? geolocation;
  final String? city;
  final String? street;
  final int? number;
  final String? zipcode;

  Address(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});
}

class Geolocation {
  final String? lat;
  final String? long;

  Geolocation({this.lat, this.long});
}

class Name {
  final String? firstname;
  final String? lastname;

  Name({this.firstname, this.lastname});
}
