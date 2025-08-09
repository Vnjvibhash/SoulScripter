import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulscripter/providers/auth_provider.dart';
import 'package:soulscripter/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Example static user data and posts
  final String userName = "Viveka Jee";

  final String userAvatar =
      "https://res.cloudinary.com/datxdx0wi/image/upload/v1750217121/pjlbiwax6pwd1obiiwpt.jpg";

  final String bio = "Poet | Dreamer | Soulless Writer";

  final int followers = 1280;

  final int following = 347;

  final int posts = 24;

  // Example post images or quote cards (you can use QuoteCard widgets here for real quotes)
  final List<String> postImages = [
    "assets/images/intro1.png",
    "assets/images/intro2.png",
    "assets/images/intro3.png",
  ];

  void _logout() async {
    await Provider.of<AuthProvider>(context, listen: false).logout();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You have Logged Sucessfully')),
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

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout();
            },
          ),
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
                  offset: Offset(0, 6),
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

                // Followers, Posts, Following row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatBox(title: "Followers", count: followers),
                    _StatBox(title: "Posts", count: posts),
                    _StatBox(title: "Following", count: following),
                  ],
                ),
                const SizedBox(height: 12),
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

          // Gallery Grid of Posts
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: postImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85, // a bit taller to fit counts
                ),
                itemBuilder: (context, index) {
                  // Example counts (replace with your real post data)
                  int likes = 120 + index;
                  int comments = 15 + index;

                  return Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    shadowColor: Colors.black26,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Post Image
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              postImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Likes & Comments Row
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16),
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
                                    '$likes',
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
                                    '$comments',
                                    style: const TextStyle(fontSize: 12),
                                  ),
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

// Helper widget for follower/post/following stats
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
