import 'package:flutter/material.dart';
import 'package:ricky_store/app/data/models/merk/merk_list_model.dart';
import 'package:ricky_store/app/shared/constant/color.dart';

class MerkChipWidget extends StatelessWidget {
  const MerkChipWidget({
    super.key,
    required this.merk,
    required this.colorChip,
    required this.iconChip,
  });

  final MerkList merk;
  final Color colorChip;
  final Icon iconChip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Chip(
        label: Text(
          merk.merkProduct,
          style: const TextStyle(color: appBlue),
        ),
        avatar: CircleAvatar(
          child: iconChip,
          backgroundColor: appWhite,
        ),
        labelPadding: const EdgeInsets.all(3.0),
        elevation: 5.0,
        shadowColor: appBlue,
        backgroundColor: colorChip,
        padding: const EdgeInsets.all(5.0),
      ),
    );
  }
}
