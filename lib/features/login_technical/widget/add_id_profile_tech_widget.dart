import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/base_card_container.dart';
import 'package:image_picker/image_picker.dart';
class AddIdProfileTechWidget extends StatefulWidget {
  final String title;
  final Function(File)? onImageSelected;
  final double? height;
  final double? width;

  const AddIdProfileTechWidget({
    super.key,
    required this.title,
    this.onImageSelected,
    this.height,
    this.width,
  });

  @override
  State<AddIdProfileTechWidget> createState() =>
      _AddIdProfileTechWidgetState();
}

class _AddIdProfileTechWidgetState extends State<AddIdProfileTechWidget> {
  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final file = File(image.path);

      setState(() {
        selectedImage = file;
      });

      widget.onImageSelected?.call(file); // 👈 نطلعها برا
    }
  }

  void showImageSource() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showImageSource,
      child: BaseCard(
        height: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // الصورة
              selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primaryColor,
                            child: FaIcon(
                              FontAwesomeIcons.cloudArrowUp,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.title,
                            style: AppTextStyles.regular16Black,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

              // Overlay زر تغيير الصورة
              if (selectedImage != null)
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}