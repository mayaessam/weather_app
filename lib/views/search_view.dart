import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Search City'),

      ),

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value)async{
        var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
        getWeatherCubit.getWeather(cityName:value);
            Navigator.pop(context);

            },

            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16,
              vertical: 32),
              labelText: 'Search',
              hintText: 'Enter city name',
             suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(

                borderSide: BorderSide(
                  color: Colors.green
                )

              ),

            ),
          ),
        ),
      ) ,
    );
  }
}