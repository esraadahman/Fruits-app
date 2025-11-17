import 'package:fruits_app/Core/commonImports/commonImports.dart';

class MyorderCard extends StatelessWidget {
  const MyorderCard({
    super.key,
    required this.height,
    required this.width,
    required this.colorsCreated,
  });

  final double height;
  final double width;
  final Color colorsCreated;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.17,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .05),
        decoration: decorationContainer(),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(top: height * .02, left: width * .02),
                      child: CircleAvatar(
                        radius: width * 0.1,
                        backgroundColor: colorsCreated.withOpacity(.4),
                        child: Icon(
                          Icons.car_repair,
                          color: colorsCreated,
                          size: width * .1,
                        ),
                      )),
                  size.width(width * 0.04),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * .02,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#243188 - 37 KD",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          size.height(height * .01),
                          Row(
                            children: [
                              Text(
                                "9 Sep",
                                style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              size.width(width * .02),
                              Pointwidget(fontsize: width * 0.05),
                              size.width(width * .01),
                              Text(
                                "4 items",
                                style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Status :",
                                style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              size.width(width * .02),
                              Text(
                                "Delivering",
                                style: TextStyle(
                                  color: colorsCreated,
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: height * .02, right: width * .02),
                  child: CircleAvatar(
                      radius: width * 0.1,
                      backgroundColor: colorsCreated.withOpacity(.4),
                      child: Image.asset(
                        "assets/images/Myorder.png",
                      ))),
            ]));
  }
}
