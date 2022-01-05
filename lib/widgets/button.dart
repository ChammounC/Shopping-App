import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 12),
      child: Container(
        alignment: Alignment.center,
        height: size.height / 13,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                    style: GoogleFonts.inter(
                        fontSize: size.width * 0.045, color: Colors.white),
                  ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  SocialButton(this.text,this.color, this.path,this.textColor);
  final String text;
  final Color color;
  final Color textColor;
  final String path;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 12),
      child: Container(
        height: size.height / 13,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color:Colors.black12),
        ),
        child: Row(
          children: [
            SizedBox(width: size.width/13,),
            Image.asset(path,height: size.height/30,),
            SizedBox(width: size.width/14),
            Text(text,
              style: GoogleFonts.inter(
                  fontSize: size.width * 0.037, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationButton extends StatelessWidget {
  LocationButton(this.text, this.color, this.path, this.textColor);

  final String text;
  final Color color;
  final Color textColor;
  final String path;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 12),
      child: Container(
        height: size.height / 15,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            SizedBox(width: size.width / 6.5,),
            Image.asset(path, height: size.height / 40,),
            SizedBox(width: size.width / 30),
            Text(text,
              style: GoogleFonts.inter(
                  fontSize: size.width * 0.043, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
