import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/categories_news_models.dart';
import 'package:news/models/news_channels_headlines_model.dart';



class NewsRepository{
  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName)async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=3686bbbf9b534fcfaba3d01cc301a2f8' ;
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }
  Future<CategoriesNewsModels> fetchNewsCategoriesApi(String categories)async{
    String url = 'https://newsapi.org/v2/everything?q=${categories}&apiKey=3686bbbf9b534fcfaba3d01cc301a2f8' ;
    print(url);
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModels.fromJson(body);
    }
    throw Exception('Error');
  }



}