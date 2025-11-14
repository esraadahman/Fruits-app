import 'package:flutter/material.dart';
import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'dart:math' as math;

import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';

class FilterPopupWidget extends StatefulWidget {
  final void Function(String? category, bool openNow, bool freeDelivery)?
      onApply;
  final double width;
  final double height;
  const FilterPopupWidget(
      {super.key, this.onApply, required this.width, required this.height});

  @override
  State<FilterPopupWidget> createState() => _FilterPopupWidgetState();
}

class _FilterPopupWidgetState extends State<FilterPopupWidget> {
  String? selectedValue;
  bool openNow = false;
  bool freeDelivery = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      title: const Center(
        child: Text(
          'Filter by',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Delivered To",
                  style: TextStyle(fontSize: widget.width * .035),
                ),
                size.width(widget.width * .02),
                Transform.rotate(
                  angle: -2 * math.pi / 180,
                  child: Icon(
                    Icons.delivery_dining,
                    color: Colors.grey,
                    size: widget.width * 0.06,
                  ),
                ),
              ],
            ),
            size.height(widget.height * .02),
            DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(20),
              value: selectedValue,
              dropdownColor: AppColors.whiteColor,
              hint: const Text("All Areas"),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              items: const [
                DropdownMenuItem(value: "Beverages", child: Text("Beverages")),
                DropdownMenuItem(value: "Groceries", child: Text("Groceries")),
                DropdownMenuItem(value: "Snacks", child: Text("Snacks")),
              ],
              onChanged: (value) => setState(() => selectedValue = value),
            ),
            size.height(widget.height * .01),

            Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    shape: CircleBorder(),
                    value: openNow,
                    onChanged: (value) => setState(() => openNow = value!),
                    checkColor: Colors.green,
                    activeColor: Colors.white,
                  ),
                ),
                Text(
                  "Offers",
                  style: TextStyle(fontSize: widget.width * .035),
                ),
              ],
            ),

            
            Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    shape: CircleBorder(),
                    value: freeDelivery,
                    onChanged: (value) => setState(() => freeDelivery = value!),
                    checkColor: Colors.green,
                    activeColor: Colors.white,
                  ),
                ),
                Text(
                  "Free Delivery",
                  style: TextStyle(fontSize: widget.width * .035),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.width * .1),
          child: Customauthbutton(
            textColor: AppColors.whiteColor,
            buttonText: "Apply Filter ",
            buttonColor: AppColors.button_Color,
            height: widget.height,
            width: widget.width,
            onTap: () {
              Navigator.pop(context);
              widget.onApply?.call(
                selectedValue,
                openNow,
                freeDelivery,
              );
            },
          ),
        ),
        size.height(widget.height * .02),
        Center(
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Close",
              style: TextStyle(
                  fontSize: widget.width * .04,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal),
            ),
          ),
        )
      ],
    );
  }
}
