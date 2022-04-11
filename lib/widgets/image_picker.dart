import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:himaskom_undip/widgets/image_viewer.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

// Stateful karena gridview-nya pakai builder
class ImagePicker extends StatefulHookWidget {
  final List<String> initialImageUrls;
  final void Function(List<ImageProvider>) onChange;
  final void Function(String) onRemove;
  final bool isError;

  const ImagePicker({
    Key? key,
    this.initialImageUrls = const [],
    required this.onChange,
    required this.onRemove,
    required this.isError,
  }) : super(key: key);

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    final _imageItems = useState(List<ImageProvider?>.generate(4, (index) {
      try {
        return NetworkImage(widget.initialImageUrls[index]);
      } catch (_) {
        return null;
      }
    }));
    final _deletedImageIndexes = useState<List<int>>([]);

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
      setState(() {});
      widget.onChange(
        _imageItems.value.where((e) => e != null).map((e) => e!).toList(),
      );
    }

    //Also handles deletion
    Future<void> _handleViewImage(int index) async {
      final imageProvider = _imageItems.value[index]!;

      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ImageViewer(_imageItems.value[index]!),
        ),
      );

      if (imageProvider is NetworkImage) {
        _deletedImageIndexes.value.add(index);
      }

      if (result == null || !result) return;
      final newImages = _imageItems.value;
      newImages[index] = null;
      newImages.sort((a, b) => a == null ? 1 : 0);

      _imageItems.value = newImages;
      setState(() {});
      widget.onChange(
        _imageItems.value.where((e) => e != null).map((e) => e!).toList(),
      );

      if (imageProvider is NetworkImage) {
        widget.onRemove(imageProvider.url);
      }
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
              color: widget.isError
                  ? Theme.of(context).errorColor
                  : Theme.of(context).disabledColor,
              strokeWidth: 2,
              strokeCap: StrokeCap.round,
              dashPattern: const [2, 4],
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 24,
                  color: widget.isError
                      ? Theme.of(context).errorColor
                      : Theme.of(context).disabledColor,
                ),
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () => _handleViewImage(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).disabledColor.withOpacity(0.2),
              ),
            ),
            child: Image(
              image: imageItem,
            ),
          ),
        );
      },
    );
  }
}
