class SearchService {
  final List<String> _mockProducts = [
    'iPhone 15',
    'Galaxy S23',
    'Pixel 8',
    'OnePlus 11',
    'Xiaomi 13',
    'MacBook Pro',
    'Dell XPS',
    'HP Spectre',
    'Lenovo ThinkPad',
    'Surface Laptop',
    'iPad Pro',
    'Galaxy Tab',
    'Surface Pro',
    'Fire Tablet',
    'AirPods Pro',
    'Sony Headphones',
    'Bose Headphones',
    'Galaxy Buds',
    'Apple Watch',
    'Galaxy Watch',
    'Pixel Watch',
    'Google Nest',
    'Amazon Echo',
    'HomePod mini',
    'PlayStation 5',
    'Xbox Series X',
    'Nintendo Switch',
    'MagSafe Charger',
    'Power Bank',
    'Wireless Keyboard'
  ];

  Future<List<String>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (query.isEmpty) return [];
    
    if (query.toLowerCase() == 'error') {
      throw Exception('Failed to fetch search results');
    }
    
    return _mockProducts.where((product) => 
      product.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}
