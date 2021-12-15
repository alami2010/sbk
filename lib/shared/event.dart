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
}
