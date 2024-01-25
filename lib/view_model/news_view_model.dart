

import 'package:news/models/categories_news_models.dart';
import 'package:news/models/news_channels_headlines_model.dart';
import 'package:news/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName) async{
    final response = await _rep.fetchNewChannelHeadlinesApi(channelName);
    return response ;

  }
  Future<CategoriesNewsModels> fetchNewsCategoriesApi(String categories) async{
    final response = await _rep.fetchNewsCategoriesApi(categories);
    return response ;

  }


}