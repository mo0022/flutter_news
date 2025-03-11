import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Material(
        color: const Color(0xff0E253C),
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        shadowColor: Colors.green,
        child: Row(
          children: [
            // Image Section (Improved loading with fallback)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,

                  // عرض مؤشر تحميل أثناء التحميل
                  placeholder: (context, url) => Container(
                    height: 100,
                    width: 150,
                    color: Colors.grey.shade800,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // عند فشل التحميل
                  errorWidget: (context, url, error) => Container(
                    height: 100,
                    width: 150,
                    color: Colors.grey.shade900,
                    child: const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Text Section (Title and Description)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title.isNotEmpty ? title : 'No Title',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Description
                    Text(
                      description.isNotEmpty
                          ? description
                          : 'No Description Available',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
