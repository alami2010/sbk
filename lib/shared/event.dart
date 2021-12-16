class Event {
  // field
  double id;
  String title;
  String date;
  String startHour;
  String endHour;
  String period;
  double price;
  String type;
  bool isLive;
  String country;
  String address;
  String addLat;
  String addLong;
  String image;
  String link;
  String phone;
  String email;
  String description;

  Event(
      this.id,
      this.title,
      this.date,
      this.startHour,
      this.endHour,
      this.period,
      this.price,
      this.type,
      this.isLive,
      this.country,
      this.address,
      this.addLat,
      this.addLong,
      this.image,
      this.link,
      this.phone,
      this.email,
      this.description); // function
  void disp() {}

  factory Event.fromJson(dynamic json) {
    return Event(
        checkDouble(json['id']),
        json['title'] as String,
        json['date'] as String,
        json['startHour'] as String,
        json['endHour'] as String,
        json['period'] as String,
        checkDouble(json['price']),
        json['type'] as String,
        json['isLive'] as bool,
        json['country'] as String,
        json['address'] as String,
        json['addLat'] as String,
        json['addLong'] as String,
        json['image'] as String,
        json['link'] as String,
        json['phone'] as String,
        json['email'] as String,
        json['description'] as String);
  }
  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }
}


