import 'package:duckcart_app/providers/celebs_provider.dart';
import 'package:duckcart_app/widget/celeb_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CelebsGrid extends StatelessWidget {
  const CelebsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final celebs = Provider.of<CelebProvider>(context).celebList;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Recommended Creators',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.793,
            child: GridView.builder(
              itemCount: celebs.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 17,
                mainAxisSpacing: 0,
              ),
              itemBuilder: (ctx, i) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/donationScreen', arguments: celebs[i].id);
                },
                child: CelebItem(
                  id: celebs[i].id,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
