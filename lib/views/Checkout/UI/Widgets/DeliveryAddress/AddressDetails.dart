import 'package:fruits_app/Core/commonImports/commonImports.dart';
import 'package:fruits_app/Core/constants/decoration.dart';
import 'package:fruits_app/views/ProductDetails/UI/page/ProductDetails.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.22,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(
            vertical: height * 0.008, horizontal: width * .05),
        padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .01),
        decoration: decorationContainer(),
        child: Flexible(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: AddressRow(
              width: width,
              height: height,
            )),
            //   size.height(height * .02),
            Flexible(
              child: Name_PhoneWidget(
                width: width,
                title: "john Doe",
              ),
            ),
            Name_PhoneWidget(
              width: width,
              title: "+000-11-1234567",
            ),
            size.height(height * .02),
            Flexible(
              child: desAddress(width: width),
            )
          ]),
        ));
  }
}

class Name_PhoneWidget extends StatelessWidget {
  const Name_PhoneWidget({super.key, required this.width, required this.title});

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .02,
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: width * .04),
      ),
    );
  }
}

class AddressRow extends StatefulWidget {
  const AddressRow({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  State<AddressRow> createState() => _AddressRowState();
}

class _AddressRowState extends State<AddressRow> {
  bool openNow = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
              size: widget.width *
                  0.06, // use your local width from MediaQuery or info widget
            ),
            SizedBox(width: widget.width * 0.02),
            Text(
              "Address",
              style: TextStyle(
                fontSize: widget.width * 0.045,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            shape: CircleBorder(),
            value: openNow,
            onChanged: (value) => setState(() => openNow = value!),
            checkColor: AppColors.whiteColor,
            activeColor: AppColors.button_Color,
          ),
        ),
      ],
    );
  }
}

class desAddress extends StatelessWidget {
  const desAddress({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .02),
      child: Text(
        "Room # 1 - Ground Floor, Al Najoum Building, 24 B  adipiscing elit sed do eiusmod ",
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: width * 0.034,
          height: 1.4,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
