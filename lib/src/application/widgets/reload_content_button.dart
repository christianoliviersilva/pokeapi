import 'package:flutter/material.dart';

class ReloadContentButton extends StatelessWidget {
  const ReloadContentButton({
    Key? key,
    required this.onReload,
    required this.reloadText,
  }) : super(key: key);

  final String reloadText;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onReload,
      style: ElevatedButton.styleFrom(elevation: 0.0),
      child: Text(
        reloadText,
      ),
    );
  }
}
