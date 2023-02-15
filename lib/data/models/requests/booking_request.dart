class GetBookingListRequest {
  int? businessID;
  int? personID;
  String? initialDate;
  String? finalDate;
  int? bookingStateID;
  GetBookingListRequest({
    this.businessID,
    this.personID,
    this.initialDate,
    this.finalDate,
    this.bookingStateID,
  });
}

class GetTurnRequest {
  int? personID;
  String? dateProgram;
  int? serviceID;
  GetTurnRequest({
    this.personID,
    this.dateProgram,
    this.serviceID,
  });
}

