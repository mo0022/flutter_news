class Category {
  int? id;
  final String name;
  final String image;

  Category({required this.name, required this.image, required this.id});
}

List<Category> categorydata = [
  Category(name: "Business", image: "images/busniess.jpg", id: 1),
  Category(name: "Sports", image: "images/sports.jpg", id: 2),
  Category(name: "Technology", image: "images/tech.jpg", id: 3),
  Category(name: "health", image: "images/health.avif", id: 4),
  Category(name: "Science", image: "images/science.avif", id: 5),
];
