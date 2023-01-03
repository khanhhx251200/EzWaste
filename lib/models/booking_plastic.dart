
class BookingPlastic {
  String address;
  String time;
  String note;

  BookingPlastic(this.address, this.time, this.note);

  Map<String, dynamic> toJson() => {
    "noteSeller": note,
    "typeGarbage": 2, // 1: Rác sinh hoạt, 2: Rác tái chế
    "dateBooking": time,
  };
}