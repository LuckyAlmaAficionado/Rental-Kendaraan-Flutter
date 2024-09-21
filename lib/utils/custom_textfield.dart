import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.suffixIcon,
    this.obsecure,
    this.preffixIcon,
    this.hintText,
    this.textInputAction,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.fillColor,
    this.maxLines,
    this.textInputType,
    this.maxLenght,
    this.isTextShowing = false,
    this.requiredLabel,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final String? hintText;
  final Widget? preffixIcon;
  final bool? obsecure;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool? readOnly;
  final Color? fillColor;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? maxLenght;
  final bool? isTextShowing;
  final String? requiredLabel;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTextShowing!) ...{
          Text(
            hintText ?? '' ' :',
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
        },
        TextField(
          controller: controller,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.normal,
            fontSize: 13,
          ),
          readOnly: readOnly ?? false,
          autocorrect: false,
          autofillHints: null,
          onChanged: onChanged,
          onTap: onTap,
          cursorColor: Colors.blue,
          obscureText: obsecure ?? false,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
            prefixIconColor: Colors.grey,
            suffixIconColor: Colors.grey,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
        if (requiredLabel != null) ...{
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "* $requiredLabel",
              textAlign: TextAlign.right,
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ),
          )
        }
      ],
    );
  }
}
