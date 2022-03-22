import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical/shared/styles/font_styles.dart';

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget({
    Key? key,
    required this.yourList,
    required this.filteredList,
  }) : super(key: key);

  final List<dynamic> yourList;
  final List<dynamic> filteredList;

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        widget.yourList.length,
            (index) => Padding(
          padding: EdgeInsets.all(6.r),
          child: FilterChip(
            avatar: CircleAvatar(
              child: Text(
                widget.yourList[index].substring(0, 1),
                style: thirdTextStyle(),
              ),
            ),
            label: Text(
              widget.yourList[index],
              style: thirdTextStyle(),
            ),
            selected: widget.filteredList.contains(widget.yourList[index]),
            onSelected: (selected){
              setState(() {
                if (selected) {
                  widget.filteredList.add(widget.yourList[index]);
                } else {
                  widget.filteredList.removeWhere((element) => element == widget.yourList[index]);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}