import 'package:fruits_app/Core/commonImports/commonImports.dart';

void showCancelOrderDialog(BuildContext context, double width, double height) {
  String? selectedReason;
  final TextEditingController notesController = TextEditingController();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.025,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Text(
                    "Cancel Order",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.05,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                // Reason dropdown
                Text(
                  "Reason",
                  style: TextStyle(
                    color: AppColors.grayColor.withOpacity(.7),
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.04,
                  ),
                ),
                SizedBox(height: height * 0.01),

                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButtonFormField<String>(
                      borderRadius: BorderRadius.circular(20),
                      dropdownColor: AppColors.whiteColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                          vertical: height * 0.018,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      hint: Text(
                        "Please select reason",
                        style: TextStyle(fontSize: width * 0.038),
                      ),
                      value: selectedReason,
                      items: [
                        "Changed my mind",
                        "Wrong address",
                        "Found cheaper elsewhere",
                        "Other"
                      ]
                          .map((reason) => DropdownMenuItem(
                                value: reason,
                                child: Text(
                                  reason,
                                  style: TextStyle(fontSize: width * 0.038),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                    );
                  },
                ),

                SizedBox(height: height * 0.02),

                // Notes field
                Text(
                  "Notes",
                  style: TextStyle(
                    color: AppColors.grayColor.withOpacity(.7),
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.04,
                  ),
                ),
                SizedBox(height: height * 0.01),
                TextField(
                  controller: notesController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                Center(
                  child: SizedBox(
                      height: height * .055,
                      child: Customauthbutton(
                        textColor: AppColors.whiteColor,
                        buttonText: "Confirm Cancelation",
                        buttonColor: AppColors.button_Color,
                        height: height,
                        width: width,
                        onTap: () {},
                      )),
                ),
                SizedBox(height: height * 0.015),

                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: AppColors.button_Color,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
