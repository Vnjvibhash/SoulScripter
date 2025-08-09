class SampleData {
  // Existing users list remains unchanged
  static final List<Map<String, dynamic>> users = [
    {
      'name': 'Maya Chen',
      'email': 'maya.chen@example.com',
      'bio':
          '🌸 Poet & Dreamer | Finding beauty in everyday moments | Coffee enthusiast ☕',
      'profilePicture': null,
      'followers': ['user_002', 'user_003', 'user_004', 'user_005'],
      'following': ['user_002', 'user_003'],
      'postsCount': 8,
      'createdAt': 'TIMESTAMP',
    },
    {
      'name': 'Alex Rivera',
      'email': 'alex.rivera@example.com',
      'bio':
          '✨ Storyteller at heart | Inspiration seeker | Life is a beautiful journey',
      'profilePicture': null,
      'followers': ['user_001', 'user_003', 'user_005'],
      'following': ['user_001', 'user_004'],
      'postsCount': 12,
      'createdAt': 'TIMESTAMP',
    },
    {
      'name': 'Jordan Blake',
      'email': 'jordan.blake@example.com',
      'bio':
          '📝 Words have power | Motivational quotes | Spreading positivity daily',
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

  // Updated quotes list with Unsplash image URLs as background images
  static final List<Map<String, dynamic>> quotes = [
    {
      'text':
          'The only way to do great work is to love what you do. Passion fuels purpose, and purpose creates lasting impact.',
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
        'backgroundColor': 4285622158, // Purple gradient fallback color
        'backgroundImage':
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80', // purple twilight sky
        'textColor': 4294967295, // White
      },
      'tags': ['motivation', 'work', 'passion'],
    },
    {
      'text':
          'In the quiet moments,\nwhere thoughts dance free,\nI find the rhythm of my soul,\nand whisper poetry.',
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
        'backgroundColor': 4283190348, // Soft blue fallback color
        'backgroundImage':
            'https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=800&q=80', // calm ocean
        'textColor': 4294967295, // White
      },
      'tags': ['poetry', 'soul', 'reflection'],
    },
    {
      'text':
          'Success is not final, failure is not fatal. It is the courage to continue that counts most.',
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
        'backgroundColor': 4278239141, // Deep green fallback
        'backgroundImage':
            'https://images.unsplash.com/photo-1468071174046-657d9d351a40?auto=format&fit=crop&w=800&q=80', // lush green forest
        'textColor': 4294967295, // White
      },
      'tags': ['success', 'courage', 'motivation'],
    },
    {
      'text':
          'She stood at the crossroads of her dreams, knowing that every step forward was a choice to believe in herself. The path was uncertain, but her determination was unwavering.',
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
        'backgroundColor': 4286086977, // Warm orange fallback
        'backgroundImage':
            'https://images.unsplash.com/photo-1500534623283-312aade485b8?auto=format&fit=crop&w=800&q=80', // warm sunrise landscape
        'textColor': 4294967295, // White
      },
      'tags': ['dreams', 'determination', 'journey'],
    },
    {
      'text':
          'The best time to plant a tree was 20 years ago. The second best time is now.',
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
        'backgroundColor': 4282271024, // Forest green fallback
        'backgroundImage':
            'https://images.unsplash.com/photo-1506744038136-46273834b3fc?auto=format&fit=crop&w=800&q=80', // big tree in light
        'textColor': 4294967295, // White
      },
      'tags': ['wisdom', 'action', 'time'],
    },
    {
      'text':
          'Stars above remind me\nthat light exists\neven in darkness.\nHope whispers softly,\n"You are not alone."',
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
        'backgroundColor': 4279308047, // Deep purple fallback
        'backgroundImage':
            'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?auto=format&fit=crop&w=800&q=80', // starry night sky
        'textColor': 4294967295, // White
      },
      'tags': ['hope', 'stars', 'inspiration'],
    },
    {
      'text':
          'Your limitation—it\'s only your imagination. Break free from the chains of doubt.',
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
        'backgroundColor': 4294940928, // Bright orange fallback
        'backgroundImage':
            'https://images.unsplash.com/photo-1500534623283-312aade485b9?auto=format&fit=crop&w=800&q=80', // bright sunset
        'textColor': 4278190080, // Black
      },
      'tags': ['limitation', 'imagination', 'breakthrough'],
    },
    {
      'text':
          'Life is what happens when you\'re busy making other plans. Embrace the unexpected moments.',
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
        'backgroundColor': 4286741760, // Coral pink fallback
        'backgroundImage':
            'https://images.unsplash.com/photo-1506744038136-46273834b3fd?auto=format&fit=crop&w=800&q=80', // pastel sunrise
        'textColor': 4294967295, // White
      },
      'tags': ['life', 'planning', 'unexpected'],
    },
  ];
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
