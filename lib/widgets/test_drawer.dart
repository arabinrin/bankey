import 'package:flutter/material.dart';

class DrawerUser extends StatefulWidget {
  const DrawerUser({
    Key? key,
    required this.afterCollapse,
    required this.beforeCollapse,
    required this.isCollapsed,
  }) : super(key: key);
  final bool isCollapsed;
  final String beforeCollapse;
  final String afterCollapse;
  @override
  _DrawerUserState createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      curve: Curves.linear,
      duration: Duration(
        milliseconds: 100,
      ),
      width: (widget.isCollapsed) ? width * .15 : width * .4,
      height: width * .15,
      decoration: BoxDecoration(
        borderRadius: (widget.isCollapsed)
            ? BorderRadius.circular((width * .15) / 2)
            : BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: (widget.isCollapsed) ? 1 : 2,
        ),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            (widget.isCollapsed) ? widget.afterCollapse : widget.beforeCollapse,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerCollapse extends StatefulWidget {
  const DrawerCollapse({
    Key? key,
    required this.isCollapsed,
    required this.onTap,
  }) : super(key: key);
  final bool isCollapsed;
  final Function onTap;

  @override
  _DrawerCollapseState createState() => _DrawerCollapseState();
}

class _DrawerCollapseState extends State<DrawerCollapse> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: IconButton(
            icon: (widget.isCollapsed)
                ? Icon(Icons.arrow_forward_ios)
                : Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => widget.onTap(),
          ),
        ),
      ],
    );
  }
}

class DrawerItem extends StatefulWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isCollapsed,
  }) : super(key: key);
  final Icon icon;
  final bool isCollapsed;
  final Text label;

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: (widget.isCollapsed)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        children: [
          widget.icon,
          (widget.isCollapsed)
              ? Container()
              : AnimatedOpacity(
                  duration: Duration(
                    seconds: 1,
                  ),
                  opacity: (widget.isCollapsed) ? 0 : 1,
                  child: widget.label,
                ),
        ],
      ),
    );
  }
}

class SecondDelayedAnimatedOpacity extends StatefulWidget {
  const SecondDelayedAnimatedOpacity({
    Key? key,
    required this.icon,
    required this.label,
    required this.isCollapsed,
  }) : super(key: key);
  final Icon icon;
  final bool isCollapsed;
  final Text label;

  @override
  SecondDelayedAnimatedOpacityState createState() =>
      SecondDelayedAnimatedOpacityState();
}

class SecondDelayedAnimatedOpacityState
    extends State<SecondDelayedAnimatedOpacity> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DrawerWidg extends StatefulWidget {
  const DrawerWidg({Key? key, required this.closeFunction}) : super(key: key);
  final Function closeFunction;

  @override
  _DrawerWidgState createState() => _DrawerWidgState();
}

class _DrawerWidgState extends State<DrawerWidg>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double height;
  late double width;
  double backgroundOpacity = 0;
  bool isCollapsed = true;
  bool isCollapsedAfterSec = true;

  void initializeAnimation() {
    _controller = AnimationController(
      duration: Duration(
        milliseconds: 500,
      ),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    );
    startAnimation();
  }

  void startAnimation() {
    _controller.forward();
    _animation.addListener(() {
      setState(() {
        backgroundOpacity = 0.7 * _animation.value;
      });
    });
  }

  void stopAnimation() {
    _controller.stop();
  }

  void reverseAnimation() {
    _controller.reverse();
  }

  void onCollapseTap() {
    if (isCollapsed) {
      Future.delayed(Duration(
        milliseconds: 70,
      )).then((value) {
        setState(() {
          isCollapsedAfterSec = !isCollapsedAfterSec;
        });
      });
    } else if (!isCollapsed) {
      setState(() {
        isCollapsedAfterSec = !isCollapsedAfterSec;
      });
    }
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(
        backgroundOpacity,
      ),
      body: Row(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (ctx, child) {
              return AnimatedContainer(
                duration: Duration(
                  milliseconds: 70,
                ),
                width: (isCollapsed)
                    ? width * .2 * _animation.value
                    : width * .5 * _animation.value,
                margin: EdgeInsets.only(
                  left: width * .06 * _animation.value,
                  top: height * .05,
                  bottom: height * .05,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: (_animation.value > 0.7)
                    ? Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          DrawerUser(
                            afterCollapse: 'AW',
                            beforeCollapse: 'Aashar Wahla',
                            isCollapsed: isCollapsed,
                          ),

                          DrawerItem(
                            icon: Icon(
                              Icons.bookmarks,
                              color: Colors.white,
                              size: 35,
                            ),
                            label: Text(
                              'Item 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            isCollapsed: isCollapsedAfterSec,
                          ),
                          DrawerItem(
                            icon: Icon(
                              Icons.bookmarks,
                              color: Colors.white,
                              size: 35,
                            ),
                            label: Text(
                              'Item 2',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            isCollapsed: isCollapsedAfterSec,
                          ),
                          DrawerItem(
                            icon: Icon(
                              Icons.bookmarks,
                              color: Colors.white,
                              size: 35,
                            ),
                            label: Text(
                              'Item 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            isCollapsed: isCollapsedAfterSec,
                          ),
                          DrawerItem(
                            icon: Icon(
                              Icons.bookmarks,
                              color: Colors.white,
                              size: 35,
                            ),
                            label: Text(
                              'Item 4',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            isCollapsed: isCollapsedAfterSec,
                          ),
                          DrawerItem(
                            icon: Icon(
                              Icons.bookmarks,
                              color: Colors.white,
                              size: 35,
                            ),
                            label: Text(
                              'Item 5',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            isCollapsed: isCollapsedAfterSec,
                          ),
                          DrawerItem(
                            icon: Icon(
                              Icons.bookmarks,
                              color: Colors.white,
                              size: 35,
                            ),
                            label: Text(
                              'Item 6',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            isCollapsed: isCollapsedAfterSec,
                          ),
                          DrawerItem(
                            icon: Icon(
                              Icons.bookmarks,
                              color: Colors.white,
                              size: 35,
                            ),
                            label: Text(
                              'Item 7',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            isCollapsed: isCollapsedAfterSec,
                          ),
                          Spacer(),
                          // * Bottom Toggle Button
                          if (_controller.value >= 1)
                            DrawerCollapse(
                              isCollapsed: isCollapsed,
                              onTap: onCollapseTap,
                            ),
                        ],
                      )
                    : SizedBox(),
              );
            },
          ),

          // * The left area on the side which will used
          // * to close the drawer when tapped

          Expanded(
            flex: 3,
            child: Container(
              child: GestureDetector(
                onTap: () {
                  reverseAnimation();
                  Future.delayed(
                    Duration(
                      milliseconds: 500,
                    ),
                  ).then(
                    (value) => widget.closeFunction(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}