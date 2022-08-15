// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class CachedloadingImage extends StatelessWidget {
//   final String imageUrl;
//
//
//   CachedloadingImage({required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: imageUrl,
//       height: double.infinity,
//       width: double.infinity,
//       fit: BoxFit.fill,
//       placeholder: (context, url) => Image.asset(
//         'images/loading.gif',
//         height: double.infinity,
//         width: double.infinity,
//         fit: BoxFit.fill,
//       ),
//       errorWidget: (context, url, error) => Icon(Icons.error),
//     );
//   }
// }