import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PlanSelectionWidget extends StatelessWidget {
  final bool showHeaderText;

  const PlanSelectionWidget({super.key, this.showHeaderText = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 30,
        children: [
          if (showHeaderText) _buildHeaderText(),
          _buildPlanCardsRow(context),
          _buildFooterText(),
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: const [
        Text(
          'Escolha seu plano',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppTheme.preto,
          ),
        ),
        Text(
          'Veja os benefícios de cada plano',
          style: TextStyle(fontSize: 26, color: AppTheme.preto),
        ),
      ],
    );
  }

  Widget _buildPlanCardsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPlanCard(
          context: context,
          imagePath: 'images/shared/GRATUITO.png',
          firstTitle: 'Com o Plano Gratuito, você tem:',
          firstDescription: _buildFreePlanDescription(),
          secondTitle: 'Quer ir além?',
          secondDescription: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Com os Planos Mensal e Anual, você desbloqueia muito mais receitas, salva suas favoritas e navega sem interrupções de anúncios.',
                style: TextStyle(fontSize: 16, color: AppTheme.preto),
              ),
            ),
          ],
          cardFooter: _buildFreePlanFooter(context),
          headerColor: AppTheme.aquamarinaMedia,
        ),
        const SizedBox(width: 30),
        _buildPlanCard(
          context: context,
          imagePath: 'images/shared/ANUAL.png',
          firstTitle: 'O melhor custo-benefício para quem ama cozinhar!',
          firstDescription: _buildAnnualPlanDescription(),
          secondTitle: 'Por que escolher o Plano Anual?',
          secondDescription: _buildAnnualPlanBenefits(),
          cardFooter: _buildAnnualPlanFooter(context),
          headerColor: AppTheme.vermelhoSecundario.withValues(alpha: 0.75),
        ),
        const SizedBox(width: 30),
        _buildPlanCard(
          context: context,
          imagePath: 'images/shared/MENSAL.png',
          firstTitle: 'Mais liberdade na sua cozinha, todos os dias!',
          firstDescription: _buildMonthlyPlanDescription(),
          secondTitle: 'Por que escolher o Plano Mensal?',
          secondDescription: _buildMonthlyPlanBenefits(),
          cardFooter: _buildMonthlyPlanFooter(context),
          headerColor: AppTheme.aquamarinaMedia,
        ),
      ],
    );
  }

  Widget _buildPlanCard({
    required BuildContext context,
    required String imagePath,
    required String firstTitle,
    required List<Widget> firstDescription,
    required String secondTitle,
    required List<Widget> secondDescription,
    required List<Widget> cardFooter,
    Color? headerColor,
  }) {
    return PlanSelectionCard(
      imagePath: imagePath,
      firstTitle: firstTitle,
      firstDescription: firstDescription,
      secondTitle: secondTitle,
      secondDescription: secondDescription,
      cardFooter: cardFooter,
      headerColor: headerColor,
    );
  }

  List<Widget> _buildFreePlanDescription() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '• 1 receita gerada por dia, baseada nos ingredientes que você tem em casa.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Navegação com anúncios.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Sem opção de salvar receitas.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'O Plano Gratuito é para quem quer experimentar o básico, mas com recursos limitados.',
          style: TextStyle(fontSize: 16, color: AppTheme.preto),
        ),
      ),
    ];
  }

  List<Widget> _buildFreePlanFooter(BuildContext context) {
    return [
      Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppTheme.preto.withValues(alpha: 0.25),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Text(
              'Experimente o Plano Gratuito, ou liberte sua criatividade com um de nossos planos pagos!',
              style: TextStyle(color: AppTheme.preto, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: ElevatedButton(
              onPressed:
                  () => Navigator.pushNamed(context, '/pagamento/gratis'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.aquamarinaMedia,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'TESTAR GRÁTIS',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.preto,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildAnnualPlanDescription() {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Com o Plano Anual, você aproveita tudo o que o BiteWise tem a oferecer:',
          style: TextStyle(fontSize: 16, color: AppTheme.preto),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '• Até 20 receitas geradas por dia!',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Salve todas as suas receitas favoritas e organize como quiser.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Navegação 100% livre de anúncios, para uma experiência fluÍda e sem distrações.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildAnnualPlanBenefits() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '• Garantia de economia e acesso exclusivo às funcionalidades mais completas da plataforma.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Uma assinatura prática, sem preocupações mensais!',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildAnnualPlanFooter(BuildContext context) {
    return [
      Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppTheme.preto.withValues(alpha: 0.25),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        r'Invista na sua criatividade culinária! Assine o Plano Anual por apenas R$99,90/ano ',
                    style: TextStyle(color: AppTheme.preto, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'e aproveite 2 meses grátis*.',
                    style: TextStyle(
                      color: AppTheme.preto,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/pagamento/anual'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.vermelhoSecundario,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'ASSINE E ECONOMIZE',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.branco,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildMonthlyPlanDescription() {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Com o Plano Mensal, você desbloqueia recursos que levam sua experiência no BiteWise para outro nível:',
          style: TextStyle(fontSize: 16, color: AppTheme.preto),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '• 5 receitas geradas por dia.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Salve suas receitas favoritas para acessar sempre que quiser.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Navegue sem anúncios, focando apenas no que importa: cozinhar com tranquilidade!',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildMonthlyPlanBenefits() {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '• Um ótimo equilíbrio entre benefícios e praticidade.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
            SizedBox(height: 5),
            Text(
              '• Ideal para quem quer explorar mais do BiteWise sem compromissos de longo prazo.',
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildMonthlyPlanFooter(BuildContext context) {
    return [
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppTheme.preto.withValues(alpha: 0.25),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(
              r'Liberte sua criatividade na cozinha! Assine o Plano Mensal por apenas R$9,90/mês',
              style: TextStyle(color: AppTheme.preto, fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              onPressed:
                  () => Navigator.pushNamed(context, '/pagamento/mensal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.aquamarinaMedia,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'ASSINE AGORA',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.preto,
                ),
              ),
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildFooterText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Text(
        '*Ao optar pelo Plano Anual, você economiza o equivalente a 2 meses em comparação ao custo acumulado do Plano Mensal, garantindo o melhor custo-benefício. Essa economia é exclusiva para assinaturas do Plano Anual e não representa um desconto adicional ou promoção separada. A gratuidade referida aplica-se exclusivamente ao cálculo comparativo entre os planos e não é válida de forma independente. Aproveite essa oportunidade única para maximizar os benefícios do BiteWise e economizar enquanto desfruta de uma experiência completa.',
        style: TextStyle(fontSize: 12, color: AppTheme.preto),
      ),
    );
  }
}

class PlanSelectionCard extends StatelessWidget {
  final String imagePath;
  final String firstTitle;
  final List<Widget> firstDescription;
  final String secondTitle;
  final List<Widget> secondDescription;
  final List<Widget> cardFooter;
  final Color? headerColor;

  const PlanSelectionCard({
    super.key,
    required this.imagePath,
    required this.firstTitle,
    required this.firstDescription,
    required this.secondTitle,
    required this.secondDescription,
    required this.cardFooter,
    this.headerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 790,
      decoration: BoxDecoration(
        color: Color(0xFFE5E7E9).withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(children: [_buildHeader(), _buildContent()]),
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.center,
      height: 120,
      decoration: BoxDecoration(
        color:
            headerColor ?? AppTheme.vermelhoSecundario.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      child: Image.asset(imagePath, height: 110, width: 110),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Primeiro Título e Descrição
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Text(
            firstTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.preto,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...firstDescription,
        const SizedBox(height: 20),
        // Segundo Título e Descrição
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            secondTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.preto,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...secondDescription,
        const SizedBox(height: 20),
        // Footer do Card
        ...cardFooter,
      ],
    );
  }
}
