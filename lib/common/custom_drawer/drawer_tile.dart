import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({this.iconData, this.menuOptionTitle, this.page});

  final IconData iconData;
  final String menuOptionTitle;
  final int page;

  @override
  Widget build(BuildContext context) {
      final int curPage = context.watch<PageManager>().page;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? Colors.red : Colors.grey[700],
              ),
            ),
            Text(
              menuOptionTitle,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
