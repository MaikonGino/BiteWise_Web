import 'package:bitewise/core/theme/app_theme.dart';
import 'package:bitewise/features/about/domain/section_item.dart';
import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  final double? width;

  const BulletPoint({super.key, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: Icon(Icons.circle, size: 6, color: AppTheme.preto),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            constraints: BoxConstraints(maxWidth: width ?? 500),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
          ),
        ),
      ],
    );
  }
}

class NumberedPoint extends StatelessWidget {
  final String text;
  final String number;
  final double? width;

  const NumberedPoint({
    super.key,
    required this.text,
    required this.number,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(number, style: TextStyle(fontSize: 16, color: AppTheme.preto)),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            constraints: BoxConstraints(maxWidth: width ?? 500),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: AppTheme.preto),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  final double? width;

  const SectionTitle({super.key, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width ?? 600),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w800,
          color: AppTheme.preto,
        ),
      ),
    );
  }
}

class SectionSubtitle extends StatelessWidget {
  final String text;

  const SectionSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 18,
        color: AppTheme.preto,
      ),
    );
  }
}

class Paragraph extends StatelessWidget {
  final String text;
  final double? width;

  const Paragraph({super.key, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width ?? 600),
      child: Text(text, style: TextStyle(fontSize: 16, color: AppTheme.preto)),
    );
  }
}

List<SectionItem> getAboutSectionItems() {
  return [
    SectionItem(
      imageUrl: 'images/ELEMENTO-01.png',
      textItems: [
        const SectionTitle(text: 'Nossa essência'),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionSubtitle(text: 'Nossa missão'),
                  const BulletPoint(
                    text:
                        'Queremos transformar o ato de cozinhar em um momento prazeroso, reduzindo o desperdício e promovendo saúde e bem-estar.',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionSubtitle(text: 'Nossa visão'),
                  const BulletPoint(
                    text:
                        'Ser referência em plataformas culinárias digitais, reconhecida pela inovação e pelo impacto positivo que causamos na vida das pessoas e no planeta.',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionSubtitle(text: 'Nossos valores'),
                  const BulletPoint(
                    text:
                        'Inovação: Buscamos sempre o novo para surpreender você.',
                  ),
                  const BulletPoint(
                    text:
                        'Sustentabilidade: Cozinhamos um futuro melhor com menos desperdício.',
                  ),
                  const BulletPoint(
                    text:
                        'Transparência: Receitas claras, dados protegidos e um relacionamento de confiança.',
                  ),
                  const BulletPoint(
                    text:
                        'Foco no Usuário: Você está no centro de tudo o que fazemos.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
      reverseLayout: true,
    ),
    SectionItem(
      imageUrl: 'images/ELEMENTO-02.png',
      textItems: [
        const SectionTitle(text: 'Por que escolher o BiteWise?'),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              const Paragraph(
                text:
                    'No BiteWise, acreditamos que cada ingrediente pode contar uma história e cada refeição pode ser uma experiência única. Nossos principais benefícios são:',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BulletPoint(
                    text:
                        'Redução do desperdício alimentar: ajudamos você a aproveitar o que já tem em casa.',
                  ),
                  const BulletPoint(
                    text:
                        'Facilidade e personalização: receitas sob medida para o seu dia a dia.',
                  ),
                  const BulletPoint(
                    text:
                        'Sustentabilidade: incentivamos escolhas conscientes e práticas mais saudáveis.',
                  ),
                  const SizedBox(height: 10),
                  const Paragraph(
                    text:
                        'Com a nossa ajuda, você transforma o simples em especial!',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
      reverseLayout: false,
    ),
    SectionItem(
      imageUrl: 'images/ELEMENTO-03.png',
      textItems: [
        const SectionTitle(
          text: 'Transformando a culinária com tecnologia',
          width: 600,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              const Paragraph(
                text:
                    'O BiteWise combina inteligência artificial de última geração com sua criatividade na cozinha. Nossa tecnologia funciona assim:',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BulletPoint(
                    text: 'Você insere os ingredientes que tem em casa.',
                  ),
                  const BulletPoint(
                    text:
                        'Nossa IA cria receitas personalizadas para o seu momento.',
                  ),
                  const BulletPoint(
                    text:
                        'No futuro, conectaremos você a supermercados para facilitar ainda mais sua vida, com compras direto do site.',
                  ),
                ],
              ),
              const Paragraph(
                text:
                    'Estamos reinventando a forma de cozinhar, economizando seu tempo e trazendo mais sabor e inovação para sua rotina!',
                width: 500,
              ),
            ],
          ),
        ),
      ],
      reverseLayout: true,
    ),
    SectionItem(
      imageUrl: 'images/ELEMENTO-04.png',
      textItems: [
        const SectionTitle(text: 'Para todos os gostos e bolsos'),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              const Paragraph(
                text:
                    'O BiteWise foi criado para simplificar sua rotina na cozinha e tornar cada refeição especial. Aqui está como funciona:',
                width: 500,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NumberedPoint(
                    number: '1.',
                    text: 'Você insere os ingredientes que tem em casa.',
                  ),
                  const NumberedPoint(
                    number: '2.',
                    text:
                        'Nossa inteligência artificial processa as informações e sugere receitas deliciosas e fáceis de preparar.',
                  ),
                  const NumberedPoint(
                    number: '3.',
                    text: 'E é só começar a cozinhar!',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Paragraph(
                text:
                    'E para atender às suas necessidades, temos planos feitos para você',
              ),
            ],
          ),
        ),
      ],
      reverseLayout: false,
    ),
  ];
}
