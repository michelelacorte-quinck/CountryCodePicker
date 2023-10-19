import 'package:flutter/material.dart';

import '../country_code_picker.dart';

class Utils {
  static void showStaticDialog(BuildContext context,
      Function(CountryCode) onChanged) async {
    List<Map<String, String>> jsonList = codes;

    List<CountryCode> elements =
    jsonList.map((json) => CountryCode.fromJson(json)).toList();

    final item = await showDialog(
      barrierColor: Colors.grey.withOpacity(0.5),
      context: context,
      builder: (context) =>
          Dialog(
            child: SelectionDialog(
              elements,
              [],
              showCountryOnly: false,
              showFlag: true,
              closeIcon: const Icon(Icons.close),
            ),
          ),
    );
    onChanged.call(item);
  }
}