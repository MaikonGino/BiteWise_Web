import 'package:bitewise/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> rawPlansData = [
  {
    'id': 'free',
    'imagePath': 'images/shared/GRATUITO.png',
    'firstTitle': 'Com o Plano Gratuito, você tem:',
    'headerColor': AppTheme.aquamarinaMedia,
    'descriptionItems': [
      '• 1 receita gerada por dia, baseada nos ingredientes que você tem em casa.',
      '• Navegação com anúncios.',
      '• Sem opção de salvar receitas.',
      'O Plano Gratuito é para quem quer experimentar o básico, mas com recursos limitados.',
    ],
    'secondTitle': 'Quer ir Além?',
    'secondDescriptionItems': [
      'Com os Planos Mensal e Anual, você desbloqueia muito mais receitas, salva suas favoritas e navega sem interrupções de anúncios.',
    ],
    'footerText':
        'Experimente o Plano Gratuito, ou liberte sua criatividade com um de nossos planos pagos!',
    'footerButtonText': 'TESTAR GRÁTIS',
    'footerButtonAction': '/pagamento/gratis',
    'footerButtonColor': AppTheme.aquamarinaMedia,
    'footerButtonTextColor': AppTheme.preto,
  },
  {
    'id': 'annual',
    'imagePath': 'images/shared/ANUAL.png',
    'firstTitle': 'O melhor custo-benefício para quem ama cozinhar!',
    'headerColor': AppTheme.vermelhoSecundario,
    'descriptionItems': [
      'Com o Plano Anual, você aproveita tudo o que o BiteWise tem a oferecer:',
      '• Até 20 receitas geradas por dia!',
      '• Salve todas as suas receitas favoritas e organize como quiser.',
      '• Navegação 100% livre de anúncios, para uma experiência fluída e sem distrações.',
    ],
    'secondTitle': 'Por que escolher o Plano Anual?',
    'secondDescriptionItems': [
      '• Garantia de economia e acesso exclusivo às funcionalidades mais completas da plataforma.',
      '• Uma assinatura prática, sem preocupações mensais!',
    ],
    'footerText':
        r'Invista na sua criatividade culinária! Assine o Plano Anual por apenas R$99,90/ano e aproveite 2 meses grátis*.',
    'footerButtonText': 'ASSINE E ECONOMIZE',
    'footerButtonAction': '/pagamento/anual',
    'footerButtonColor': AppTheme.vermelhoSecundario,
    'footerButtonTextColor': AppTheme.branco,
  },
  {
    'id': 'monthly',
    'imagePath': 'images/shared/MENSAL.png',
    'firstTitle': 'Mais liberdade na sua cozinha, todos os dias!',
    'headerColor': AppTheme.aquamarinaMedia,
    'descriptionItems': [
      'Com o Plano Mensal, você desbloqueia recursos que levam sua experiência no BiteWise para outro nível:',
      '• 5 receitas geradas por dia.',
      '• Salve suas receitas favoritas para acessar sempre que quiser.',
      '• Navegue sem anúncios, focando apenas no que importa: cozinhar com tranquilidade!',
    ],
    'secondTitle': 'Por que escolher o Plano Mensal?',
    'secondDescriptionItems': [
      '• Um ótimo equilíbrio entre benefícios e praticidade.',
      '• Ideal para quem quer explorar mais do BiteWise sem compromissos de longo prazo.',
    ],
    'footerText':
        r'Liberte sua criatividade na cozinha! Assine o Plano Mensal por apenas R$9,90/mês.',
    'footerButtonText': 'ASSINE AGORA',
    'footerButtonAction': '/pagamento/mensal',
    'footerButtonColor': AppTheme.aquamarinaMedia,
    'footerButtonTextColor': AppTheme.preto,
  },
];

class PlanModel {
  final String id;
  final String imagePath;
  final String firstTitle;
  final Color headerColor;
  final List<String> descriptionItems;
  final String? secondTitle; // Correto: pode ser nulo
  final List<String>? secondDescriptionItems; // Correto: pode ser nulo
  final String footerText;
  final String footerButtonText;
  final String footerButtonAction;
  final Color footerButtonColor;
  final Color footerButtonTextColor;

  PlanModel({
    required this.id,
    required this.imagePath,
    required this.firstTitle,
    required this.headerColor,
    required this.descriptionItems,
    this.secondTitle,
    this.secondDescriptionItems,
    required this.footerText,
    required this.footerButtonText,
    required this.footerButtonAction,
    required this.footerButtonColor,
    required this.footerButtonTextColor,
  });

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      firstTitle: map['firstTitle'] as String,
      headerColor: map['headerColor'] as Color,
      descriptionItems: List<String>.from(map['descriptionItems'] as List),
      // Corrigido para lidar com a nulidade definida na classe:
      secondTitle: map['secondTitle'] as String?,
      secondDescriptionItems:
          map['secondDescriptionItems'] != null
              ? List<String>.from(map['secondDescriptionItems'] as List)
              : null,
      footerText:
          map['footerText'] as String, // Corrigido: era 'footerText' no map
      footerButtonText: map['footerButtonText'] as String,
      footerButtonAction: map['footerButtonAction'] as String,
      footerButtonColor: map['footerButtonColor'] as Color,
      footerButtonTextColor: map['footerButtonTextColor'] as Color,
    );
  }
}

final List<PlanModel> appAvailablePlans =
    rawPlansData.map((dataMap) => PlanModel.fromMap(dataMap)).toList();

// Opcional: Função para obter um plano por ID
PlanModel? getPlanModelById(String id) {
  try {
    return appAvailablePlans.firstWhere((plan) => plan.id == id);
  } catch (e) {
    return null;
  }
}
