class SampleData {
  // Existing users list
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
  // Existing quotes list with fontWeight added in design
  static final List<Map<String, dynamic>> quotes = [
    {
      'id': 'quote_001',
      'text':
          'The only way to do great work is to love what you do. Passion fuels purpose, and purpose creates lasting impact.',
      'authorId': 'user_002',
      'authorName': 'Maya Chen',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_002', 'user_003', 'user_004'],
      'commentCount': 5,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Inter',
        'fontSize': 20.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4285622158,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/ecommerce/analog-classic.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#motivation', '#work', '#passion'],
      'caption':
          'Work becomes art when fueled by love. This quote reminds us that passion transforms effort into something meaningful, leaving a legacy beyond ourselves.',
    },
    {
      'id': 'quote_002',
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
        'fontWeight': 'normal',
        'alignment': 'left',
        'backgroundColor': 4283190348,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472774/samples/man-on-a-escalator.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#poetry', '#soul', '#reflection'],
      'caption':
          'Poetry is the music of the soul. This piece captures the intimacy of self-reflection, where words become whispers of the heart.',
    },
    {
      'id': 'quote_003',
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
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4278239141,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472774/samples/man-on-a-escalator.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#success', '#courage', '#motivation'],
      'caption':
          'Life is a journey of peaks and valleys. This quote reminds us that neither success nor failure is permanent; persistence is the true measure of strength.',
    
    },
    {
      'id': 'quote_004',
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
        'fontWeight': 'normal',
        'alignment': 'left',
        'backgroundColor': 4286086977,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/ecommerce/analog-classic.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#dreams', '#determination', '#journey'],
      'caption':
          'This short story reflects the courage of stepping into the unknown. Every decision we make is a step toward becoming who we are meant to be.',
    
    },
    {
      'id': 'quote_005',
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
        'fontWeight': 'bold',
        'alignment': 'center',
        'backgroundColor': 4282271024,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472774/samples/man-on-a-escalator.jpg',
        'textColor': 4294967295,
      },
      'tags': ['Ewisdom', '#action', '#time'],
      'caption':
          'Opportunities are best seized today. This proverb reminds us that while earlier action is ideal, it’s never too late to start.',
    
    },
    {
      'id': 'quote_006',
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
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4279308047,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/ecommerce/analog-classic.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#hope', '#stars', '#inspiration'],
      'caption':
          'Opportunities are best seized today. This proverb reminds us that while earlier action is ideal, it’s never too late to start.',
    
    },
    {
      'id': 'quote_007',
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
        'fontWeight': 'bold',
        'alignment': 'center',
        'backgroundColor': 4294940928,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472774/samples/man-on-a-escalator.jpg',
        'textColor': 4278190080,
      },
      'tags': ['#limitation', '#imagination', '#breakthrough'],
      'caption':
          'Opportunities are best seized today. This proverb reminds us that while earlier action is ideal, it’s never too late to start.',
    
    },
    {
      'id': 'quote_008',
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
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4286741760,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472774/samples/man-on-a-escalator.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#ActNow', '#WisdomQuotes', '#Motivational'],
      'caption':
          'Opportunities are best seized today. This proverb reminds us that while earlier action is ideal, it’s never too late to start.',
    
    },
    {
      'id': 'quote_009',
      'text':
          'Happiness is not something ready-made. It comes from your own actions.',
      'authorId': 'user_002',
      'authorName': 'Lily Evans',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_007', 'user_008'],
      'commentCount': 3,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Pacifico',
        'fontSize': 20.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4289856832,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Happiness', '#SelfCare', '#Inspiration'],
      'caption':
          'True happiness arises from the choices and actions we make every day.',
    },

    {
      'id': 'quote_010',
      'text': 'Don’t watch the clock; do what it does. Keep going.',
      'authorId': 'user_002',
      'authorName': 'Mark Johnson',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_006', 'user_008'],
      'commentCount': 2,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Raleway',
        'fontSize': 18.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4283215696,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Motivation', '#KeepGoing', '#Time'],
      'caption': 'Keep moving forward just like the steady hands of a clock.',
    },

    {
      'id': 'quote_011',
      'text':
          'The harder you work for something, the greater you’ll feel when you achieve it.',
      'authorId': 'user_008',
      'authorName': 'Samantha Lee',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_006', 'user_009'],
      'commentCount': 7,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Merriweather',
        'fontSize': 21.0,
        'fontWeight': 'bold',
        'alignment': 'center',
        'backgroundColor': 4284002236,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#HardWork', '#Achievement', '#Success'],
      'caption': 'Effort and perseverance make success truly rewarding.',
    },

    {
      'id': 'quote_012',
      'text': 'Don’t limit your challenges, challenge your limits.',
      'authorId': 'user_009',
      'authorName': 'Ethan Brooks',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_008', 'user_010'],
      'commentCount': 4,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Poppins',
        'fontSize': 19.0,
        'fontWeight': 'bold',
        'alignment': 'center',
        'backgroundColor': 4288722706,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Challenge', '#Limitless', '#Growth'],
      'caption': 'Push beyond your boundaries to realize your true potential.',
    },

    {
      'id': 'quote_013',
      'text': 'Success doesn’t just find you. You have to go out and get it.',
      'authorId': 'user_010',
      'authorName': 'Olivia Martin',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_006', 'user_007'],
      'commentCount': 6,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Lato',
        'fontSize': 20.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4282277628,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Success', '#Motivation', '#Action'],
      'caption': 'Be proactive and pursue your goals actively.',
    },

    {
      'id': 'quote_014',
      'text': 'The future depends on what you do today.',
      'authorId': 'user_011',
      'authorName': 'David Carter',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_009', 'user_010', 'user_006'],
      'commentCount': 3,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Nunito',
        'fontSize': 18.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4285622158,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Future', '#Today', '#Responsibility'],
      'caption': 'Your actions now shape what is to come.',
    },

    {
      'id': 'quote_015',
      'text': 'Dream big and dare to fail.',
      'authorId': 'user_012',
      'authorName': 'Emma Wilson',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_007', 'user_008'],
      'commentCount': 5,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Montserrat',
        'fontSize': 21.0,
        'fontWeight': 'bold',
        'alignment': 'center',
        'backgroundColor': 4283190348,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#DreamBig', '#Dare', '#Motivation'],
      'caption': 'Courage is essential for big aspirations.',
    },

    {
      'id': 'quote_016',
      'text': 'It always seems impossible until it’s done.',
      'authorId': 'user_002',
      'authorName': 'Noah Anderson',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_006', 'user_009'],
      'commentCount': 7,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Roboto',
        'fontSize': 19.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4286086977,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Impossible', '#Determination', '#Success'],
      'caption': 'Persistence breaks down barriers.',
    },

    {
      'id': 'quote_017',
      'text': 'Start where you are. Use what you have. Do what you can.',
      'authorId': 'user_014',
      'authorName': 'Sophia Thomas',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_006', 'user_010'],
      'commentCount': 4,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Open Sans',
        'fontSize': 18.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4286741760,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#StartNow', '#Resourcefulness', '#CanDo'],
      'caption': 'Begin your journey with what you currently have.',
    },

    {
      'id': 'quote_018',
      'text': 'Great things never came from comfort zones.',
      'authorId': 'user_015',
      'authorName': 'James Harris',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_011', 'user_012', 'user_013'],
      'commentCount': 3,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Playfair Display',
        'fontSize': 20.0,
        'fontWeight': 'bold',
        'alignment': 'center',
        'backgroundColor': 4282271024,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#ComfortZone', '#Change', '#Growth'],
      'caption': 'Push yourself beyond daily comfort to achieve growth.',
    },

    {
      'id': 'quote_019',
      'text': 'Your passion is waiting for your courage to catch up.',
      'authorId': 'user_016',
      'authorName': 'Charlotte Evans',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_010', 'user_011'],
      'commentCount': 2,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Dancing Script',
        'fontSize': 18.0,
        'fontWeight': 'normal',
        'alignment': 'center',
        'backgroundColor': 4279308047,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Passion', '#Courage', '#Motivation'],
      'caption': 'Don’t hold back your energy — let courage lead you forward.',
    },

    {
      'id': 'quote_020',
      'text':
          'Magic is believing in yourself. If you can make that happen, you can make anything happen.',
      'authorId': 'user_017',
      'authorName': 'Lucas Martinez',
      'authorAvatar': null,
      'type': 'quote',
      'likes': ['user_012', 'user_013', 'user_014'],
      'commentCount': 5,
      'createdAt': 'TIMESTAMP',
      'design': {
        'fontFamily': 'Roboto Slab',
        'fontSize': 20.0,
        'fontWeight': 'bold',
        'alignment': 'center',
        'backgroundColor': 4285622158,
        'backgroundImage':
            'https://res.cloudinary.com/datxdx0wi/image/upload/v1727472765/samples/food/pot-mussels.jpg',
        'textColor': 4294967295,
      },
      'tags': ['#Believe', '#Magic', '#SelfConfidence'],
      'caption': 'Self-belief is the greatest magic of all.',
    },
  ];
  // Existing comments list
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
    {
      'quoteId': 'quote_003',
      'userId': 'user_003',
      'userName': 'Jordan Blake',
      'userAvatar': null,
      'text': 'Love this perspective on passion and work! 💫',
      'createdAt': 'TIMESTAMP',
    },
    {
      'quoteId': 'quote_003',
      'userId': 'user_001',
      'userName': 'Maya Chen',
      'userAvatar': null,
      'text': 'Beautiful poetry! Your words always touch my soul.',
      'createdAt': 'TIMESTAMP',
    },
  ];
}
