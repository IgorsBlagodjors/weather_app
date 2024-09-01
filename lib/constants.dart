import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/daily_data_class.dart';
import 'package:weather_app/domain/hourly_data_class.dart';

List<Map<String, dynamic>> testListIsNow = [
  {
    'hour': '1 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
  {
    'hour': '2 AM',
    'degree': 18,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_fast_wind32x32.png',
  },
  {
    'hour': '3 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
  {
    'hour': '4 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
  {
    'hour': '5 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Sun_cloud_angled_rain32x32.png',
  },
  {
    'hour': '6 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '7 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '8 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '9 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '10 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '11 AM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '12 AM',
    'degree': 19,
    'label': 30,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
  {
    'hour': '1 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
  {
    'hour': '2 PM',
    'degree': 18,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_fast_wind32x32.png',
  },
  {
    'hour': '3 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
  {
    'hour': '4 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
  {
    'hour': '5 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Sun_cloud_angled_rain32x32.png',
  },
  {
    'hour': '6 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '7 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '8 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '9 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '10 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '11 PM',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': '12 PM',
    'degree': 19,
    'label': 30,
    'weatherIcon': 'assets/Moon_cloud_mid_rain32x32.png',
  },
];
List<Map<String, dynamic>> testListWeekly = [
  {
    'hour': 'MON',
    'degree': 20,
    'label': 30,
    'weatherIcon': 'assets/Sun_cloud_mid_rain32x32.png',
  },
  {
    'hour': 'TUE',
    'degree': 21,
    'label': null,
    'weatherIcon': 'assets/Sun_cloud_mid_rain32x32.png',
  },
  {
    'hour': 'WED',
    'degree': 18,
    'label': 100,
    'weatherIcon': 'assets/Sun_cloud_angled_rain32x32.png',
  },
  {
    'hour': 'THU',
    'degree': 20,
    'label': 50,
    'weatherIcon': 'assets/Sun_cloud_angled_rain32x32.png',
  },
  {
    'hour': 'FRI',
    'degree': 22,
    'label': null,
    'weatherIcon': 'assets/Sun_cloud_mid_rain32x32.png',
  },
  {
    'hour': 'SAT',
    'degree': 19,
    'label': 50,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
  {
    'hour': 'SUN',
    'degree': 19,
    'label': null,
    'weatherIcon': 'assets/Tornado32x32.png',
  },
];

List<Map<String, dynamic>> weatherList = [
  {
    'image': 'assets/Moon_cloud_mid_rain.png',
    'indicator': '19°',
    'city': 'Montreal, Canada',
    'expectedRange': 'H:24°  L:18°',
    'weatherDescription': 'Mid Rain',
  },
  {
    'image': 'assets/Moon_cloud_fast_wind.png',
    'indicator': '20°',
    'city': 'Toronto, Canada',
    'expectedRange': 'H:21°  L:-19°',
    'weatherDescription': 'Fast Wind',
  },
  {
    'image': 'assets/Sun_cloud_angled_rain.png',
    'indicator': '13°',
    'city': 'Tokyo, Japan',
    'expectedRange': 'H:16°  L:8°',
    'weatherDescription': 'Showers',
  },
  {
    'image': 'assets/Tornado.png',
    'indicator': '23°',
    'city': 'Tennessee, United States',
    'expectedRange': 'H:26°  L:16°',
    'weatherDescription': 'Tornado',
  },
  {
    'image': 'assets/Moon_cloud_fast_wind.png',
    'indicator': '19°',
    'city': 'Montreal, Canada',
    'expectedRange': 'H:24°  L:18°',
    'weatherDescription': 'Partly Cloudy',
  },
  {
    'image': 'assets/Moon_cloud_fast_wind.png',
    'indicator': '19°',
    'city': 'Montreal, Canada',
    'expectedRange': 'H:24°  L:18°',
    'weatherDescription': 'Partly Cloudy',
  },
];
String getTime() {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('hh a').format(now);
  if (formattedTime.startsWith('0')) {
    return formattedTime.substring(1);
  }
  return formattedTime;
}

String getDay() {
  DateTime currentDate = DateTime.now();
  String dayOfWeek = DateFormat('EEE').format(currentDate);
  return dayOfWeek.toUpperCase();
}

String getWeekDays() {
  DateTime today = DateTime.now();
  DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
  DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
  String startWeekDate = startOfWeek.toString().split(' ')[0];
  String endOfWeekDate = endOfWeek.toString().split(' ')[0];
  return '$startWeekDate/$endOfWeekDate';
}

class CenterWiew {
  static void centerItem({
    required int index,
    required ScrollController scrollController,
    required BuildContext context,
  }) {
    double itemWidth = 68.0;
    double lwPadding = 20;
    double screenWidth = MediaQuery.of(context).size.width;
    double scrollOffset =
        index * itemWidth - (screenWidth / 2) - ((itemWidth - lwPadding) / 2);
    scrollController.animateTo(
      scrollOffset,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  static int getActiveTimeIndex({
    required List<HourlyData> hourlyList,
  }) {
    String currentTime = getTime();
    for (int i = 0; i < hourlyList.length; i++) {
      String hour = hourlyList[i].getTime;
      if (hour == currentTime) {
        return i + 1;
      }
    }
    return 0;
  }
}

class WeatherServices {
  static final WeatherServices _instance = WeatherServices._internal();
  factory WeatherServices() {
    return _instance;
  }
  WeatherServices._internal();
  static Future<String> getAddressFromCoordinates() async {
    Position position = await WeatherServices.getCurrentLocation();
    try {
      // Get the list of addresses from the coordinates
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        // Get the first address from the list
        Placemark place = placemarks[0];

        // Extract the country and city from the address
        String country = place.country ?? 'Russia';
        String city = place.locality ?? 'Moscow';

        return '$city,$country';
      } else {
        return 'No address found for the coordinates.';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  static String getTemp(List<HourlyData> hourlyItems) {
    return _getHourlySelector(hourlyItems, (data) => data.temp);
  }

  static String getMinTemp(List<DailyData> dailyItems) {
    return _getDailySelector(dailyItems, (data) => data.tempMin);
  }

  static String getMaxTemp(List<DailyData> dailyItems) {
    return _getDailySelector(dailyItems, (data) => data.tempMax);
  }

  static String getWeatherCondition(List<HourlyData> hourlyItems) {
    return _getHourlySelector(hourlyItems, (data) => data.conditions);
  }

  static String getWindSpeed(List<HourlyData> hourlyItems) {
    return _getHourlySelector(hourlyItems, (data) => data.windSpeed);
  }

  static String getFeelsLike(List<HourlyData> hourlyItems) {
    return _getHourlySelector(hourlyItems, (data) => data.feelslike);
  }

  static String getHumidity(List<HourlyData> hourlyItems) {
    return _getHourlySelector(hourlyItems, (data) => data.humidity);
  }

  static String getVisibility(List<HourlyData> hourlyItems) {
    return _getHourlySelector(hourlyItems, (data) => data.visibility);
  }

  static String getUVIndex(List<HourlyData> hourlyItems) {
    return _getHourlySelector(hourlyItems, (data) => data.uvIndex);
  }

  static double getWindDir(List<HourlyData> hourlyItems) {
    DateTime now = DateTime.now();
    for (var data in hourlyItems) {
      if (data.datetime.hour == now.hour) {
        return data.windDir;
      }
    }
    return 0;
  }

  static double getPressure(List<HourlyData> hourlyItems) {
    DateTime now = DateTime.now();
    for (var data in hourlyItems) {
      if (data.datetime.hour == now.hour) {
        return data.pressure;
      }
    }
    return 0;
  }

  static String getSunriseForCurrentDay(List<DailyData> dailyItems) {
    DateTime now = DateTime.now();
    DateFormat timeFormat = DateFormat('h:mm a');
    for (var data in dailyItems) {
      if (data.date.day == now.day) {
        return timeFormat.format(data.sunrise);
      }
    }
    return 'Unknown';
  }

  static String getSunsetForCurrentDay(List<DailyData> dailyItems) {
    DateTime now = DateTime.now();
    DateFormat timeFormat = DateFormat('h:mm a');
    for (var data in dailyItems) {
      if (data.date.day == now.day) {
        return timeFormat.format(data.sunset);
      }
    }
    return 'Unknown';
  }

  static String _getDailySelector(
      List<DailyData> dailyItems, String Function(DailyData) dailySelector) {
    DateTime now = DateTime.now();
    for (var data in dailyItems) {
      if (data.date.day == now.day) {
        return dailySelector(data);
      }
    }
    return 'Unknown';
  }

  static String _getHourlySelector(List<HourlyData> hourlyItems,
      String Function(HourlyData) hourlySelector) {
    DateTime now = DateTime.now();
    for (var data in hourlyItems) {
      if (data.datetime.hour == now.hour) {
        return hourlySelector(data);
      }
    }
    return 'Unknown';
  }

  static Future<Position> getCurrentLocation() async {
    Position locationData;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions permamently denied');
    }
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    locationData =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    return locationData;
  }
}
