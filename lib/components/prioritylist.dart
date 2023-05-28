import 'package:flutter/material.dart';

List<String> nameList = ['None', 'High', 'Medium', 'Low'];
List<Color> colorList = [Colors.grey, Colors.red, Colors.orange, Colors.yellow];

class PriorityList extends StatefulWidget {
  PriorityList({super.key, required this.index, required this.setPriority});
  int index = 0;
  late Function setPriority;
  @override
  State<PriorityList> createState() => _PriorityListState();
}

class _PriorityListState extends State<PriorityList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: nameList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                widget.index = index;
                widget.setPriority(index);
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: (index == widget.index)
                      ? colorList[index]
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: colorList[index]),
                ),
                width: MediaQuery.of(context).size.width / 4.6,
                child: Center(
                    child: Text(
                  nameList[index],
                  style: TextStyle(
                      color: (index == widget.index)
                          ? Colors.white
                          : colorList[index]),
                )),
              ),
            );
          }),
    );
  }
}
