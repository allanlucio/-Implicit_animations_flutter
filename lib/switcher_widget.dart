import 'package:flutter/material.dart';

class SwitcherWidget extends StatefulWidget {
  final double size;
  final bool initialValue;
  final Color unselectedColor;
  final Duration duration;
  final String title;
  final void Function(bool isSelected) onChanged;

  const SwitcherWidget(
      {Key key,
      this.size = 25,
      this.initialValue = false,
      this.unselectedColor = Colors.grey,
      this.duration = const Duration(milliseconds: 200),
      @required this.title,
      this.onChanged})
      : assert(title != null),
        super(key: key);

  @override
  _SwitcherWidgetState createState() => _SwitcherWidgetState(initialValue);
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  Color color;
  bool isSelected;

  _SwitcherWidgetState(this.isSelected);

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        this.setState(() {
          isSelected = !isSelected;
        });
        if(widget.onChanged!=null) this.widget.onChanged(isSelected);
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Expanded(
                child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: color, fontSize: 20),
            )),
            AnimatedContainer(
              duration: widget.duration,
              width: widget.size * 3,
              height: widget.size,
              alignment: isSelected ? Alignment.topRight : Alignment.topLeft,
              decoration: BoxDecoration(
                  color: isSelected
                      ? color.withAlpha(100)
                      : widget.unselectedColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(5)),
              child: AnimatedContainer(
                duration: widget.duration,
                decoration: BoxDecoration(
                    color: isSelected
                        ? color.withAlpha(100)
                        : widget.unselectedColor,
                    borderRadius: BorderRadius.circular(5)),
                width: widget.size,
                height: widget.size,
              ),
            )
          ],
        ),
      ),
    );
  }
}
