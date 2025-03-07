import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FullScreenImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageViewer({
    Key? key,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _FullScreenImageViewerState createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// 🖼️ Swipable Images with Zoom Effect
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
                    }
                    return Center(
                      child: Transform.scale(
                        scale: value, // Zoom effect
                        child: CachedNetworkImage(
                          imageUrl: widget.images[index],
                          fit: BoxFit.contain,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            /// 🔵 Animated Pagination Indicator
            Positioned(
              bottom: 40,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget.images.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey.shade700,
                ),
              ),
            ),

            /// ❌ Close Button
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
