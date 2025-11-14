import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/views/Auth/UI/widgets/CustomAuthButton.dart';

class CheckoutRow extends StatelessWidget {
  const CheckoutRow({
    super.key,
    required this.width,
    required this.height,
    required this.numbers,
    required this.total,
    required this.onclickButton,
  });

  final double width;
  final double height;
  final int numbers;
  final double total;
  final VoidCallback onclickButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$numbers items in card',
                  style: TextStyle(
                    fontSize: width * .04,
                    color: AppColors.grayColor.withOpacity(.5),
                  ),
                ),
                Text(
                  '$total km',
                  style: TextStyle(
                      fontSize: width * .04,
                      color: AppColors.text_dark,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * .45,
            child: Customauthbutton(
                onTap: onclickButton,
                textColor: AppColors.whiteColor,
                buttonText: "Procced To Checkout",
                buttonColor: AppColors.button_Color,
                height: height,
                width: width * .9),
          ),
        ],
      ),
    );
  }
}
