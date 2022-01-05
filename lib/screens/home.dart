import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oyelabs/providers/address_provider.dart';
import 'package:oyelabs/screens/home_sections/six_blocks.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildAppBar(size),
              buildBanner(size),
              SizedBox(height: size.height / 60),
              SixBlock(),
              SizedBox(height: size.height / 60),
              buildServices(size),
              SizedBox(height: size.height / 60),
              Container(
                width: size.width,
                height: size.height / 8,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/home/why_choose_us.png',
                  ),
                ),
              ),
              SizedBox(height: size.height / 60),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/home/shield.png',
                            width: size.width / 15),
                        SizedBox(width: size.width / 30),
                        Text(
                          'Why Choose Us',
                          style: GoogleFonts.raleway(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height / 30),
                    Container(
                      height: size.height / 8.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12, width: 0.7),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: size.width / 20),
                          Image.asset('assets/home/badge.png'),
                          SizedBox(width: size.width / 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Quality Assurance',
                                style: GoogleFonts.raleway(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height / 80),
                              Text(
                                'Your satisfaction is guaranteed',
                                style: GoogleFonts.raleway(
                                    fontSize: size.width * 0.04),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height / 50),
                    Container(
                      height: size.height / 8.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12, width: 0.7),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: size.width / 20),
                          Flexible(
                              flex: 2,
                              child: Image.asset('assets/home/price_tag.png')),
                          SizedBox(width: size.width / 20),
                          Flexible(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Fixed Prices',
                                  style: GoogleFonts.raleway(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: size.height / 80),
                                Text(
                                  'No hidden cost, all the prices are known and fixed before booking',
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  style: GoogleFonts.raleway(
                                      fontSize: size.width * 0.035),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height / 50),
                    Container(
                      height: size.height / 8.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12, width: 0.7),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: size.width / 17),
                          Image.asset('assets/home/finger_tap.png'),
                          SizedBox(width: size.width / 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hazzle free',
                                style: GoogleFonts.raleway(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height / 80),
                              Text(
                                'convenient, time saving and secure',
                                style: GoogleFonts.raleway(
                                    fontSize: size.width * 0.035),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height / 10,
                color: Colors.black,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Best-in Class Safety Measures',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height / 3,
                color: Color(0xFFF7FBFF),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width / 22),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/home/mask.png'),
                            Image.asset('assets/home/social_distance.png'),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(right: size.width / 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Usage of masks, gloves & Sanitisers',
                                  style: GoogleFonts.inter(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: size.height / 80),
                                Text(
                                  'Masks should be used as part of a comprehensive strategy of measures to suppress transmission and save lives.',
                                  style: GoogleFonts.inter(
                                    fontSize: size.width * 0.03,
                                    color: Color(0xFF7E7E7E),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Low-contact Service Experience',
                                  style: GoogleFonts.inter(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: size.height / 80),
                                Text(
                                  'Masks should be used as part of a comprehensive strategy of measures to suppress transmission and save lives.',
                                  style: GoogleFonts.inter(
                                    fontSize: size.width * 0.03,
                                    color: Color(0xFF7E7E7E),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height / 4,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: size.height / 10),
                    Text(
                      'HASSLE FREE',
                      style: GoogleFonts.inter(
                          color: Color(0x9AC4C4C4),
                          fontSize: size.width / 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'QUALITY SERVICE',
                      style: GoogleFonts.inter(
                          color: Color(0x9AC4C4C4),
                          fontSize: size.width / 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height / 30),
                    Text(
                      'V 1.0',
                      style: GoogleFonts.inter(
                        color: Color(0x9AC4C4C4),
                        fontSize: size.width / 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          SizedBox(height: size.height / 12, child: buildBottomNavigationBar()),
    );
  }

  Container buildServices(Size size) {
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width,
      height: size.height / 4,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Services',
            style: GoogleFonts.raleway(
                fontSize: size.width * 0.06, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height / 70),
          Container(
            width: size.width,
            height: size.height / 6.6,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Column(
                    children: [
                      Card(
                        child: Image.asset(
                          'assets/home/service/kitchen.png',
                          width: size.width / 3,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: size.height / 70),
                      Text(
                        'Kitchen Cleaning',
                        style: GoogleFonts.inter(fontSize: size.width * 0.035),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Card(
                        child: Image.asset(
                          'assets/home/service/sofa.png',
                          width: size.width / 3,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: size.height / 70),
                      Text(
                        'Sofa Cleaning',
                        style: GoogleFonts.inter(fontSize: size.width * 0.035),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Card(
                        child: Image.asset(
                          'assets/home/service/kitchen.png',
                          width: size.width / 3,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: size.height / 70),
                      Text(
                        'Full House Cleaning',
                        style: GoogleFonts.inter(fontSize: size.width * 0.035),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack buildBanner(Size size) {
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 3.7,
          color: Colors.black,
          child: Image.asset(
            'assets/home/banner/man.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: size.width,
          height: size.height / 3.7,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
            stops: [0.3, 0.6],
          )),
        ),
        Positioned(
            left: size.width / 18,
            top: size.width / 30,
            child: Image.asset(
              'assets/home/banner/man_icons.png',
              height: size.height / 4.3,
            )),
        Positioned(
            left: size.width / 2.2,
            bottom: 5,
            child: Image.asset(
              'assets/home/banner/bullet.png',
              width: size.width / 8,
            ))
      ],
    );
  }

  Container buildAppBar(Size size) {
    return Container(
      height: size.height / 12,
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: size.width / 15),
                        Image.asset(
                          'assets/home/loc.png',
                          width: size.width / 30,
                        ),
                        SizedBox(width: size.width / 60),
                        Text(
                          ' Home ',
                          style: GoogleFonts.inter(
                              fontSize: size.width * 0.047,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset('assets/home/down_arrow.png',
                            width: size.width / 32),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: size.width / 15),
                      Text(
                        context.watch<AddressProvider>().address.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.black,fontSize: size.width*0.03),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/home/search.png',
                  width: size.width / 17,
                ),
              )),
        ],
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: NavIcon('home', false),
          label: 'Home',
          activeIcon: NavIcon('home', true),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('gift', false),
          label: 'Rewards',
          activeIcon: NavIcon('gift', true),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('purchase_order', false),
          label: 'My Orders',
          activeIcon: NavIcon('purchase_order', true),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('booking', false),
          label: 'Bookings',
          activeIcon: NavIcon('booking', true),
        ),
        BottomNavigationBarItem(
          icon: NavIcon('user', false),
          label: 'Profile',
          activeIcon: NavIcon('user', true),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

class NavIcon extends StatelessWidget {
  NavIcon(this.text, this.isActive);
  final String text;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/home/bottom_nav/$text.png',
      color: isActive ? Colors.black : Color(0xFF9C9C9C),
    );
  }
}
