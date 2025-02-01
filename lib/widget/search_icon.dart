import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// class SearchAppBarExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("News Search"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Action when the search icon is pressed
//               showSearch(
//                 context: context,
//                 delegate: CustomSearchDelegate(),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text(
//           "Search for news!",
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

class CustomSearchDelegate extends SearchDelegate {
  // News API base URL and API key
  final String apiKey = "5e9253dd8c7f40de9799d329e5211e93";
  final String baseUrl = "https://newsapi.org/v2/everything";

  // Fetch articles from the News API based on the query
  Future<List<Map<String, dynamic>>> fetchNews(String query) async {
    try {
      final response = await Dio().get(
        baseUrl,
        queryParameters: {
          'q': query,
          'apiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List articles = response.data['articles'];
        return articles.map((e) => e as Map<String, dynamic>).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ""; // Clear the search field
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search bar
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "An error occurred:\n${snapshot.error}",
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        } else if (snapshot.hasData) {
          final articles = snapshot.data!;
          if (articles.isEmpty) {
            return Center(
              child: Text(
                "No results found for \"$query\".",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // Display fetched articles in a ListView
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ListTile(
                leading: article['urlToImage'] != null
                    ? Image.network(
                  article['urlToImage'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                    : Icon(Icons.image, size: 50),
                title: Text(
                  article['title'] ?? "No title",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  article['description'] ?? "No description available",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Open article URL in a web browser or detailed page
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(article['title'] ?? "No title"),
                      content: SelectableText("Link: ${article['url']}"),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Center(
            child: Text(
              "No results found.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Optionally display search suggestions
    return Center(
      child: Text("Type to search for news..."),
    );
  }
}
