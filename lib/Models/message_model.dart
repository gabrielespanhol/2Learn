class UsersChat {
  final int id;
  final String name;
  final String imageUrl;

  UsersChat({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

class Message {
  final UsersChat sender;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final UsersChat currentUser = UsersChat(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

final UsersChat james = UsersChat(
  id: 2,
  name: 'James',
  imageUrl: 'assets/images/james.jpg',
);
