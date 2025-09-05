import 'dart:convert';
import 'package:cookify/models/racipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<List<Recipe>> getAllRacipe() async {
    final url = 'https://dummyjson.com/recipes';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List data = jsonResponse['recipes'];

      return data.map((e) => Recipe.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
