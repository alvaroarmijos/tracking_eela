import 'package:flutter/material.dart';

class SearchDestionationDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.navigate_before,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      iconColor: Colors.purple,
      leading: const Icon(Icons.location_on_outlined),
      title: const Text('Colocar la ubicación en el mapa'),
      onTap: () {
        close(context, null);
      },
    );
  }
}
