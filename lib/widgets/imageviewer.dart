import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final ImageProvider imageProvider;

  const ImageViewer(this.imageProvider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: PhotoView(
              imageProvider: imageProvider,
              loadingBuilder: (_, progress) {
                return CircularProgressIndicator(
                  value: progress != null
                      ? (progress.cumulativeBytesLoaded /
                              progress.expectedTotalBytes!)
                          .toDouble()
                      : null,
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(15, 38, 15, 28),
            child: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ),
        ],
      ),
    );
  }
}
