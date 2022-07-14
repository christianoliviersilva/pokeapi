import 'package:flutter/material.dart';
import 'package:minha_pokedex/src/utils/strings.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    required this.onChanged,
    this.searchText = '',
  }) : super(key: key);

  final Function(String) onChanged;
  final String searchText;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.white,
            width: 1.6,
          ),
        ),
        color: Colors.grey[800],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                onTap: () {
                  controller.clear();
                  onChanged('');
                },
                decoration: InputDecoration(
                  enabled: true,
                  isDense: true,
                  hintText: Strings.searchForPokemon,
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 1.6,
                ),
              ),
              child: Icon(
                Icons.search,
                color: Colors.red,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
