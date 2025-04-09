import 'package:flutter/material.dart';

class RecipeGenWidget extends StatelessWidget implements PreferredSizeWidget {
  const RecipeGenWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(700);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('../assets/images/BACKGROUND-TOPO.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                width: 1200,
                alignment: Alignment.center,
                child: Text(
                  'A sua receita perfeita em instantes!',
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: 940,
                  child: Text(
                    'Escreva aqui seus ingredientes:',
                    style: TextStyle(
                      color: Color(0xFFC0392B),
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 940,
                child: TextField(
                  cursorColor: Color(0xFFC0392B),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFB1B4B5).withValues(alpha: 0.60),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 50,
                width: 320,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/recipe'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF117A65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Encontre sua próxima refeição',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 870,
            top: 340,
            child: Image.asset('images/LOGO.png', width: 270, height: 270),
          ),
          Positioned(
            right: 870,
            bottom: 190,
            child: Image.asset('images/SETA.png', width: 300, height: 250),
          ),
          Positioned(
            top: 480,
            left: 50,
            child: SizedBox(
              width: 450,
              child: Text(
                'Digite os ingredientes que você tem em casa, e deixe que fazemos a mágica para você!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
