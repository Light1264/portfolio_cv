import 'package:flutter/material.dart';
import 'package:portfolio_cv/main.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.headerText,
    required this.length,
    required this.content,
    this.iconList,
    this.hasIcon = true,
  });
  final String headerText;
  final int length;
  final List<String> content;
  final List<Widget>? iconList;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: colorConstants.appBlack,
          ),
        ),
        ...List.generate(
          length,
          (index) {
            return Row(
              
              children: [
                hasIcon == true
                    ? Icon(
                        Icons.circle,
                        color: colorConstants.primaryColor,
                        size: 10,
                      )
                    : iconList![index],
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    content[index],
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: colorConstants.appBlack,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
