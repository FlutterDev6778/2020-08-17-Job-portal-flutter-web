import 'package:flutter/material.dart';
import 'package:job_portal/src/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';

class CustomAvatarStackWidget extends StatelessWidget {
  CustomAvatarStackWidget({
    Key key,
    @required this.avatarSize,
    @required this.userData,
    this.maxCount = 4,
  }) : super(key: key);
  final double avatarSize;
  final List<Map<String, dynamic>> userData;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];
    try {
      for (int i = maxCount - 1; i >= 0; i--) {
        if (i >= userData.length) {
          listWidget.add(SizedBox());
        } else if (i == maxCount - 1 && userData.length > maxCount) {
          listWidget.add(
            Positioned(
              left: i * avatarSize * 0.7,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(avatarSize / 2),
                  color: Color(0xFFCDD4D8),
                ),
                alignment: Alignment.center,
                child: Text(
                  "+${userData.length - maxCount + 1}",
                  style: TextStyle(fontSize: avatarSize * 0.4, color: Color(0xFF07293D)),
                ),
              ),
            ),
          );
        } else {
          listWidget.add(
            Positioned(
              left: i * avatarSize * 0.7,
              child: CustomNetworkImage(
                url: userData[i]["avatarUrl"],
                width: avatarSize,
                height: avatarSize,
                borderRadius: avatarSize / 2,
                borderWidth: 2,
                borderColor: Colors.white,
                loadingWidget: Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(avatarSize / 2),
                    color: Color(0xFFCDD4D8),
                  ),
                ),
                errorWidget: Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(avatarSize / 2),
                    color: Color(0xFFCDD4D8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    (userData[i]["name"] != null) ? userData[i]["name"].substring(0, 1).toUpperCase() : "UN",
                    style: TextStyle(fontSize: avatarSize * 0.4, color: Color(0xFF07293D)),
                  ),
                ),
              ),
            ),
          );
        }
      }
      return Container(
        width: avatarSize * maxCount,
        height: avatarSize,
        child: Stack(
          children: listWidget,
        ),
      );
    } catch (e) {
      print(e);
      return SizedBox();
    }
  }
}
