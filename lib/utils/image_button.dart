import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  Widget child;
  Function onPressed;
  bool? shouldBeHighlighted = false;
  Color? highlightColor = Colors.black;
  double? highlightOpacity = 0.2;
  bool? shouldBeChecked = false;
  Alignment? checkPosition = Alignment.bottomRight;

  ImageButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.shouldBeHighlighted,
      this.highlightColor,
      this.highlightOpacity,
      this.shouldBeChecked,
      this.checkPosition})
      : super(key: key);

  @override
  _ImageButtonState createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  bool isHighlighted = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            isHighlighted = true;

            widget.onPressed();
            Future.delayed(Duration(milliseconds: 250), () {
              setState(() {
                isHighlighted = false;
              });
            });
          });
        },
        child: Stack(
          children: [
            Container(
              child: widget.child,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    (widget.highlightColor ?? Colors.black)
                        .withOpacity(isHighlighted
                            ? (widget.highlightOpacity ?? 0.2)
                            : (widget.shouldBeHighlighted ?? false)
                                ? (widget.highlightOpacity ?? 0.2)
                                : 0),
                    BlendMode.srcATop),
                child: widget.child,
              ),
            ),
            Opacity(
              opacity: (widget.shouldBeChecked ?? false) ? 1 : 0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: widget.checkPosition ?? Alignment.bottomRight,
                child: ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.green.withOpacity(0.2),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Container(
                              color: Colors.green,
                              child: Flexible(
                                child: Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
