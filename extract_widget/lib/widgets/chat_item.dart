import 'package:flutter/material.dart';


// extract widget dari list tile
class ChatItem extends StatelessWidget {
  // konstruktor
  const ChatItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  final String imageUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text('12:00 AM'),
    );
  }
}