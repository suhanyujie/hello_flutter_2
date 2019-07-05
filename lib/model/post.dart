class Post {
  const Post({
    this.title,
    this.author,
    this.imageUrl,
  });

  final String title;
  final String author;
  final String imageUrl;
}

final List<Post> posts = [
  Post(
    title: "test title 1",
    author: "三水 1",
    imageUrl: "https://resources.ninghao.org/images/say-hello-to-barry.jpg"
  ),
  Post(
      title: "test title 2",
      author: "三水 2",
      imageUrl: "https://resources.ninghao.org/images/say-hello-to-barry.jpg"
  ),
];
