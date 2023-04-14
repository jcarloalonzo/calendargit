// // To parse this JSON data, do
// //
// //     final servicesByCategoriesRequest = servicesByCategoriesRequestFromJson(jsonString);

// import 'dart:convert';

// class ServicesByCategoriesRequest {
//   ServicesByCategoriesRequest({
//     required this.id,
//   });
//   factory ServicesByCategoriesRequest.fromJson(Map<String, dynamic> json) =>
//       ServicesByCategoriesRequest(
//         id: json['ID'],
//       );

//   int id;

//   Map<String, dynamic> toJson() => {
//         'ID': id,
//       };

//   static List<ServicesByCategoriesRequest> servicesByCategoriesRequestFromJson(
//           String str) =>
//       List<ServicesByCategoriesRequest>.from(
//           json.decode(str).map((x) => ServicesByCategoriesRequest.fromJson(x)));

//   static String servicesByCategoriesRequestToJson(
//           List<ServicesByCategoriesRequest> data) =>
//       json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
// }
