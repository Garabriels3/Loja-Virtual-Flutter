import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loja_virtual/app/di/setup_locator.dart';
import 'package:loja_virtual/app/presentation/ui/common/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/app/presentation/ui/products/components/search_dialog.dart';
import 'package:loja_virtual/app/presentation/ui/products/products_viewmodel.dart';
import 'package:loja_virtual/shared/resources/dimens.dart';
import 'components/product_list_tile.dart';

class ProductsPage extends StatelessWidget {
  final viewmodel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    viewmodel.getAllProducts();
    return Observer(
      builder: (_) {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            actions: [
              viewmodel.search.isEmpty
                  ? IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => SearchDialog(),
                        );
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        viewmodel.setFilterNull();
                      },
                    ),
            ],
            title: viewmodel.search.isEmpty
                ? Text("Produtos")
                : LayoutBuilder(
                    builder: (_, constraints) {
                      return GestureDetector(
                        child: Container(
                          width: constraints.biggest.width,
                          child: Text(
                            viewmodel.search,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => SearchDialog(),
                          );
                        },
                      );
                    },
                  ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: viewmodel.filterProducts.length,
            padding: EdgeInsets.all(eight),
            itemBuilder: (_, index) {
              return ProductListTile(
                product: viewmodel.filterProducts[index],
              );
            },
          ),
        );
      },
    );
  }
}
