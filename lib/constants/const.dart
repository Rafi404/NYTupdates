import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const apiKey = "ENM0U15T8w6EKzRhMSGl1SfRVpHz4lL7";

///colors
const Color primaryColor = Color(0XFFEAF4FF);
const Color secondaryColor = Color(0XFF006492);

///Text styles
TextStyle articleTitle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: const Color(0XFF40464F),
);

TextStyle articleDescription = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: Colors.grey,
);

TextStyle articleAuthor = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Colors.black,
);

///Heights
const height5 = SizedBox(height: 5);
const height10 = SizedBox(height: 10);
const height15 = SizedBox(height: 15);
const height20 = SizedBox(height: 20);
const height25 = SizedBox(height: 25);
const height30 = SizedBox(height: 30);

///Widths
const width5 = SizedBox(width: 5);
const width10 = SizedBox(width: 10);
const width15 = SizedBox(width: 15);
const width20 = SizedBox(width: 20);
const width30 = SizedBox(width: 30);

/// Text
const String errorMessage = "Error occurred";
const String tryMessage = "Error occurred, Please Try Again";
