import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: Implement the search screen UI
    // Requirements:
    // - Create a TextField for user input
    // - Display search results in a ListView
    // - Show loading indicator while waiting for results
    // - Display a message if no results or errors
    // - Connect to the SearchProvider for state
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.grey.shade500,
                  size: 24,
                ),
                filled: true,
                fillColor: Colors.grey.withValues(alpha: 0.1),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.search,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
            ),
            
            // TODO: Implement the results ListView with appropriate states
            // - Loading state
            // - Error state
            // - Empty state
            // - Success state with results
            
            Expanded(
              child: Center(
                child: Text(
                  'Implement search functionality using RxDart and Provider',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
