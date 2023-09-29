import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              ),
            ),
            home: const HomeView(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.lightBlue;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Freezing drizzle':
    case 'Light freezing rain':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
    case 'Patchy light rain with thunder':
      return Colors.green;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy light snow with thunder':
      return Colors.blue;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Light sleet showers':
      return Colors.cyan;
    case 'Patchy freezing drizzle possible':
    case 'Moderate or heavy freezing rain':
      return Colors.indigo;
    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
    case 'Moderate or heavy showers of ice pellets':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepOrange;
    case 'Blowing snow':
    case 'Blizzard':
    case 'Heavy freezing drizzle':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy snow':
    case 'Patchy moderate snow':
    case 'Heavy snow':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Moderate or heavy sleet showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
      return Colors.deepPurple;
    case 'Ice pellets':
      return Colors.teal;
    default:
      return Colors.blue; // Default color if condition is not found
  }
}
