import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

import 'json/weather_in_cities.dart';
import 'package:rx_command/rx_command.dart';


  class WeatherViewModel {
  

    final _textChangedSubject = new BehaviorSubject<String>() ;

    // Callback function that will be registered to the TextFields OnChanged Event
    // a Rx Subject behaves like a Dart StreamSink
    onFilterEntryChanged(String s) => _textChangedSubject.add(s); 


    RxCommand<String,List<WeatherEntry>>  updateWeatherCommand;
    RxCommand<bool,bool>  switchChangedCommand;


    WeatherViewModel()
    {

        // Command expects a bool value when executed and issues the value on it's result Observable (stream)
        switchChangedCommand = RxCommand.createSync3<bool,bool>((b)=>b);

        // We pass the result of switchChangedCommand as canExecute Observable to the upDateWeatherCommand
        updateWeatherCommand = RxCommand.createAsync3<String,List<WeatherEntry>>(update,switchChangedCommand.results);


        // Update data on startup
        updateWeatherCommand.execute();

        // initialize input listener for the Searchfield
        _textChangedSubject.observable
          .debounce( new Duration(milliseconds: 500))  // make sure we start processing only if the user make a short pause typing 
            .listen( (filterText)
            {
              updateWeatherCommand.execute( filterText);
            });  
    }



    // Async function that queries the REST API and converts the result into the form our ListViewBuilder can consume
    Future<List<WeatherEntry>> update(String filtertext)
    {


      const String url = "http://api.openweathermap.org/data/2.5/box/city?bbox=5,47,14,54,20&appid=27ac337102cc4931c24ba0b50aca6bbd";  
      

      var httpStream = new Observable(http.get(url).asStream()); 

      return httpStream
              .where((data) => data.statusCode == 200)  // only continue if valid response
                .map( (data) // convert JSON result into a List of WeatherEntries
                {
                      return new WeatherInCities.fromJson(json.decode(data.body)).Cities // we are only interested in the Cities part of the response
                        .where( (weatherInCity) =>  filtertext ==null || 
                                                    filtertext.isEmpty ||  // if filtertext is null or empty we return all returned entries
                                                    weatherInCity.Name.toUpperCase().startsWith(filtertext.toUpperCase())) // otherwise only matching entries
                          .map((weatherInCity) => new WeatherEntry(weatherInCity) ) // Convert City object to WeatherEntry
                            .toList(); // aggregate entries to a List
                            
                }).first; // Return result as Future
          
    }
 
    }
                          
 

class WeatherEntry {
   String cityName;
   String iconURL;
   double wind;
   double rain;
   double temperature;
   String description;

  WeatherEntry(City city)
  {
      this.cityName = city.Name;
      this.iconURL = city.weather != null ?  "http://openweathermap.org/img/w/${city.weather[0].Icon}.png" :  null;
      this.description = city.weather != null ?  city.weather[0].Description : null;
      this.wind =city.wind.Speed;
      this.rain = rain;
      this.temperature = city.main.Temp;

  }
}
