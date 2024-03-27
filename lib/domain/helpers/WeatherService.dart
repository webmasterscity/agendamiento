import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static const String apiKey = 'mu5qiarunbn838ip7m63onczkpdx6khl3b53cs4z'; // Reemplaza 'TU_API_KEY' con tu clave API de ClimaCell
  static const double lat = 9.552144; // Tu latitud aquí
  static const double lon = -69.191038; // Tu longitud aquí

  static Future<String> getRainProbability(DateTime date) async {
    String apiUrl = 'https://www.meteosource.com/api/v1/free/point?lat=$lat&lon=$lon&sections=hourly&language=en&units=metric&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> hourlyData = data['hourly']['data'];

        double rainProbability = 0.0;
        for (final hourData in hourlyData) {
          final double probability = hourData['probability'] != null ? hourData['probability'].toDouble() : 0.0;
          rainProbability += probability;
        }

        rainProbability /= hourlyData.length;

        return (rainProbability * 100).toString();
      } else {
        return "Sin datos";
      }
    } catch (error) {
      return "Sin datos";
    }
  }
}
