import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:soulscripter/providers/auth_provider.dart';
import 'package:soulscripter/providers/quotes_provider.dart';
import 'package:soulscripter/screens/login_screen.dart';
import 'package:soulscripter/widgets/quote/quote_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String userAvatar =
      "https://res.cloudinary.com/datxdx0wi/image/upload/v1750217121/pjlbiwax6pwd1obiiwpt.jpg";

  final String bio = "Poet | Dreamer | Soulless Writer";
  final int followers = 1280;
  final int following = 347;
  final String userId = 'user_002'; // Current user's ID

  void _logout() async {
    await Provider.of<AuthProvider>(context, listen: false).logout();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You have logged out successfully')),
    );
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Get username from provider
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.name ?? 'Guest';

    // Fetch user's own quotes from QuoteProvider
    final quoteProvider = Provider.of<QuoteProvider>(context);
    final myQuotes = quoteProvider.allQuotes
        .where((quote) => quote['authorId'] == userId)
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: Column(
        children: [
          // Profile Info Section
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(userAvatar),
                ),
                const SizedBox(height: 16),
                Text(
                  userName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bio,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatBox(title: "Followers", count: followers),
                    _StatBox(title: "Posts", count: myQuotes.length),
                    _StatBox(title: "Following", count: following),
                  ],
                ),
              ],
            ),
          ),

          // Posts Gallery Title
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 16, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Posts",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // Grid of QuoteCards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: myQuotes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      2, // 2 columns for better QuoteCard visibility
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final quote = myQuotes[index];
                  final likeCount = (quote['likes'] is List)
                      ? quote['likes'].length
                      : 0;
                  final commentCount = quote['commentCount'] ?? 0;
                  return Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // QuoteCard occupies the main portion
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(18),
                            ),
                            child: QuoteCard(
                              quoteData: {
                                ...quote,
                                'design': {
                                  ...quote['design'],
                                  'fontSize':
                                      (quote['design']['fontSize'] ?? 16.0) / 2,
                                },
                              },
                            ),
                          ),
                        ),
                        // Footer with like/comment/share counts
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(18),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    size: 16,
                                    color: Colors.pink,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$likeCount',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.comment,
                                    size: 16,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$commentCount',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      final textToShare =
                                          quote['text'] ??
                                          'Check out this quote!';
                                      SharePlus.instance.share(
                                        ShareParams(text: textToShare),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.share,
                                      size: 16,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String title;
  final int count;
  const _StatBox({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          '$count',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
