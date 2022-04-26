import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FundForm extends StatefulWidget {
  const FundForm({Key? key}) : super(key: key);

  @override
  _FundFormState createState() => _FundFormState();
}

class _FundFormState extends State<FundForm>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(.5, 1.0, curve: Curves.easeInOut),
        parent: animationController));
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(.8, 1.0, curve: Curves.easeInOut),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height.h;
    final width = MediaQuery.of(context).size.width.w;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Fund Wallet ',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: .4,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            
          ),
          SizedBox(height: 50.h,),
          
        ],
      ),
    );
  }
}
