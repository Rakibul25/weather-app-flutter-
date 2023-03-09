import 'package:flutter/material.dart';
import 'package:weather/logic/bloc/weatherbloc.dart';
import 'package:weather/logic/bloc/weatherevent.dart';
import 'package:weather/logic/bloc/weatherstate.dart';
import 'package:weather/private_data/fetchweather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FetchWeather fetchWeather = FetchWeather();
  @override
  void initState() {
    // TODO: implement initState
    fetchWeather.getWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocBuilder<WeatherBloc, weatherState>(
        builder: (context,state){
          if(state is InitialSate){
            BlocProvider.of<WeatherBloc>(context).add(HomeCall());
            return Center(
              child: CircularProgressIndicator(),
            );
          }




          return const Center(
            //this is for if something occur in this process
            child: Text("error!"),
          );
        },
      )
    );
  }
}
