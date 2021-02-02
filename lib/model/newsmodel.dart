import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:onecaintamobileapp/apilist/endpoints.dart';

class NewsModel {
  String headlineImg;
  String headline;
  String newsbody;
  String newsPreview;
  String newsdate;
  bool isactive;

  NewsModel({this.headlineImg, this.headline, this.newsbody, this.newsdate, this.newsPreview, this.isactive});

  NewsModel.fromJson(Map<String, dynamic> json) {
    headlineImg = json['HeadlineImg'];
    headline = json['Headline'];
    newsbody = json['NewsBodyText'];
     newsdate = json['NewsDate'];
     newsPreview = json['NewsPreviewText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HeadlineImg'] = this.headlineImg;
    data['Headline'] = this.headline;
    data['NewsBodyText'] = this.newsbody;
     data['NewsDate'] = this.newsdate;
     data['NewsPreviewText'] = this.newsPreview;
    return data;
  }

   

}

Future<List<NewsModel>> fetchNews() async {

  
    final response = await http.get(Endpoints.newsEndpoint,
    headers: {"Accept": "application/json"}, ).timeout(Duration(seconds: 60))
    .catchError((e){
          throw Exception('Loading errored in getting news, please try again.');
    });

    if ( response != null && response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((news) => new NewsModel.fromJson(news)).toList();
    } else {
    
    throw Exception('Loading errored in getting news, please try again.');
   
    }
  }
