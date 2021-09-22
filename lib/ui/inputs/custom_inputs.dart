import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),

        // Mensajes de error
        errorStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)));
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }

  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF4511E), width: 2),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF4511E).withOpacity(0.3))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF4511E).withOpacity(0.3))),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFFF4511E)),
        labelStyle: TextStyle(color: Color(0xFFF4511E)),
        hintStyle: TextStyle(color: Color(0xFFF4511E)),

        // Mensajes de error
        errorStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)));
  }
}
