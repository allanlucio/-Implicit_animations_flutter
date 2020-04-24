import 'package:flutter/material.dart';

class SwitcherWidget extends StatefulWidget {
  @override
  _SwitcherWidgetState createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  double size = 25;
  bool isSelected = false;
  Color color;
  Color unselectedColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        this.setState((){
          isSelected = !isSelected;
        });
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              "Salvar Dados",
            )),
            Container(
              width: size * 3,
              height: size,
              alignment: isSelected ? Alignment.topRight : Alignment.topLeft,
              decoration: BoxDecoration(
                  color: isSelected
                      ? color.withAlpha(100)
                      : unselectedColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                decoration: BoxDecoration(
                    color: isSelected ? color.withAlpha(100) : unselectedColor,
                    borderRadius: BorderRadius.circular(5)),
                width: size,
                height: size,
              ),
            )
          ],
        ),
      ),
    );
  }
}
