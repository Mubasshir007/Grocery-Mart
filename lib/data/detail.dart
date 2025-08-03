class Item {
  final String cname;
  final String name;
  final double rate;
  final String image;
  final String description;
  final String fact;

  Item({
    required this.cname,
    required this.rate,
    required this.name,
    required this.image,
    required this.description,
    required this.fact,
  });

  // get price => null;

  Map<String, dynamic> toJson() => {
        'cname': cname,
        'name': name,
        'rate': rate,
        'image': image,
        'description': description,
        'fact': fact,
      };

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        cname: json['cname'],
        name: json['name'],
        rate: json['rate'],
        image: json['image'],
        description: json['description'],
        fact: json['fact'],
      );
}

class Category {
  final String name;
  final String images;
  final List<Item> items;

  Category({required this.name, required this.images, required this.items});
}

final List<Category> categories = [
  Category(
    name: "Fresh fruits ",
    images: "assets/images/fruits.png",
    items: [
      Item(
        cname: "Fruits",
        rate: 2.8,
        name: "Apple",
        image: "assets/images/apple.PNG",
        description:
            "An apple is a round, edible fruit, a pome, produced by an apple tree (Malus spp.) and known for its sweet or tart flavor, varying colors like red, green, or yellow, and crisp texture. ",
        fact: "Apples are rich in antioxidants and dietary fiber.",
      ),
      Item(
        cname: "Fruits",
        name: "Mango",
        rate: 4,
        image: "assets/images/mango.png",
        description:
            "A mango is a sweet, tropical stone fruit with a fleshy, yellow to orange-colored pulp, a single large, flattened seed, and a smooth, thin skin that can range in color from green to yellow, red, or a combination. ",
        fact: "Mangoes are rich in vitamin C.",
      ),
    ],
  ),
  Category(
    name: " Natural Vegetables",
    images: "assets/images/vegetables.png",
    items: [
      Item(
        cname: "Vegetables",
        name: "Tomato",
        rate: 3,
        image: "assets/images/tomato.png",
        description:
            "A tomato is a fleshy, usually red, smooth-skinned fruit (botanically a berry) from the nightshade family, often eaten and prepared as a vegetable, and is a good source of vitamins and nutrients. ",
        fact: "Tomatoes are technically a fruit.",
      ),
      Item(
        cname: "Vegetables",
        name: "Onion",
        rate: 1.8,
        image: "assets/images/onion.png",
        description:
            "Onions are a widely cultivated, herbaceous biennial plant (Allium cepa) known for its pungent, edible bulb, which consists of concentric layers of white, fleshy leaf bases. They are a staple in many cuisines and belong to the same family as garlic, leeks, and chives. ",
        fact: "High in iron and protein.",
      ),
      Item(
        cname: "Vegetables",
        name: "potato",
        rate: 2,
        image: "assets/images/potato.png",
        description:
            "Potatoes are starchy, underground tubers, native to the Americas, and a staple food in many parts of the world, belonging to the nightshade family (Solanaceae). ",
        fact: "High in iron.",
      ),
    ],
  ),
  Category(
    name: "Diaries & Egg",
    images: "assets/images/egg.png",
    items: [
      Item(
        cname: "Diaries & Egg",
        name: "Pure milk",
        rate: 2.5,
        image: "assets/images/egg.png",
        description:
            "Milk is a nutrient-rich, white liquid produced by mammals, primarily for feeding their young. It's a complex emulsion of water, fats, proteins, carbohydrates (including lactose), vitamins, and minerals.",
        fact:
            "Milk is a good source of protein, calcium, vitamin B12, riboflavin, phosphorus, and potassium. ",
      ),
      Item(
        cname: "Diaries & Egg",
        name: "Yoghurt",
        rate: 3.2,
        image: "assets/images/youghurt.png",
        description:
            "ogurt is a fermented milk product, traditionally made by adding specific bacteria cultures (like Lactobacillus bulgaricus and Streptococcus thermophilus) to milk",
        fact: "High in iron and protein.",
      ),
      Item(
        cname: "Diaries & Egg",
        name: "Dozen Egg",
        rate: 1.2,
        image: "assets/images/eggg.png",
        description:
            "Eggs are a nutrient-rich food, providing high-quality protein, vitamins, and minerals. They consist of an eggshell, egg white (albumen), and egg yolk (vitellus). ",
        fact: "High in iron.",
      ),
    ],
  ),
  Category(
    name: "Cooking oil & Ghee",
    images: "assets/images/oil.png",
    items: [
      Item(
        cname: "Cooking oil and ghee",
        name: "Dalda oil",
        rate: 2.9,
        image: "assets/images/daldaoil.png",
        description:
            "Oil, also known as petroleum or crude oil, is a naturally occurring, flammable liquid composed primarily of hydrocarbons. It's a fossil fuel formed from the remains of ancient organisms ",
        fact: "Dalda oil are pure oil ",
      ),
      Item(
        cname: "Cooking oil and ghee",
        name: "Sufi oil",
        rate: 3.2,
        image: "assets/images/sufioil.png",
        description:
            "Oil, also known as petroleum or crude oil, is a naturally occurring, flammable liquid composed primarily of hydrocarbons. It's a fossil fuel formed from the remains of ancient organisms",
        fact: "High in iron and protein.",
      ),
      Item(
        cname: "Cooking oil and ghee",
        name: "Kashmir oil",
        rate: 3.5,
        image: "assets/images/kashmiroil.png",
        description:
            "Potatoes are starchy, underground tubers, native to the Americas, and a staple food in many parts of the world, belonging to the nightshade family (Solanaceae). ",
        fact: "High in iron.",
      ),
    ],
  ),
  Category(
    name: "bakery & Snacks",
    images: "assets/images/bread.png",
    items: [
      Item(
        cname: "bakery & Snacks",
        name: "Down Bread",
        rate: 2.2,
        image: "assets/images/downbread.png",
        description:
            "Bread is a staple food made from dough, typically composed of flour, water, and yeast or other leavening agents, and then baked. It's a globally consumed food with a rich history and diverse varieties",
        fact: "Bread are High in iron and protein.",
      ),
      Item(
        cname: "bakery & Snacks",
        name: "Down Rusk",
        rate: 3.2,
        image: "assets/images/rusk.png",
        description:
            "rusk is a staple food made from dough, typically composed of flour, water, and yeast or other leavening agents, and then baked. It's a globally consumed food with a rich history and diverse varieties",
        fact: "High in iron and protein.",
      ),
    ],
  ),
];

class DataRepository {
  // Fetch all items from categories and subcategories
  static List<Item> getAllItems() {
    final List<Item> allItems = [];
    for (final category in categories) {
      allItems.addAll(category.items);
    }
    return allItems;
  }

  // Filter items with price < 3
  static List<Item> getRecommendedItems() {
    return getAllItems().where((item) => item.rate <= 3).toList();
  }
}
