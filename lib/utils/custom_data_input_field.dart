import 'package:ahamsvastha/utils/aham_svastha_user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDataInputField extends StatefulWidget {
  String unit;
  final List<String>? units;
  String? initialValue;
  Unit? initialUnit;
  final Function(double, Unit) onSubmitted;
  CustomDataInputField(
      {Key? key,
      required this.unit,
      required this.onSubmitted,
      this.units,
      this.initialValue,
      this.initialUnit})
      : super(key: key);

  @override
  _CustomDataInputFieldState createState() => _CustomDataInputFieldState();
}

class _CustomDataInputFieldState extends State<CustomDataInputField> {
  bool isUnitListDisplayed = false;
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
  @override
  Widget build(BuildContext context) {
    print(widget.initialUnit != null ? widget.initialUnit!.value : "No USINT");
    return Container(
      height: 300,
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            width: 260,
            child: Center(
              child: SizedBox(
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Container(
                    width: 250,
                    padding: EdgeInsets.all(8),
                    color: Color(0xFF4d4990),
                    child: Row(
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              height: 60,
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: TextEditingController(
                                    text: widget.initialValue ?? ""),
                                cursorColor: Color(0xFF93a4ee),
                                onSubmitted: (String data) {
                                  widget.onSubmitted(
                                      double.parse(data), getUnit(widget.unit));
                                },
                                style: TextStyle(
                                  fontFamily: "Quicksand",
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF93a4ee),
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "",
                                  hintStyle: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFccd5fb)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        widget.units == null
                            ? Text(
                                widget.initialUnit != null
                                    ? widget.initialUnit!.value
                                    : widget.unit,
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(36),
                                child: InkWell(
                                  onTap: () {
                                    print(widget.unit);
                                    setState(() {
                                      isUnitListDisplayed =
                                          !isUnitListDisplayed;
                                    });
                                  },
                                  child: Container(
                                    color: Color(0xFF393678),
                                    height: 50,
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          widget.initialUnit != null
                                              ? widget.initialUnit!.value
                                              : widget.unit,
                                          style: TextStyle(
                                              fontFamily: "Quicksand",
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/ic_drop_down.svg",
                                          width: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 170, right: 34),
            child: isUnitListDisplayed
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      height: 75,
                      width: 100,
                      alignment: Alignment.bottomRight,
                      color: Colors.white,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                            scrollbars: false, dragDevices: dragDevices),
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: widget.units!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.unit = widget.units![index];
                                    Unit unit = UnitValue.fromRaw(widget.unit);
                                    widget.initialUnit = unit;
                                    isUnitListDisplayed = false;
                                  });
                                },
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(widget.units![index]),
                                )),
                              );
                            }),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Unit getUnit(String unit) {
    if (unit == "cms") {
      return Unit.CMS;
    } else if (unit == "in") {
      return Unit.INCHES;
    } else if (unit == "feet") {
      return Unit.FEET;
    } else if (unit == "kgs") {
      return Unit.KGS;
    } else if (unit == "lbs") {
      return Unit.LBS;
    } else {
      return Unit.NO_UNIT;
    }
  }
}
