import 'package:cookify/models/racipe_model.dart';
import 'package:cookify/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final Recipe recipe;
  const DetailedScreen({super.key, required this.recipe});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 310,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.recipe.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Icon(Icons.arrow_back, size: 34),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),

                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),

          // TABS
          TabBar(
            controller: _tabController,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: 'Ingredients'),
              Tab(text: 'instructions'),
              Tab(text: 'More Detailed'),
            ],
          ),
          SizedBox(height: 23),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.ingredients.map((ingredient) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "• $ingredient",
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.instructions.map((insterction) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "• $insterction",
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.timer),
                          Text('Cooking time : '),
                          Text(widget.recipe.cookTimeMinutes.toString()),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.cake_outlined),
                          Text('difficulty: '),
                          Text(widget.recipe.difficulty.toString()),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.diversity_2_outlined),
                          Text('cuisine: '),
                          Text(widget.recipe.cuisine.toString()),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.rate_review),
                          Text('rating: '),
                          Text(widget.recipe.rating.toString()),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.countertops),
                          Text('reviewCount: '),
                          Text(widget.recipe.reviewCount.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
