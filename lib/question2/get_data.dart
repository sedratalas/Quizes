import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/services.dart';
import 'package:quiz_1/question2/lazyloader.dart';

class GetData{
  static LazyLoading<List<String>> categoriesLoader = LazyLoading(getCategories);
  static LazyLoading<List<String>> venuesLoader = LazyLoading(getVenues);
  static LazyLoading<Future<List<String>>> languagesLoader = LazyLoading(getLanguages);

  static List<String> getCategories() {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) {
      items.add(faker.lorem.words(3).join(' '));
    }
    return items;
  }

  static List<String> getVenues() {
    List<String> items = [];
    for (int i = 0; i < 1000; i++) {
      items.add(faker.lorem.words(2).join(' '));
    }
    return items;
  }

  static Future<List<String>> getLanguages() async {
    List<String> items;
    String filePath = "assets/lottie/languages.json";
    String jsonString = await rootBundle.loadString(filePath);
    items = List<String>.from(json.decode(jsonString));
    return items;
  }
}