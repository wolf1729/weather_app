import 'package:flutter/material.dart';
import 'package:weather_app/services/apicall.dart';
import 'package:weather_app/services/apimodel.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  apicalls data = apicalls();
  Map <String, dynamic> requiredata = {};
  datafromjson? weatherdata;

  gettingdata() async {
    Map <String, dynamic> alldata = await data.dataFromAPI();
    requiredata = alldata['current'];
  }

  Future<dynamic> finaldata() async {
    await gettingdata();
    weatherdata = datafromjson.extract(requiredata);
    if(weatherdata != null){
      return weatherdata;
    }
    else{
      print("no data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Weather", style: GoogleFonts.getFont('VT323', textStyle: TextStyle(color: Colors.white))),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.refresh, color: Colors.white,))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: finaldata(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        CircularProgressIndicator(color: Colors.white,)
                      ],
                    ),
                  );
                }
                else if(snapshot.hasError){
                  return Text("error is ${snapshot.error}");
                }
                else if(snapshot.hasData){
                  return Center(
                    child: Card(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text("Tempreture : ${snapshot.data!.temp.toString()}", style: GoogleFonts.getFont('VT323', textStyle: TextStyle(fontSize: 20, color: Colors.white)),),
                          Text("Tempreture Feels Like : ${snapshot.data!.feelslike.toString()}", style: GoogleFonts.getFont('VT323', textStyle: TextStyle(fontSize: 20, color: Colors.white))),
                          Text("Humidity : ${snapshot.data!.humidity.toString()}", style: GoogleFonts.getFont('VT323', textStyle: TextStyle(fontSize: 20, color: Colors.white)))
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              }),
          ],
        ),
      ));
    }
  }
