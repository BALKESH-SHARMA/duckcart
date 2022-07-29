import 'package:duckcart_app/providers/celebs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CelebItem extends StatelessWidget {
  final String id;
  const CelebItem({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CelebProvider>(context).findByID(id);
    return Column(
      children: [
        SizedBox(
          height: 118,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(data.imageUrl, fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Text(data.title),
                ],
              ),
              const Icon(
                Icons.favorite_border,
                size: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}
