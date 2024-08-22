import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowItems extends StatefulWidget {
  bool isSelected;
  VoidCallback onTap;
  String country;
  String image;

  RowItems(
      {super.key,
      required this.isSelected,
      required this.onTap,
      required this.image,
      required this.country});

  @override
  State<RowItems> createState() => _RowItemsState();
}

class _RowItemsState extends State<RowItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfff45004)),
            color: widget.isSelected == true
                ? const Color(0xfff45004)
                : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.network(widget.image,height: 50,),
            Text(
              widget.country,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.isSelected == true
                      ? Colors.white
                      : const Color(0xfff45004),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  // fontFamily: 'Poppins-SemiBold',
                  overflow: TextOverflow.clip),
            ),
            
          ],
        ),
      ),
    );
  }
}
