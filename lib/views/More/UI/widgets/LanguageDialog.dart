import 'package:fruits_app/Core/commonImports/commonImports.dart';

class LanguageDialog extends StatefulWidget {
  final String initialLanguage;
  final Function(String) onLanguageSelected;
  final double width;
  final double height;

  const LanguageDialog({
    super.key,
    this.initialLanguage = "en",
    required this.onLanguageSelected,
    required this.width,
    required this.height,
  });

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.initialLanguage;
  }

  Widget languageOption({
    required String value,
    required String label,
    required String flagPath,
  }) {
    final bool isSelected = selectedLanguage == value;
    return ListTile(
      onTap: () {
        setState(() {
          selectedLanguage = value;
        });
      },
      leading: Container(
        width: widget.width * 0.05,
        height: widget.height * 0.03,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.grayColor,
            width: 2,
          ),
          color: Colors.white,
        ),
        child: isSelected
            ? Center(
                child: Icon(
                  Icons.check,
                  size: widget.width * 0.04,
                  color: AppColors.grayColor,
                ),
              )
            : null,
      ),
      title: Row(
        children: [
          Image.asset(
            flagPath,
            width: widget.width * 0.06,
            height: 24,
          ),
          size.width(widget.width * 0.01),
          Text(
            label,
            style: TextStyle(
              fontSize: widget.width * 0.04,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          languageOption(
            value: "ar",
            label: "العربية",
            flagPath: "assets/images/arabic_flag.png",
          ),
          languageOption(
            value: "en",
            label: "English",
            flagPath: "assets/images/english_flag.png",
          ),
          size.height(widget.width * 0.03),
          SizedBox(
            width: widget.width * 0.45,
            height: 45,
            child: Customauthbutton(
              textColor: AppColors.whiteColor,
              buttonText: "Apply",
              buttonColor: AppColors.button_Color,
              height: 50,
              width: widget.width * .9,
              onTap: () {
                widget.onLanguageSelected(selectedLanguage);
                Navigator.pop(context);
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Close",
                style: TextStyle(
                    color: AppColors.grayColor, fontSize: widget.width * 0.04)),
          ),
        ],
      ),
    );
  }
}
