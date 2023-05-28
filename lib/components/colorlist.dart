import 'package:flutter/material.dart';

List<Color> colors = const [
  Color(0xFFFFFFFF),
  Color(0xffF28B83),
  Color(0xFFFCBC05),
  Color(0xFFFFF476),
  Color(0xFFCBFF90),
  Color(0xFFA7FEEA),
  Color(0xFFE6C9A9),
  Color(0xFFE8EAEE),
  Color(0xFFA7FEEA),
  Color(0xFFCAF0F8)
];

class ColorList extends StatefulWidget {
  late Function setColor;
  late int index = 0;
  ColorList({super.key, required this.setColor, required this.index});
  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                widget.index = index;
                widget.setColor(index);
                setState(() {});
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors[index],
                          border: Border.all(color: Colors.black, width: 2))),
                  index == widget.index
                      ? Icon(Icons.check, size: 18)
                      : Container()
                ],
              ),
            );
          }),
    );
  }
}
