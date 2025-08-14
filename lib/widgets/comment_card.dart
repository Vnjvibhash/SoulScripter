import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final Map<String, dynamic> comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage:
            (comment['userAvatar'] != null &&
                comment['userAvatar'].toString().isNotEmpty)
            ? NetworkImage(comment['userAvatar'])
            : null,
        child:
            (comment['userAvatar'] == null ||
                comment['userAvatar'].toString().isEmpty)
            ? Text(
                comment['userName'][0].toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            : null,
      ),
      title: Text(comment['userName']),
      subtitle: Text(comment['text']),
      trailing: Text(
        comment['createdAt'],
        style: const TextStyle(fontSize: 11, color: Colors.grey),
      ),
    );
  }
}
