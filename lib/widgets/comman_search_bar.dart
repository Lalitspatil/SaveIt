import 'package:flutter/material.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';

class CommanSearchBar extends StatelessWidget {

  void Function(String)? onChanged;
  String? hintText;


 CommanSearchBar({super.key,this.onChanged,this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
                    onChanged: onChanged ,
                    decoration: InputDecoration(
                      hintText: hintText,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: CColors.borderGrey),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: DeviceHeight.s5
                      ),
                    ),
                  );
  }
}