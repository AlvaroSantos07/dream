import "package:dream/components/buttons/iconButton.dart";
import "package:flutter/material.dart";
import "../class/product.dart";
import "../class/shop.dart";
import "../components/homepage/myDrawer.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //Função para remover item do carrinho
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                content: const Text("Deseja remover esse item do carrinho?"),
                actions: [
                  //botão cancelar
                  MaterialButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar")),

                  //botão confirmar
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);

                        context.read<Shop>().removeFromCart(product);
                      },
                      child: const Text("Confirmar"))
                ]));
  }

  //Função do botão adicionar
  void addItemToCart(BuildContext context, Product product) {
    context.read<Shop>().addToCart(product);
  }

  //Função do botão diminuir
  void decreaseItemToCart(BuildContext context, Product product) {
    context.read<Shop>().decreamentFromCart(product);
  }

  //Função pressionar o botão de pagamento
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
            content:
                Text("Logo conectaremos esse app a uma solução de pagamento")));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    double totalBill = cart.fold<double>(
        0, (previousValue, element) => previousValue + (element.totalPrice));

    return Scaffold(
        appBar: AppBar(
            title: Text("Carrinho"),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.secondary),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            //Lista Carrinho
            Expanded(
                child: cart.isEmpty
                    ? const Center(child: Text("Seu carrinho está vazio"))
                    : ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          final item = cart[index];

                          return ListTile(
                              leading: Image.asset(item.imagePath),
                              title: Text(item.name),
                              subtitle: Text(item.price.toStringAsFixed(2)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: item.quantity >= 2
                                          ? () =>
                                              decreaseItemToCart(context, item)
                                          : () => removeItemFromCart(
                                              context, item)),
                                  Text(item.quantity.toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () =>
                                        addItemToCart(context, item),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () =>
                                        removeItemFromCart(context, item),
                                  ),
                                ],
                              ));
                        })),
            //Botão de Pagamento
            Visibility(
              visible: cart.isNotEmpty,
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                                "Total R\$ ${totalBill.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  child: Text(
                                    "Pagamento",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  onTap: () => payButtonPressed(context),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ));
  }
}
