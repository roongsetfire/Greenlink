import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  String date = DateTime.now().toString().substring(0, 11);
  String datepick = DateFormat.yMd().format(DateTime.now());
  int remainingTicket = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(25, 25, 25, 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                'หมายเลขที่เลือก',
                style: TextStyle(fontFamily: 'Kanit', fontSize: 18),
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // เลขแต่ละแถว
          Column(
            children: [
              // row1

              createTicketNumber(ticketnumber: 3579, expdate: datepick),
              // row2

              createTicketNumber(ticketnumber: 6598, expdate: datepick),

              // row3
              createTicketNumber(ticketnumber: 2469, expdate: datepick),
            ],
          ),
          // remaining ticket
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text(
              'คงเหลือ $remainingTicket สิทธิ',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Kanit',
                color: Colors.lightGreen.shade900,
              ),
            ),
          ),
          // button เลือกหมายเลข
          Container(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightGreen.shade700),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
                onPressed: () {},
                child: Text(
                  'เลือกหมายเลข',
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 18),
                )),
          )
        ]));
  }

  Widget createTicketNumber({int ticketnumber, String expdate}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.green),
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightGreen.shade50
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$ticketnumber',
            style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 20,
                color: Colors.lightGreen.shade800),
          ),
          Text(
            'วันที่ $expdate',
            style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 14,
                color: Colors.green.shade600),
          ),
        ],
      ),
    );
  }
}
