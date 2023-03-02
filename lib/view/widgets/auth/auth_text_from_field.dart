import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  const AuthTextFromField(
      {required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      // obscureText: obscureText, //to put the letter invisivle
      // cursorColor: Colors.black,
      // keyboardType: TextInputType.text,
      // validator: (value) => validator(value),
      // decoration: InputDecoration(
      //   fillColor: Colors.grey.shade200, //for the color of the text
      //   prefixIcon: prefixIcon, //for the icons in the first of input
      //   suffixIcon: suffixIcon, //for the icons in the last of input
      //   hintText: hintText, //for the text of the input
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        filled: true,
        border: InputBorder.none,
        focusedBorder: InputBorder.none, // remove border on focus
        enabledBorder: InputBorder.none, // remove border on enabled
        // enabledBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: Colors.white,
        //   ),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(
        //     color: Colors.white,
        //   ),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      // Set the text style of the input to black
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
