import 'package:intl/intl.dart';

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

int getActiveTimeIndex() {
  for (int i = 0; i < testListIsNow.length; i++) {
    String hour = testListIsNow[i]['hour'];
    if (hour == getTime()) {
      return i;
    }
  }
  return 0;
}

int getActiveDayIndex() {
  for (int i = 0; i < testListIsNow.length; i++) {
    String hour = testListIsNow[i]['hour'];
    if (hour == getDay()) {
      return i;
    }
  }
  return 0;
}
