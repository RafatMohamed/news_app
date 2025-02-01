
import '../models/servies_obj.dart';

class CreateServies {
  String category;
  final dio ;
  CreateServies(this.dio,{required this.category});
  Future<List<ServiesObj>> getHttp() async {
    try {
      final response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=5e9253dd8c7f40de9799d329e5211e93&category=$category");
      Map<String, dynamic> allQuery = response.data;
      List<dynamic> query = allQuery['articles'];
      List<ServiesObj> articles=[];
      for (var article in query) {
        ServiesObj serviesObj = ServiesObj(
          title: article['title'],
          description: article['description'],
          imageUrl: article['urlToImage'],
        );
        articles.add(serviesObj);
      }
      return articles;
    } on Exception catch (e) {
      print("Error $e");
      return [];
    }
  }
}
