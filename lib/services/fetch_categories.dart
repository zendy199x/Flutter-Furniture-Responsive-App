import 'dart:convert';

import 'package:furniture/models/categories.dart';
import 'package:http/http.dart' as http;

// Fetch our Categories from API
Future<List<Category>> fetchCategories() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Category> categories = (json.decode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();
// It return list of categories

    return categories;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
