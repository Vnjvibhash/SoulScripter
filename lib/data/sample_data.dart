/// Contains sample data for the application.
class SampleData {
  /// A list of sample user data.
  ///
  /// Each user is represented as a map with the following keys:
  /// - `name`: The name of the user.
  /// - `email`: The email address of the user.
  /// - `bio`: A short biography of the user.
  /// - `profilePicture`: The URL of the user's profile picture (currently null).
  /// - `followers`: A list of user IDs who follow this user.
  /// - `following`: A list of user IDs whom this user follows.
  /// - `postsCount`: The number of posts made by the user.
  /// - `createdAt`: The timestamp when the user account was created.
  static final List<Map<String, dynamic>> users = [
    {
      'name': 'Maya Chen',
      'email': 'maya.chen@example.com',
      'bio': '🌸 Poet & Dreamer | Finding beauty in everyday moments | Coffee enthusiast ☕',
      'profilePicture': null,
      'followers': ['user_002', 'user_003', 'user_004', 'user_005'],
      'following': ['user_002', 'user_003'],
      'postsCount': 8,
      'createdAt': 'TIMESTAMP',
    },
    {
      'name': 'Alex Rivera',
      'email': 'alex.rivera@example.com',
      'bio': '✨ Storyteller at heart | Inspiration seeker | Life is a beautiful journey',
      'profilePicture': null,
      'followers': ['user_001', 'user_003', 'user_005'],
      'following': ['user_001', 'user_004'],
      'postsCount': 12,
      'createdAt': 'TIMESTAMP',
    },
    {
      'name': 'Jordan Blake',
      'email': 'jordan.blake@example.com',
      'bio': '📝 Words have power | Motivational quotes | Spreading positivity daily',
      'profilePicture': null,
      'followers': ['user_001', 'user_002', 'user_004'],
      'following': ['user_001', 'user_002', 'user_005'],
      'postsCount': 15,
      'createdAt': 'TIMESTAMP',
    },
    {
      'name': 'Sam Taylor',
      'email': 'sam.taylor@example.com',
      'bio': '🎯 Goal setter | Success mindset | Turning dreams into reality',
      'profilePicture': null,
      'followers': ['user_001', 'user_003'],
      'following': ['user_002', 'user_003'],
      'postsCount': 6,
      'createdAt': 'TIMESTAMP',
    },
    {
      'name': 'Casey Morgan',
      'email': 'casey.morgan@example.com',
      'bio': '🌟 Wisdom seeker | Ancient quotes modern life | Philosophy lover',
      'profilePicture': null,
      'followers': ['user_001', 'user_002'],
      'following': ['user_001', 'user_003', 'user_004'],
      'postsCount': 9,
      'createdAt': 'TIMESTAMP',
    },
  ];

