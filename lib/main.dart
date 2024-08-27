import 'package:flutter/material.dart';

import 'widget/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I-Fit'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildsearchbar(),
            const SizedBox(height: 5.0),
            const Text(
              'Mais Pedidos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: _CategoryCard(
                        'Bowl Calórico',
                        Image.asset('assets/images/bowlcalorico.jpg'),
                        57.99,
                        Colors.green,
                        context,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: _CategoryCard(
                        'Frango Com Salada',
                        Image.asset('assets/images/frangosalada.jpg'),
                        24.99,
                        Colors.green,
                        context,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: _CategoryCard(
                        'Marmita Saudável',
                        Image.asset('assets/images/marmitasaudavel.png'),
                        19.99,
                        Colors.green,
                        context,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: _CategoryCard(
                        'Salada Variada',
                        Image.asset('assets/images/saladavariada.png'),
                        14.99,
                        Colors.green,
                        context,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final Image image;
  final double price;
  final Color color;
  final BuildContext context;

  const _CategoryCard(
      this.title, this.image, this.price, this.color, this.context,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(title: title, price: price)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: image,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'R\$ $price',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final double price;

  const DetailPage({required this.title, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.green[700],
        ),
        body: Center(
          child: _getContentForCategory(title, price),
        ));
  }

  Widget _getContentForCategory(String title, double price) {
    switch (title) {
      case 'Bowl Calórico':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/bowlcalorico.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: const Text(
                  'O Bowl Calórico é uma refeição nutritiva e saborosa, ideal para quem '
                  'busca uma opção rica em proteínas e carboidratos. Este prato combina '
                  'ingredientes frescos e saudáveis, proporcionando uma refeição completa '
                  'e equilibrada que é perfeita para uma refeição pós-treino ou um almoço '
                  'satisfatório. Contendo arroz integral, peito de frango, brócolis, batata-doce,'
                  ' abacate e temperos variados.  ',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Text(
              'Preço: R\$ $price',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Adicionado ao carrinho');
                },
                child: const Text('Adicionar ao Carrinho'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        );

      case 'Frango Com Salada':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/frangosalada.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: const Text(
                  'Frango e Salada é uma refeição equilibrada e nutritiva, perfeita '
                  'para um almoço leve ou jantar saudável. O prato combina peito de '
                  'frango grelhado com uma salada fresca e crocante, proporcionando '
                  'uma mistura deliciosa de sabores e texturas. É ideal para quem busca '
                  'uma refeição rica em proteínas e repleta de vegetais. Contendo peito '
                  'de frango, alface romaine, rúcula, tomate, pepino, cenoura, cebola roxa '
                  'e temperos variados. ',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Text(
              'Preço: R\$ $price',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Adicionado ao carrinho');
                },
                child: const Text('Adicionar ao Carrinho'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        );

      case 'Marmita Saudável':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/marmitasaudavel.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: const Text(
                  'A Marmita Saudável é uma opção prática e nutritiva, perfeita para quem '
                  'deseja uma refeição balanceada e cheia de sabor. Este prato combina proteínas '
                  'magras, grãos integrais e vegetais frescos em uma única refeição. Ideal para '
                  'preparar e levar para o trabalho ou escola, oferece uma combinação de ingredientes '
                  'que garantem energia e bem-estar ao longo do dia. Contendo carne moída, quinoa, '
                  'brócolis, cenoura, arroz integral.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Text(
              'Preço: R\$ $price',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Adicionado ao carrinho');
                },
                child: const Text('Adicionar ao Carrinho'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        );

      case 'Salada Variada':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/saladavariada.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: const Text(
                  'A Salada Variada é uma opção leve e refrescante, ideal para quem busca '
                  'uma refeição saudável e cheia de sabor. Esta salada combina uma variedade '
                  'de vegetais frescos e ingredientes nutritivos, proporcionando uma explosão '
                  'de sabores e texturas em cada garfada. Perfeita como acompanhamento ou refeição '
                  'principal para um almoço leve. Contendo alface americana, espinafre, tomate cereja, '
                  'pepino, cenoura, rabanete e temperos variados.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Text(
              'Preço: R\$ $price',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Adicionado ao carrinho');
                },
                child: const Text('Adicionar ao Carrinho'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        );

      default:
        return const Text('Conteúdo não disponível.');
    }
  }
}
