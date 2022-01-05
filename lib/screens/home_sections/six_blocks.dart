import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SixBlock extends StatelessWidget {
  const SixBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 3.6,
      child: Column(
        children: [
          Divider(height: 1),
          Row(
            children: [
              Container(
                  width: size.width / 3.02,
                  height: size.height / 7.3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 40),
                      Image.asset('assets/home/six_blocks/renovation.png',
                          width: size.width / 11),
                      SizedBox(height: size.height / 70),
                      Text(
                        'Renovation',
                        style: GoogleFonts.inter(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              VerticalDivider(width: 1),
              Container(
                  width: size.width / 3.02,
                  height: size.height / 7.3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 40),
                      Image.asset('assets/home/six_blocks/handyman.png',
                          width: size.width / 10),
                      SizedBox(height: size.height / 64),
                      Text(
                        'Handyman',
                        style: GoogleFonts.inter(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              VerticalDivider(width: 1),
              Container(
                  width: size.width / 3.02,
                  height: size.height / 7.3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 40),
                      Image.asset('assets/home/six_blocks/moving_bus.png',
                          width: size.width / 10),
                      SizedBox(height: size.height / 67),
                      Text(
                        'Home shifting',
                        style: GoogleFonts.inter(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
          Divider(height: 1),
          Row(
            children: [
              Container(
                  width: size.width / 3.02,
                  height: size.height / 7.3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 40),
                      Image.asset('assets/home/six_blocks/gardening.png',
                          width: size.width / 10),
                      SizedBox(height: size.height / 70),
                      Text(
                        'Gardening',
                        style: GoogleFonts.inter(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              VerticalDivider(width: 1),
              Container(
                  width: size.width / 3.02,
                  height: size.height / 7.3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 40),
                      Image.asset('assets/home/six_blocks/declutter.png',
                          width: size.width / 10),
                      SizedBox(height: size.height / 64),
                      Text(
                        'Declutter',
                        style: GoogleFonts.inter(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              VerticalDivider(width: 1),
              Container(
                  width: size.width / 3.02,
                  height: size.height / 7.3,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 40),
                      Image.asset('assets/home/six_blocks/paint_brush.png',
                          width: size.width / 10),
                      SizedBox(height: size.height / 67),
                      Text(
                        'Painting',
                        style: GoogleFonts.inter(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
