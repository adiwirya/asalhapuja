import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:asalhapuja/data/utils/utils.dart';

class MyDropdownSearch extends StatelessWidget {
  const MyDropdownSearch({
    required this.hint,
    required this.icon,
    required this.items,
    this.selectedItem,
    this.onChanged,
    super.key,
  });

  final String hint;
  final Widget icon;
  final Function(String?)? onChanged;
  final List<String> items;
  final String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      validator: emptyValue,
      decoratorProps: DropDownDecoratorProps(
        baseStyle: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ThemeColors.gray.shade900,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ThemeColors.gray.shade900),
          ),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
      ),

      onChanged: onChanged,
      items: (filter, infiniteScrollProps) => items,
      selectedItem: selectedItem,
    );
  }
}
