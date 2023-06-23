class GetBookingListRequest {
  GetBookingListRequest({
    this.businessID,
    this.personID,
    this.initialDate,
    this.finalDate,
    this.bookingStateID,
  });
  int? businessID;
  int? personID;
  String? initialDate;
  String? finalDate;
  int? bookingStateID;
}

class ProgramGetTurnRequest {
  ProgramGetTurnRequest({
    this.personID,
    this.dateProgram,
    this.serviceID,
  });
  int? personID;
  String? dateProgram;
  int? serviceID;
}
