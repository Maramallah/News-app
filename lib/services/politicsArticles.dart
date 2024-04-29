import 'dart:convert';


import 'package:api/model/articales.dart';
import 'package:http/http.dart' as http;

class PoliticsArticle {
  static Future<List<article>> fetchPolitics() async {
    const url = 'https://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=b71bc27e43db4c7ab45133315c1c5dba';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("Successful API call."); // Debug print
    

      final json = jsonDecode(response.body);
      final articlesJson = json['articles'] as List<dynamic>;

      final articlesTransformed = articlesJson.map((e) {
        return article(
          descreption: e['description'] ?? 'no descreption',
          title: e['title']?? 'no title',
          image: e['urlToImage'] ?? 'assets/images/download (2).jpeg' ,
        );
      }).toList();

      return articlesTransformed;
    } else {
      print('Request failed with status: ${response.statusCode}.'); // Debug print error status
      print(response.body); // Debug print error body
      return [];
    }
  }
}