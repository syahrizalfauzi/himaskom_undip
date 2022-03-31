import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

class ImagePicker extends HookWidget {
  final List<String> initialImageUrls;

  const ImagePicker({Key? key, this.initialImageUrls = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imageItems = useState(List<ImageProvider?>.generate(4, (index) {
      try {
        return NetworkImage(initialImageUrls[index]);
      } catch (_) {
        return null;
      }
    }));

    Future<void> _handleAddImage() async {
      final picker = image_picker.ImagePicker();
      final images = await picker.pickMultiImage();
      if (images == null) return;

      final imageFiles = images.map((e) => File(e.path));
      final imagesToPick =
          imageFiles.take(_imageItems.value.where((e) => e == null).length);

      final newImages = _imageItems.value.where((e) => e != null).toList()
        ..addAll(imagesToPick.map((e) => FileImage(e)))
        ..take(4);

      if (newImages.length < 4) {
        newImages.addAll(List.generate(4 - newImages.length, (index) => null));
      }

      _imageItems.value = newImages;
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        final imageItem = _imageItems.value[index];

        if (imageItem == null) {
          return GestureDetector(
            onTap: _handleAddImage,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              color: Theme.of(context).disabledColor,
              strokeWidth: 2,
              strokeCap: StrokeCap.round,
              dashPattern: const [2, 4],
              child: const Center(child: Icon(Icons.add, size: 24)),
            ),
          );
        }

        return GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: imageItem,
            ),
          ),
        );
      },
    );
  }
}
