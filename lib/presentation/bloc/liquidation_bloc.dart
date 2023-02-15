import 'dart:convert';
import 'dart:io';

import 'package:calendario/core/config/config.dart';
import 'package:calendario/data/models/entities/liquidation_model.dart';
import 'package:calendario/data/models/entities/response_model.dart';
import 'package:calendario/data/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class LiquidationBloc extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

int _userID =0 ;

int _businessID =0 ;
DateTime? _liqDate;

  ResponseModel? _responseModel;
  ResponseModel? get responseModel {
    return _responseModel;
  }


  LiquidationAmount? _liquidationAmount;

  LiquidationAmount? get liquidationAmount {
    return _liquidationAmount;
  }


  List<LiquidationDetails>  _liquidationDetails= [];

  List<LiquidationDetails>  get liquidationDetails {
    return _liquidationDetails;
  }



  set responseModel(ResponseModel? v) {
    _responseModel = v;
    notifyListeners();
  }



  void init({required int userID, required int businessID,required DateTime liqDate }) async{
    _userID=userID;
    _businessID=businessID;
    _liqDate=liqDate;
    _isLoading=true;
    final responseAmount=await  APIServices.getLiquidationAmount(userID: userID, liqDate: Config.formatDate(liqDate, 'yyyy-MM-dd') , businessID: businessID);
    _responseModel=responseAmount;
    if(responseAmount!.statusCode==200)
    {
      _liquidationAmount=responseAmount.data;
       final responseDetails=await  APIServices.getLiquidationDetails(userID: userID, liqDate: Config.formatDate(liqDate, 'yyyy-MM-dd') , businessID: businessID);
      _responseModel=responseDetails;
      if(responseDetails.statusCode==200)
      {
          _liquidationDetails=responseDetails.data!;
      }
    }
    _isLoading=false;
    notifyListeners();

  }

   Future<String> getReportExcel()async
   {
     _isLoading=true;
     notifyListeners();
     final responseExcel=await  APIServices.getReportLiquidationExcel(userID: _userID, liqDate: Config.formatDate(_liqDate!, 'yyyy-MM-dd') , businessID: _businessID);
    _responseModel=responseExcel;
     _isLoading=false;
    notifyListeners();
    if(responseExcel.statusCode==200)
    {
        return responseExcel.data!;
    }
    else
    {
        return '';
    }
   }



  Future<String> setFile64xls(String s) async {
    var dir = await getTemporaryDirectory();
    DateTime now=DateTime.now();
    File file =   File(dir.path +
        '/REPORTVENTA-${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}.xlsx');
    final decodedBytes = base64Decode(s);

    file.writeAsBytes(decodedBytes, flush: true);
    String fullPath = file.path;

    return fullPath;
  }

}
