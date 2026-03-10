// criar o void main
// responsável por rodar o elemento principal da aplicação 

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //runApp => chama o elemento com o materialAPP
  runApp(const MainApp());
}

//criar a classe MainApp
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //Construtor da Tela Estática
  @override
  Widget build(BuildContext context) {
    //montar a estrutura do MaterialAPP
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF8F8F8), // Fundo levemente cinza
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 6.0, // Quanto maior o número, maior/mais espalhada a sombra. (0 = sem sombra)
          shadowColor: Colors.black, // Define a cor da sombra para garantir que ela apareça
          backgroundColor: const Color.fromARGB(255, 253, 139, 33),
          title: const Text(
            "Minha conta",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.edit),
              color: const Color.fromARGB(255, 0, 0, 0),
            )
          ],
        ),
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                color: const Color.fromARGB(255, 255, 151, 32),
                child: Stack(
                  //Children do Child
                  children: [
                    //Positioned para posicionar a esquerda do texto.
                    const Positioned(
                      left: 20,
                      top: 40,
                      //Icone do perfil
                      child: Icon(
                        Icons.account_circle,
                        size: 120,
                        color: Colors.black87,
                      ),
                    ),
                    // Texto "ola," tambem posicionado
                    Positioned(
                      left: 145,
                      top: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Children para colocar textos
                        children: [
                          Text(
                            "Olá,",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[100],
                            ),
                          ),
                          const Text(
                            "Murilo Dovigo Bastos",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // --- SEÇÃO "MINHAS COMPRAS" ---
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.shopping_bag_outlined, color: Colors.black87),
                        SizedBox(width: 10),
                        Text(
                          "Minhas compras",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black87, thickness: 1),
                    const SizedBox(height: 20),
                    
                    // Ícones de status do pedido
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildIconText(Icons.shopping_cart_outlined, "A caminho"),
                        _buildIconText(Icons.local_shipping_outlined, "Meus pedidos"),
                        _buildIconText(Icons.inventory_2_outlined, "Entregues"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // --- SEÇÃO DE OPÇÕES (Lista) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildListTile(Icons.favorite_border, "Meus favoritos"),
                    _buildListTile(Icons.access_time, "Vistos recentemente"),
                    _buildListTile(Icons.card_giftcard, "Cupons"),
                    _buildListTile(Icons.chat_bubble_outline, "Mensagens"),
                    _buildListTile(Icons.help_outline, "Centro de ajuda"),
                    _buildListTile(Icons.settings_outlined, "Configurações"),
                  ],
                ),
              ),
              const SizedBox(height: 40), // Espaço no final para a barra não cobrir nada
            ],
          ),
        ),

        // --- BARRA DE NAVEGAÇÃO INFERIOR ---
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 253, 139, 33),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: const Icon(Icons.favorite_border, color: Colors.black87), onPressed: () {}),
                IconButton(icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87), onPressed: () {}),
                const SizedBox(width: 48), // Espaço reservado para o botão Home central
                IconButton(icon: const Icon(Icons.notifications_none, color: Colors.black87), onPressed: () {}),
                IconButton(icon: const Icon(Icons.account_circle_outlined, color: Colors.black87), onPressed: () {}),
              ],
            ),
          ),
        ),
        
        // Botão Home Centralizado
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Fundo branco interno
              border: Border.all(color: Colors.black87, width: 3),
            ),
            child: const Icon(Icons.home_outlined, color: Colors.black87, size: 32),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  // ===========================================================================
  // MÉTODOS AUXILIARES (Para manter o código limpo e organizado)
  // ===========================================================================

  // Cria os itens da seção "Minhas compras"
  Widget _buildIconText(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black87),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Cria os itens da lista de opções (Favoritos, Cupons, etc)
  Widget _buildListTile(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero, // Remove o padding padrão para alinhar com a linha
          leading: Icon(icon, color: Colors.black87),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          trailing: const Icon(Icons.arrow_drop_down, color: Colors.black87),
          onTap: () {},
        ),
        const Divider(color: Colors.black87, thickness: 1, height: 1),
      ],
    );
  }
}