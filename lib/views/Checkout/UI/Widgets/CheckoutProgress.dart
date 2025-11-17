import 'package:fruits_app/Core/commonImports/commonImports.dart';

class CheckoutProgress extends StatelessWidget {
  const CheckoutProgress({
    super.key,
    required this.currentStep,
    required this.height,
    required this.width,
  });

  final int currentStep;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final List<String> stepLabels = [
      'Delivery Time',
      'Delivery Address',
      'Payment'
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.08, vertical: height * .03),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final lineWidth = (constraints.maxWidth - 90) / 2;

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCircle(1),
                  _buildLine(lineWidth, 1),
                  _buildCircle(2),
                  _buildLine(lineWidth, 2),
                  _buildCircle(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(stepLabels.length, (index) {
                  final step = index + 1;
                  final isActive = step == currentStep;

                  return Expanded(
                    child: Align(
                      alignment: index == 0
                          ? Alignment.centerLeft
                          : index == stepLabels.length - 1
                              ? Alignment.centerRight
                              : Alignment.center,
                      child: Text(
                        stepLabels[index],
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight:
                              isActive ? FontWeight.w600 : FontWeight.w400,
                          color: isActive
                              ? AppColors.button_Color
                              : AppColors.grayColor.withOpacity(.6),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildCircle(int step) {
    final bool isActive = step == currentStep;
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        //  color: isActive ? AppColors.button_Color : AppColors.whiteColor,
        border: Border.all(
          color: isActive
              ? AppColors.button_Color
              : AppColors.grayColor.withOpacity(.5),
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.circle,
        size: 10,
        color: isActive
            ? AppColors.button_Color
            : AppColors.grayColor.withOpacity(.5),
      ),
    );
  }

  Widget _buildLine(double width, int step) {
    const dashWidth = 6.0;
    const dashSpace = 4.0;

    return SizedBox(
      width: width,
      height: 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount =
              (constraints.constrainWidth() / (dashWidth + dashSpace)).floor();
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.grayColor.withOpacity(.5),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
