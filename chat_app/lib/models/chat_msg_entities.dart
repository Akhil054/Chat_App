class ChatMessageEntity{
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({
    required this.text,
    required this.id,
    required this.createdAt,
    required this.author,
    this.imageUrl,
  });

  /// Mapping the json data with dart class using fromJson method
  factory ChatMessageEntity.fromJson(Map<String,dynamic>json){
    return ChatMessageEntity(
      text: json['text'],
      id: json['id'],
      createdAt: json['createdAt'],
      author: Author.fromJson(json['author']),
      imageUrl: json['image'],
    );
  }

}

class Author{
  String userName;

  Author({
    required this.userName,
  });

  /// Mapping the json data with dart class using fromJson method
  factory Author.fromJson(Map<String,dynamic>json){
    return Author(userName: json['username']);
  }

}
