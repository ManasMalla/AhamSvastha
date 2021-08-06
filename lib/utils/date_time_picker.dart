import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DateTimeData { TIME, DATE, DATE_TIME }

class DateTimePicker extends StatefulWidget {
  final DateTimeData dataRequired;
  final Function(DateTime) onSelected;
  DateTime? initialDate;
  DateTimePicker(
      {Key? key,
      required this.dataRequired,
      required this.onSelected,
      this.initialDate})
      : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? dateTime;
  String formatDate(DateTime dateTime) {
    return DateFormat(widget.dataRequired == DateTimeData.DATE
            ? "E, MMM dd yyyy"
            : widget.dataRequired == DateTimeData.TIME
                ? "kk:mm"
                : "MMM dd yyyy kk:mm")
        .format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(48),
      child: Container(
        width: 250,
        height: 80,
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
                  child: Center(
                    child: Text(
                      widget.initialDate != null
                          ? formatDate(widget.initialDate!)
                          : (dateTime == null
                              ? ""
                              : formatDate(
                                  dateTime ?? DateTime.now(),
                                )),
                      style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF93a4ee)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 0,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12, right: 12),
              child: IconButton(
                onPressed: () async {
                  dateTime = await showDatePicker(
                    context: context,
                    initialDate:
                        dateTime ?? (widget.initialDate ?? DateTime.now()),
                    firstDate: DateTime(DateTime.now().year - 150),
                    lastDate: DateTime.now(),
                  );
                  setState(() {
                    widget.onSelected(
                        dateTime ?? (widget.initialDate ?? DateTime.now()));
                  });
                },
                icon: Icon(
                  Icons.date_range_rounded,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
