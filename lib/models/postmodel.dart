import 'dart:convert';
import 'dart:core';

class PostModel {
  int id;
  String title;
  String description;
  String body;
  String link;
  String dropdown;
  String createdAt;
  String updatedAt;
  String cImage;

  PostModel(
      {this.id,
        this.title,
        this.description,
        this.body,
        this.link,
        this.dropdown,
        this.createdAt,
        this.updatedAt,
        this.cImage});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id : json['id'],
        title : json['title'],
        description : json['description'],
        body : json['body'],
        link : json['link'],
        dropdown : json['dropdown'],
        createdAt : json['created_at'],
        updatedAt : json['updated_at'],
        cImage : json['c_image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['body'] = this.body;
    data['link'] = this.link;
    data['dropdown'] = this.dropdown;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['c_image'] = this.cImage;
    return data;
  }
}

class PostList {
  final List<PostModel> posts;

  PostList({
   this.posts,
  });

  factory PostList.fromJson(List<dynamic> parsedJson){
    List<PostModel> posts = new List<PostModel>();
    posts = parsedJson.map((i)=>PostModel.fromJson(i)).toList();

    return PostList(
      posts: posts,
    );
  }
  /*List<PostModel> allPostsFromJson(String str){
    final jsonData = json.decode(str);
    return List<PostModel>.from(jsonData.map((x) => PostModel.fromJson(x)));
  } */
}
