import 'package:cookify/components/racipe_carts.dart';
import 'package:cookify/models/racipe_model.dart';
import 'package:cookify/screen/detailed_screen/detailed_screen.dart';
import 'package:cookify/services/racipe_api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecipeService _recipeService = RecipeService();
  final TextEditingController _searchController = TextEditingController();

  List<Recipe> _allRecipes = [];
  List<Recipe> _filteredRecipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    try {
      final recipes = await _recipeService.getAllRacipe();
      setState(() {
        _allRecipes = recipes;
        _filteredRecipes = recipes; // initially show all
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint("Error loading recipes: $e");
    }
  }

  void _searchRecipes(String query) {
    final results = _allRecipes.where((recipe) {
      return recipe.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredRecipes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search recipes...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: _searchRecipes, // live filter
              ),
            ),

            // 📌 Recipe List
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredRecipes.isEmpty
                  ? const Center(child: Text("No recipes found"))
                  : ListView.builder(
                      itemCount: _filteredRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = _filteredRecipes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailedScreen(recipe: recipe),
                              ),
                            );
                          },
                          child: RecipeCard(
                            title: recipe.name,
                            cookTime: recipe.cookTimeMinutes,
                            rating: recipe.rating.toString(),
                            thumbnailUrl: recipe.image,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
