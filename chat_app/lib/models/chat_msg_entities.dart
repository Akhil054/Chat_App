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

}

class Author{
  String userName;

  Author({
    required this.userName,
});

}