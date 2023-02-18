import 'package:flutter/material.dart';

class CharBar extends StatefulWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const CharBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});

  @override
  State<CharBar> createState() => _CharBarState();
}

class _CharBarState extends State<CharBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains) {
      return Column(
        children: [
          SizedBox(
              //width:30,
              height: constrains.maxHeight* 0.15,
              child: FittedBox(
                child: Text(
                  '\$ ${widget.spendingAmount.toStringAsFixed(0)}',
                ),
              )),
          SizedBox(
            height: constrains.maxHeight * 0.5,
            width: 10,
            //width: constrains.maxWidth * 0.1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                  heightFactor: widget.spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.07,
            
          ),
          SizedBox(height: constrains.maxHeight * 0.2,
            child: Text(widget.label))
        ],
      );
    });
  }
}
