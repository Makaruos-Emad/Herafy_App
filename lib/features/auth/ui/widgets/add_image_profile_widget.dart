import 'dart:io';
import 'package:flutter/material.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddImageProfileWidget extends StatefulWidget {
  const AddImageProfileWidget({super.key, this.imageUrl ,required this.onImageSelected});
  final String? imageUrl;
  final Function(File?) onImageSelected;

  @override
  State<AddImageProfileWidget> createState() => _AddImageProfileWidgetState();
}

class _AddImageProfileWidgetState extends State<AddImageProfileWidget> {
  File? selectedImage;
  final ImagePicker picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });

      widget.onImageSelected(selectedImage);
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
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 90,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 84,
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage!)
                  : (widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                            ? NetworkImage(widget.imageUrl!)
                            : const AssetImage(Assets.imagesNoImage))
                        as ImageProvider,
            ),
          ),

          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: showImageSource,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: FaIcon(
                  FontAwesomeIcons.pencil,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
