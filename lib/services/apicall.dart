import 'package:dio/dio.dart';

class apicalls{

  Dio dio = Dio();

  dataFromAPI() async{
    String apiurl = "https://api.weatherapi.com/v1/current.json?key=c7bd9290554b423d8f3145317232008&q=28.7041,77.1025";

    try{
      var response = await dio.get(apiurl);
      return response.data;
    }
    catch(error){
      print("error is ${error}");
    }
  }
}