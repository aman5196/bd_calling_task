import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Increased padding for better aesthetics
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Bold and larger text
        backgroundColor: Colors.green, // Custom button color
        foregroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Slightly rounded rectangle
        ),
        elevation: 5, // Shadow for a more elevated look
      ),
      child: Text(text),
    );
  }
}
