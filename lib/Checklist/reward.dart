import 'package:flutter/material.dart';

class Reward extends StatefulWidget {
  @override
  _RewardState createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 20, 25, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'กติการางวัลขยะลุ้นทอง',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              '1. หมายเลขที่ได้รางวัลจะอ้างอิงจากเลขท้าย 4 ตัว ของรางวัลที่ 1 ของสลากกินแบ่งรัฐบาล',
              style: TextStyle(
                  fontFamily: 'Kanit',
                  color: Colors.grey.shade600,
                  fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              '2. โดยจะใช้เลขรางวัลของงวดแรก ของเดือนถัดไป',
              style: TextStyle(
                  fontFamily: 'Kanit',
                  color: Colors.grey.shade600,
                  fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  'รางวัลประจำเดือน',
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 18),
                ),
              ),
            ],
          ),
          Container(
            height: 135,
            padding: EdgeInsets.only(bottom: 5),
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                createPrize(
                    iconPrize: Icons.emoji_events,
                    noPrize: '1st',
                    numberTicketReward: 3456,
                    rewardDetail: 'ทองคำแท่งหนัก 1 กรัม',
                    detailUserReward: 'เต้ พระราม7'),
                createPrize(
                    iconPrize: Icons.emoji_events,
                    noPrize: '2nd',
                    numberTicketReward: 6789,
                    rewardDetail: 'ทองคำแท่งหนัก 0.5 กรัม',
                    detailUserReward: 'อ็อด พระประแดง'),
                createPrize(
                    iconPrize: Icons.emoji_events,
                    noPrize: '3rd',
                    numberTicketReward: 6789,
                    rewardDetail: 'ทองคำแท่งหนัก 0.5 กรัม',
                    detailUserReward: 'อ็อด พระประแดง'),
                createPrize(
                    iconPrize: Icons.emoji_events,
                    noPrize: '4th',
                    numberTicketReward: 6789,
                    rewardDetail: 'ทองคำแท่งหนัก 0.5 กรัม',
                    detailUserReward: 'อ็อด พระประแดง'),
                createPrize(
                    iconPrize: Icons.emoji_events,
                    noPrize: '5th',
                    numberTicketReward: 6789,
                    rewardDetail: 'ทองคำแท่งหนัก 0.5 กรัม',
                    detailUserReward: 'อ็อด พระประแดง'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createPrize(
      {IconData iconPrize,
      String noPrize,
      int numberTicketReward,
      String rewardDetail,
      String detailUserReward}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.green),
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightGreen.shade50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconPrize,
                    size: 25,
                  ),
                  Text(
                    '$noPrize',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$numberTicketReward',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 16,
                        color: Colors.lightGreen.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$rewardDetail',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 10,
                        color: Colors.green.shade600),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ขอแสดงความยินดีกับ',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 13,
                    color: Colors.lightGreen.shade700),
              ),
              Text(
                'คุณ $detailUserReward',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 12,
                    color: Colors.lightGreen.shade700,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
