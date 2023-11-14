enum Complexity { // 調理の難易度
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable, // お手頃価格
  pricey, // 高価格
  luxurious, // ちょー豪華。贅沢
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients, // 食材
    required this.steps,  // 調理手順
    required this.duration, // 調理時間
    required this.complexity, // 複雑さ（調理難易度）
    required this.affordability, // お手頃さ（価格帯）
    required this.isGlutenFree, // 小麦粉不使用(日本でも近年流行中)
    required this.isLactoseFree, // 乳糖不使用(日本ではまだ馴染みが薄い)
    required this.isVegan, // 蜂蜜も革製品も動物性のものは一切ダメだよ！
    required this.isVegetarian, // 乳製品や卵はまぁいいんじゃね？魚も？
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}
