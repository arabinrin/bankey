import 'package:bankey/screens/budget.dart';
import 'package:bankey/utils/navigator.dart';
import 'package:bankey/widgets/listtile.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            GestureDetector(
                onTap: () {
                  changeScreen(context, Budget());
                },
                child: ListTiling('images/house.png', 'Budget')),
          ],
        ),
      ),
    );
  }
}
