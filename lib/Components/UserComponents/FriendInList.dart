import 'package:flutter/material.dart';
import 'package:sign_ups/Components/UserComponents/DefaultUserProfile.dart';

import '../../HelperFunctions/functions.dart';

class FriendInList extends StatefulWidget {
  String? name;
  Color? color;
  String? fullNameInitials;
  bool addIcon;
  FriendInList({
    Key? key,
    this.name,
    this.color,
    this.fullNameInitials,
    this.addIcon = false,
  }) : super(key: key);

  @override
  State<FriendInList> createState() => _FriendInListState();
}

class _FriendInListState extends State<FriendInList> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: size.width * 0.02),
          DefaultUserProfile(
            initials: widget.fullNameInitials != ""
                ? widget.fullNameInitials!
                : getInitials(widget.name!),
            color: widget.color!,
            radius: 27,
          ),
          SizedBox(width: size.width * 0.1),
          Text(
            widget.name!,
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          Spacer(),
          if (widget.addIcon)
            GestureDetector(
              child: !isAdded
                  ? Icon(Icons.add_circle_outline)
                  : Icon(Icons.check_circle_outline),
              onTap: () {
                setState(
                  () {
                    isAdded = !isAdded;
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
// class FriendInList extends StatelessWidget {
//   String? name;
//   Color? color;
//   bool? addIcon;
//   FriendInList({
//     Key? key,
//     this.name,
//     this.color,
//     this.addIcon,
//   }) : super(key: key);
//   Widget showAddIcon() {
//     return GestureDetector(child: Icon(Icons.))
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
    // return Container(
    //   height: size.height * 0.1,
    //   width: double.infinity,
    //   child: Row(
    //     children: [
    //       SizedBox(width: size.width * 0.02),
    //       DefaultUserProfile(
    //         initials: getInitials(name!),
    //         color: color!,
    //         radius: 27,
    //       ),
    //       SizedBox(width: size.width * 0.1),
    //       Text(
    //         name!,
    //         style: TextStyle(
    //           fontFamily: "Oxanium",
    //           fontWeight: FontWeight.bold,
    //           fontSize: 17,
    //           color: Colors.black,
    //         ),
    //       ),
    //       if(addIcon!)
    //         showAddIcon();
    //     ],
    //   ),
    // );
//   }
// }
