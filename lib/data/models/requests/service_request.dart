class GetPriceRequest {
  GetPriceRequest({
    this.businessID,
    this.officeID,
    this.serviceID,
    this.date,
  });
  int? businessID;
  int? officeID;
  int? serviceID;
  String? date;
}
