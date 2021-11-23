import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/api';

  Future<int> getLocationId(String city) async {
    final locationUrl = Uri.parse('$baseUrl/location/search/?query=$city');

    final locationResponse = await http.get(locationUrl);

    if (locationResponse.statusCode != 200) {
      throw Exception('Error getting locationId for city: $city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;

    return locationJson.first['woeid'] as int;
  }
}
