import 'package:flutter/material.dart';
import 'package:weather/logic/bloc/weatherbloc.dart';
import 'package:weather/logic/bloc/weatherevent.dart';
import 'package:weather/logic/bloc/weatherstate.dart';
import 'package:weather/private_data/fetchweather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../widgets/halfcircle.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController query = TextEditingController();
  String hints = "Enter City Name";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black38,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 100,
                      child: TextField(
                        controller: query,
                        decoration: InputDecoration(
                          hintText: hints,
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.white),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                BlocProvider.of<WeatherBloc>(context)
                                    .add(SearchIconPressed(query.text));
                              },
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(locatePressed());
                            },
                            child: Icon(
                              Icons.my_location_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Trace",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<WeatherBloc, weatherState>(
                  builder: (context, state) {
                    if (state is InitialSate) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ResultLoadedStateWithcordinate) {
                      int temperature = state.weatherInfo.main.temp.round();
                      DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(state.weatherInfo.sys.sunrise * 1000);
                      DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(state.weatherInfo.sys.sunset * 1000);
                      String sunriseTime = DateFormat('h:mm a').format(sunriseDateTime);
                      String sunsetTime = DateFormat('h:mm a').format(sunsetDateTime);
                      DateTime now = DateTime.now();
                      double progressValue = 0.0;
                      if (now.isBefore(sunriseDateTime)) {
                        progressValue = 0.0;
                      } else if (now.isAfter(sunsetDateTime)) {
                        progressValue = 1.0;
                      } else {
                        progressValue = (now.millisecondsSinceEpoch - sunriseDateTime.millisecondsSinceEpoch) /
                            (sunsetDateTime.millisecondsSinceEpoch - sunriseDateTime.millisecondsSinceEpoch);
                      }
                      print(sunriseDateTime.toString());

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: size.width * .9,
                              height: size.height * .35,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(25.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          
                                          children: [
                                            Text(
                                              "$temperature°C",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${state.placemark.subLocality}, ${state.placemark.locality}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            Text("${state.placemark.country}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8.0),
                                                    child: Image.asset(
                                                      "assets/icon/${state.weatherInfo.weather[0].icon.toString()}.png",
                                                      height: 100,
                                                      width: 100,
                                                    )),
                                                Text(
                                                    "${state.weatherInfo.weather[0].description.toString()}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Icon(Icons.sunny_snowing,color: Colors.white,),
                                            Text('Sunrise: $sunriseTime',style: TextStyle(color: Colors.white),)
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Container(height:100,width: 100,  child: HalfCircleProgressBar(progressValue: progressValue)),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Icon(Icons.mode_night,color: Colors.white,),
                                            Text('Sunset: $sunsetTime',style: TextStyle(color: Colors.white),)
                                          ],
                                        ),

                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Share Weather",
                                          style: TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    if (state is ResultLoadedStateWithquery) {
                      int temperature = state.weatherInfo.main.temp.round();
                      int ms = state.weatherInfo.sys.sunrise*1000;
                      DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(state.weatherInfo.sys.sunrise * 1000).toUtc();
                      DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(state.weatherInfo.sys.sunset * 1000).toUtc();
                      DateTime actualsunriseDateTime = sunriseDateTime.add(Duration(seconds: state.weatherInfo.timezone));
                      DateTime actualsunsetDateTime = sunsetDateTime.add(Duration(seconds: state.weatherInfo.timezone));
                      String sunriseTime = DateFormat('h:mm a').format(actualsunriseDateTime);
                      String sunsetTime = DateFormat('h:mm a').format(actualsunsetDateTime);
                      DateTime now = DateTime.now();
                      DateTime londonTime = DateTime.now().toUtc();
                      DateTime utcNow = now.toUtc();


                      double progressValue = 0.0;
                      if (now.isBefore(sunriseDateTime)) {
                        progressValue = 0.0;
                      } else if (now.isAfter(sunsetDateTime)) {
                        progressValue = 1.0;
                      } else {
                        progressValue = (utcNow.millisecondsSinceEpoch - sunriseDateTime.millisecondsSinceEpoch) /
                            (sunsetDateTime.millisecondsSinceEpoch - sunriseDateTime.millisecondsSinceEpoch);
                      }



                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: size.width * .9,
                              height: size.height * .35,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(25.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(

                                          children: [
                                            Text(
                                              "$temperature°C",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${state.weatherInfo.name}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 8.0),
                                                    child: Image.asset(
                                                      "assets/icon/${state.weatherInfo.weather[0].icon.toString()}.png",
                                                      height: 100,
                                                      width: 100,
                                                    )),
                                                Text(
                                                    "${state.weatherInfo.weather[0].description.toString()}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Icon(Icons.sunny,color: Colors.white,),
                                            Text('Sunrise: $sunriseTime',style: TextStyle(color: Colors.white),)
                                          ],
                                        ),
                                        SizedBox(width: 5,),
                                        Container(height:80,width: 80,  child: HalfCircleProgressBar(progressValue: progressValue)),
                                        SizedBox(width: 5,),
                                        Column(
                                          children: [
                                            Icon(Icons.mode_night,color: Colors.white,),
                                            Text('Sunset: $sunsetTime',style: TextStyle(color: Colors.white),)
                                          ],
                                        ),

                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Share Weather",
                                          style: TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    if (state is NoResultState) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    }
                    if (state is ResultLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is NoInternet) {
                      return Center(
                        child: Text(
                          "No Internet",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    if (state is Notmatched) {
                      return Center(
                        child: Text("Not Matched",
                            style: TextStyle(color: Colors.white)),
                      );
                    }
                    if (state is LocationNotEnabled) {
                      return Center(
                        child: Text("Location not enabled",
                            style: TextStyle(color: Colors.white)),
                      );
                    }

                    return const Center(
                      //this is for if something occur in this process
                      child:
                          Text("error!", style: TextStyle(color: Colors.white)),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
