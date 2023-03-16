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
                      width: 250,
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
                            onTap: (){
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(locatePressed());
                            },
                            child: Icon(
                              Icons.my_location_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("Trace",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(locatePressed());
                            },
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("Share", style: TextStyle(color: Colors.white),)
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
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: size.width*.9,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10,)
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    if(state is ResultLoadedStateWithquery){
                      return Center(
                        child: Text(state.weatherInfo.main.temp.toString()),
                      );
                    }
                    if (state is NoResultState) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    }
                    if(state is ResultLoadingState){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is NoInternet){
                      return Center(
                        child: Text("No Internet"),
                      );
                    }
                    if(state is Notmatched){
                      return Center(
                        child: Text("Not Matched"),
                      );
                    }
                    if(state is LocationNotEnabled){
                      return Center(
                        child: Text("Location not enabled"),
                      );
                    }

                    return const Center(
                      //this is for if something occur in this process
                      child: Text("error!"),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
