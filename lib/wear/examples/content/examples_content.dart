class ExamplesContent {
  int id;
  String image;
  String title;
  String material;
  int size;
  int height;
  String toe;
  String inserts;
  List<int> colors;

  ExamplesContent({
    required this.id,
    required this.image,
    required this.title,
    required this.material,
    required this.size,
    required this.height,
    required this.toe,
    required this.inserts,
    required this.colors,
  });
}

List<ExamplesContent> listExamplesContent = [
  ExamplesContent(
    id: 1,
    image: 'assets/images/e1.png',
    title: 'T-Strap',
    material: 'Genuine Leather',
    size: 38,
    height: 8,
    toe: 'Classic',
    inserts: 'None',
    colors: [0xFFFF0000, 0xFF00FF00, 0xFF0000FF],
  ),
  ExamplesContent(
    id: 2,
    image: 'assets/images/e2.png',
    title: 'Convers',
    material: 'Structured Genuine Leather',
    size: 40,
    height: 3,
    toe: 'Almond',
    inserts: 'Foam',
    colors: [0xFFFFFF00, 0xFFFF00FF, 0xFF00FFFF],
  ),
  ExamplesContent(
    id: 3,
    image: 'assets/images/e3.png',
    title: 'T-Strap',
    material: 'Genuine Leather',
    size: 37,
    height: 4,
    toe: 'Classic',
    inserts: 'Gel',
    colors: [0xFFAAAAAA, 0xFFCCCCCC,0xFFFF00FF,],
  ),
  ExamplesContent(
    id: 4,
    image: 'assets/images/e4.png',
    title: 'Convers',
    material: 'Structured Genuine Leather',
    size: 39,
    height: 4,
    toe: 'Almond',
    inserts: 'Memory Foam',
    colors: [0xFF112233, 0xFF445566, 0xFF778899],
  ),
  ExamplesContent(
    id: 5,
    image: 'assets/images/e5.png',
    title: 'T-Strap',
    material: 'Genuine Leather',
    size: 37,
    height: 2,
    toe: 'Classic',
    inserts: 'Air Cushion',
    colors: [0xFFBBCCDD, 0xFFEEFF00, 0xFF00AAFF],
  ),
  ExamplesContent(
    id: 6,
    image: 'assets/images/e6.png',
    title: 'Convers',
    material: 'Structured Genuine Leather',
    size: 40,
    height: 7,
    toe: 'Almond',
    inserts: 'None',
    colors: [0xFFFFAABB, 0xFF112233, 0xFF445566],
  ),
  ExamplesContent(
    id: 7,
    image: 'assets/images/e7.png',
    title: 'T-Strap',
    material: 'Genuine Leather',
    size: 36,
    height: 5,
    toe: 'Classic',
    inserts: 'Foam',
    colors: [0xFFFF9900, 0xFF33CC33, 0xFFFF3366],
  ),
  ExamplesContent(
    id: 8,
    image: 'assets/images/e8.png',
    title: 'Convers',
    material: 'Structured Genuine Leather',
    size: 39,
    height: 6,
    toe: 'Almond',
    inserts: 'Gel',
    colors: [0xFF663399, 0xFFFF6666, 0xFF00CC99],
  ),
  ExamplesContent(
    id: 9,
    image: 'assets/images/e9.png',
    title: 'T-Strap',
    material: 'Genuine Leather',
    size: 38,
    height: 4,
    toe: 'Classic',
    inserts: 'Air Cushion',
    colors: [0xFFFFFF99, 0xFF9966CC, 0xFFFF6666],
  ),
  ExamplesContent(
    id: 10,
    image: 'assets/images/e10.png',
    title: 'Convers',
    material: 'Structured Genuine Leather',
    size: 37,
    height: 2,
    toe: 'Almond',
    inserts: 'Memory Foam',
    colors: [0xFF3399CC, 0xFFFFCC33, 0xFF669900],
  ),
  ExamplesContent(
    id: 11,
    image: 'assets/images/e11.png',
    title: 'T-Strap',
    material: 'Genuine Leather',
    size: 39,
    height: 3,
    toe: 'Classic',
    inserts: 'Gel',
    colors: [0xFF990099, 0xFFFF6600, 0xFF33CCFF],
  ),
  ExamplesContent(
    id: 12,
    image: 'assets/images/e12.png',
    title: 'Convers',
    material: 'Structured Genuine Leather',
    size: 38,
    height: 3,
    toe: 'Almond',
    inserts: 'Air Cushion',
    colors: [0xFFFF3333, 0xFF339966, 0xFFFFFF33],
  ),
];