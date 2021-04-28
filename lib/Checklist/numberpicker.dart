import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PickNumber extends StatefulWidget {
  final VoidCallback onPressed;
  PickNumber({this.onPressed});
  @override
  _PickNumberState createState() => _PickNumberState();
}

class _PickNumberState extends State<PickNumber> {
  int _currentIntValue = 1000;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 16),
      Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Text('กรุณาเลือกหมายเลข',
            style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 24,
              color: Colors.lightGreen.shade700,
            )),
      ),
      NumberPicker(
        value: _currentIntValue,
        minValue: 1000,
        maxValue: 9990,
        step: 31,
        haptics: true,
        selectedTextStyle: TextStyle(
            color: Colors.lightGreen, fontFamily: 'Kanit', fontSize: 28),
        textStyle: TextStyle(
            color: Colors.grey.shade400, fontFamily: 'Kanit', fontSize: 18),
        onChanged: (value) => setState(() => _currentIntValue = value),
      ),
      SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.grey.shade600,
            ),
            onPressed: () => setState(() {
              final newValue = _currentIntValue - 31;
              _currentIntValue = newValue.clamp(1000, 9990);
            }),
          ),
          Text(
            'Current int value: $_currentIntValue',
            style: TextStyle(
                fontFamily: 'Kanit', fontSize: 18, color: Colors.grey.shade500),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.grey.shade600,
            ),
            onPressed: () => setState(() {
              final newValue = _currentIntValue + 31;
              _currentIntValue = newValue.clamp(1000, 9990);
            }),
          ),
        ],
      ),
      ElevatedButton(
          onPressed: () {
            widget.onPressed();
          },
          child: Text('บันทึก'))
    ]);
  }
}
