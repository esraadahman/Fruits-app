import 'package:fruits_app/Core/commonImports/commonImports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String image = "";
    return Infowidget(builder: (context, deviceInfo) {
      double width = deviceInfo.localWidth;
      double height = deviceInfo.localHeight;
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarWidget(
          width: width,
          centerTitle: true,
          title: "",
          leading: IconButton(
              onPressed: () {
                context.goBack();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              Column(
                children: [
                  AddImageWidget(
                    width: width,
                    image: image,
                    onTap: () {},
                  ),
                  TextLineWidget(
                    width: width,
                    text: "Welcome, Esraa",
                  ),
                ],
              ),
              size.height(height * 0.03),
              Customtextfiled(
                hintText: "FullName",
                labelText: "First and Last Name",
                prefixIcon: null,
                keyboardType: TextInputType.name,
                labelText_top: "Full Name",
                width: width,
                onChanged: (value) {},
                validator: (value) {
                  return value!.isEmpty
                      ? "Please enter your name"
                      : value.trim().length < 5
                          ? "Name must be at least 5 characters"
                          : !RegExp(r"^[a-zA-Z\s]+$").hasMatch(value.trim())
                              ? "Name can only contain letters and spaces"
                              : null;
                },
              ),
              size.height(height * 0.02),
              Phonewidget(
                labelText_top: "Phone Number",
                width: width,
                onChanged: (value) {},
              ),
              Customtextfiled(
                hintText: "Password",
                labelText: "Password",
                prefixIcon: null,
                obscureText: true,
                labelText_top: "Password",
                width: width,
                onChanged: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  } else {
                    return null;
                  }
                },
              ),
              size.height(height * 0.07),
              Customauthbutton(
                textColor: AppColors.whiteColor,
                buttonText: "Update",
                buttonColor: AppColors.button_Color,
                height: height,
                width: width,
                onTap: () {},
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({
    super.key,
    required this.width,
    required this.image,
    required this.onTap,
  });

  final double width;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width * 0.24,
          height: width * 0.24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grayColor,
              width: 2,
            ),
            image: image.isNotEmpty
                ? DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.add_a_photo_outlined,
              color: AppColors.grayColor,
              size: width * 0.07,
            ),
          ),
        ),
      ],
    );
  }
}
