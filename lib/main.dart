import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const appTitle = 'Trang chu';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: FoodAppBar(title: appTitle),
    );
  }
}

class FoodAppBar extends StatefulWidget {
  const FoodAppBar({super.key, required this.title});

  final String title;

  @override
  State<FoodAppBar> createState() => _FoodAppBarState();
}

class _FoodAppBarState extends State<FoodAppBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Đánh giá',
      style: optionStyle,
    ),
    Text(
      'Index 1: Chia sẻ',
      style: optionStyle,
    ),
    Text(
      'Index 2: Gửi bạn bè',
      style: optionStyle,
    ),
    Text(
      'Index 3: Phản hồi',
      style: optionStyle,
    ),
    Text(
      'Index 4: Quà',
      style: optionStyle,
    ),
    Text(
      'Index 5: Thông tin App',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
      ),
      body: const PostList(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 64.0,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Chức Năng',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.5, color: Colors.black12),
                        ),
                      ),
                      child: const Text(
                        'Đánh giá',
                      ),
                    ),
                  ),
                ],
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chia sẻ'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Gửi bạn bè'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Phản hồi'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Quà'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Thông tin app'),
              selected: _selectedIndex == 5,
              onTap: () {
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PostDetail extends StatelessWidget {
  const PostDetail({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSection(
              image: post.image,
            ),
            TitleSection(
              category: post.category,
              title: post.title,
              publishedAt: post.publishedAt,
              updatedAt: post.updatedAt
            ),
            ContentSection(
                content: post.content,
                status: post.status,
              ),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: 600,
      height: 300,
      fit: BoxFit.cover,
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.category,
    required this.publishedAt,
    required this.updatedAt,
    required this.title,
  });

  final String category;
  final String publishedAt;
  final String updatedAt;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Category: $category',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Published At: $publishedAt',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  'Update At: $updatedAt',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

class ContentSection extends StatelessWidget {
  const ContentSection({
    super.key,
    required this.content,
    required this.status,
  });

  final String content;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        content,
        softWrap: true,
      ),
    );
  }
}

// Post class to store post data
class Post {
  final int id;
  final String slug;
  final String url;
  final String title;
  final String content;
  final String image;
  final String thumbnail;
  final String status;
  final String category;
  final String publishedAt;
  final String updatedAt;
  final int userId;

  const Post({
    required this.id,
    required this.slug,
    required this.url,
    required this.title,
    required this.content,
    required this.image,
    required this.thumbnail,
    required this.status,
    required this.category,
    required this.publishedAt,
    required this.updatedAt,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'slug': String slug,
        'url': String url,
        'title': String title,
        'content': String content,
        'image': String image,
        'thumbnail': String thumbnail,
        'status': String status,
        'category': String category,
        'publishedAt': String publishedAt,
        'updatedAt': String updatedAt,
        'userId': int userId,
      } =>
        Post(
          id: id,
          slug: slug,
          url: url,
          title: title,
          content: content,
          image: image,
          thumbnail: thumbnail,
          status: status,
          category: category,
          publishedAt: publishedAt,
          updatedAt: updatedAt,
          userId: userId,
        ),
      _ => throw const FormatException('Failed to load Post.'),
    };
  }
}

//fetch single post data from api

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.org/posts/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Post');
  }
}

//fetch array of post from api
class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    // you can replace your api link with this link
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        posts = jsonData.map((data) => Post.fromJson(data)).toList();
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(20),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: Container(
          color: Colors.black38,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.favorite, color: Colors.pink),
              Expanded(
                child: Text(
                  post.title,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                  maxLines: 2,
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.white),
            ],
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(post: post)));
          },
          child: Container(
              padding: const EdgeInsets.symmetric(),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(post.thumbnail),
              )),
        ));
  }
}