  /// A list of sample quote data.
  ///
  /// Each quote is represented as a map with the following keys:
  /// - `text`: The content of the quote.
  /// - `authorId`: The ID of the user who authored the quote.
  /// - `authorName`: The name of the user who authored the quote.
  /// - `authorAvatar`: The URL of the author's avatar (currently null).
  /// - `type`: The type of the post (e.g., 'quote', 'poem', 'story').
  /// - `likes`: A list of user IDs who liked the quote.
  /// - `commentCount`: The number of comments on the quote.
  /// - `createdAt`: The timestamp when the quote was created.
  /// - `design`: A map containing design details for the quote display:
  ///   - `fontFamily`: The font family for the quote text.
  ///   - `fontSize`: The font size for the quote text.
  ///   - `alignment`: The text alignment (e.g., 'center', 'left').
  ///   - `backgroundColor`: The background color for the quote.
  ///   - `backgroundImage`: The background image for the quote (currently null).
  ///   - `textColor`: The text color for the quote.
  /// - `tags`: A list of tags associated with the quote.
  static final List<Map<String, dynamic>> quotes = [
    {
      'text': 'The only way to do great work is to love what you do. Passion fuels purpose, and purpose creates lasting impact.',
      'authorId': 'user_001',
      'authorName': 'Maya Chen',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_002', 'user_003', 'user_004'],
      'commentCount': 5,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Inter',
        'fontSize': 20.0,
        'alignment': 'center',
        'backgroundColor': 4285622158, // Purple gradient
        'backgroundImage': null,
        'textColor': 4294967295, // White
      },
      'tags': ['motivation', 'work', 'passion'],
    },
    {
      'text': 'In the quiet moments,\nwhere thoughts dance free,\nI find the rhythm of my soul,\nand whisper poetry.',
      'authorId': 'user_002',
      'authorName': 'Alex Rivera',
      'authorAvatar': null,
      'type': 'poem',
      'likes': ['user_001', 'user_003', 'user_005'],
      'commentCount': 8,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Crimson Text',
        'fontSize': 18.0,
        'alignment': 'left',
        'backgroundColor': 4283190348, // Soft blue
        'backgroundImage': null,
        'textColor': 4294967295,
      },
      'tags': ['poetry', 'soul', 'reflection'],
    },
    {
      'text': 'Success is not final, failure is not fatal. It is the courage to continue that counts most.',
      'authorId': 'user_003',
      'authorName': 'Jordan Blake',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_001', 'user_002', 'user_004', 'user_005'],
      'commentCount': 12,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Roboto',
        'fontSize': 22.0,
        'alignment': 'center',
        'backgroundColor': 4278239141, // Deep green
        'backgroundImage': null,
        'textColor': 4294967295,
      },
      'tags': ['success', 'courage', 'motivation'],
    },
    {
      'text': 'She stood at the crossroads of her dreams, knowing that every step forward was a choice to believe in herself. The path was uncertain, but her determination was unwavering.',
      'authorId': 'user_004',
      'authorName': 'Sam Taylor',
      'authorAvatar': null,
      'type': 'story',
      'likes': ['user_001', 'user_003'],
      'commentCount': 3,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Lora',
        'fontSize': 16.0,
        'alignment': 'left',
        'backgroundColor': 4286086977, // Warm orange
        'backgroundImage': null,
        'textColor': 4294967295,
      },
      'tags': ['dreams', 'determination', 'journey'],
    },
    {
      'text': 'The best time to plant a tree was 20 years ago. The second best time is now.',
      'authorId': 'user_005',
      'authorName': 'Casey Morgan',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_001', 'user_002', 'user_003'],
      'commentCount': 7,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Playfair Display',
        'fontSize': 19.0,
        'alignment': 'center',
        'backgroundColor': 4282271024, // Forest green
        'backgroundImage': null,
        'textColor': 4294967295,
      },
      'tags': ['wisdom', 'action', 'time'],
    },
    {
      'text': 'Stars above remind me\nthat light exists\neven in darkness.\nHope whispers softly,\n"You are not alone."',
      'authorId': 'user_001',
      'authorName': 'Maya Chen',
      'authorAvatar': null,
      'type': 'poem',
      'likes': ['user_002', 'user_005'],
      'commentCount': 4,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Dancing Script',
        'fontSize': 17.0,
        'alignment': 'center',
        'backgroundColor': 4279308047, // Deep purple
        'backgroundImage': null,
        'textColor': 4294967295,
      },
      'tags': ['hope', 'stars', 'inspiration'],
    },
    {
      'text': 'Your limitation—it\'s only your imagination. Break free from the chains of doubt.',
      'authorId': 'user_003',
      'authorName': 'Jordan Blake',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_001', 'user_004'],
      'commentCount': 2,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Montserrat',
        'fontSize': 21.0,
        'alignment': 'center',
        'backgroundColor': 4294940928, // Bright orange
        'backgroundImage': null,
        'textColor': 4278190080, // Black
      },
      'tags': ['limitation', 'imagination', 'breakthrough'],
    },
    {
      'text': 'Life is what happens when you\'re busy making other plans. Embrace the unexpected moments.',
      'authorId': 'user_002',
      'authorName': 'Alex Rivera',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_001', 'user_003', 'user_004', 'user_005'],
      'commentCount': 9,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Open Sans',
        'fontSize': 18.0,
        'alignment': 'center',
        'backgroundColor': 4286741760, // Coral pink
        'backgroundImage': null,
        'textColor': 4294967295,
      },
      'tags': ['life', 'planning', 'unexpected'],
    },
  ];

  /// A list of sample comment data.
  ///
  /// Each comment is represented as a map with the following keys:
  /// - `quoteId`: The ID of the quote to which the comment belongs.
  /// - `userId`: The ID of the user who made the comment.
  /// - `userName`: The name of the user who made the comment.
  /// - `userAvatar`: The URL of the user's avatar (currently null).
  /// - `text`: The content of the comment.
  /// - `createdAt`: The timestamp when the comment was created.
  static final List<Map<String, dynamic>> comments = [
    {
      'quoteId': 'quote_001',
      'userId': 'user_002',
      'userName': 'Alex Rivera',
      'userAvatar': null,
      'text': 'This is so inspiring! Really needed to hear this today.',
      'createdAt': 'TIMESTAMP',
    },
    {
      'quoteId': 'quote_001',
      'userId': 'user_003',
      'userName': 'Jordan Blake',
      'userAvatar': null,
      'text': 'Love this perspective on passion and work! 💫',
      'createdAt': 'TIMESTAMP',
    },
    {
      'quoteId': 'quote_002',
      'userId': 'user_001',
      'userName': 'Maya Chen',
      'userAvatar': null,
      'text': 'Beautiful poetry! Your words always touch my soul.',
      'createdAt': 'TIMESTAMP',
    },
    {
      'quoteId': 'quote_003',
      'userId': 'user_002',
      'userName': 'Alex Rivera',
      'userAvatar': null,
      'text': 'Exactly what I needed to remind myself today. Thank you!',
      'createdAt': 'TIMESTAMP',
    },
    {
      'quoteId': 'quote_003',
      'userId': 'user_004',
      'userName': 'Sam Taylor',
      'userAvatar': null,
      'text': 'Courage to continue - that\'s the key! 🔑',
      'createdAt': 'TIMESTAMP',
    },
  ];
}
