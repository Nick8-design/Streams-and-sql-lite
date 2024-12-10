import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenuItem<T> extends PopupMenuEntry<T>{
  const CustomDropdownMenuItem({
    super.key,
    required this.value,
    required this.text,
  });
  final T value;
  final String text;

  @override
  State<CustomDropdownMenuItem<T>> createState() =>
      _CustomDropdownMenuItemState<T>();

  @override
  double get height => 32.0;

  @override
  bool represents(T? value) => this.value == value;
}


class _CustomDropdownMenuItemState<T> extends State<CustomDropdownMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    IconData iconData;
    if(widget.value=='Male'){
    iconData=Icons.man;
    }else if(widget.value=='Female'){
      iconData=Icons.woman;
    }else
      {
        iconData=Icons.transgender;
      }

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 120),
      child: InkWell(
        onTap: () => Navigator.of(context).pop<T>(widget.value),
        child: Container(
          constraints: const BoxConstraints(minWidth: 30.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              title: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,

                ),
              ),
              leading: Icon(
                  iconData,

              ),

            ),
          ),
        ),
      ),
    );
  }
}
