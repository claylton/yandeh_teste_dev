import 'package:flutter/material.dart';
import 'package:yandeh_teste_dev/views/themes/color_theme.dart';

class BannerDividerItemModel {
  final String url;
  final String title;
  final String subtitle;
  final Color color;

  BannerDividerItemModel({
    required this.url,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  factory BannerDividerItemModel.queridinhos() {
    return BannerDividerItemModel(
      color: ColorTheme.redBannerColor,
      title: "Queridinhos!",
      subtitle: "Veja os produtos mais queridos\npelos nossos clientes.",
      url:
          'https://s3-figma-videos-production-sig.figma.com/video/1033378068762196313/TEAM/e2f6/86f7/-6411-4fa0-b419-f49892a6598b?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=h2FqEj90dLEIr93xReiVMERJKxf0tdLBZpDZArOnRyPwoOWxe~kw8GOacTrh6boNSEJb492KpIZ9LqfWQPo4rtkU2MJFWkTXeXHVs-2BBW2YpTVflsMXaNOI1JeX~4~xZf2f5G4kcCGq2rCPLg0O5fMLcoj-swz2ZBix8IwtDKX6gQ1-wKII1GMrE0jgMKqaI16Rs28Z54qXsp88EYKZ7HZgV4zt-Odv464sD-AddZ5CGKhQc6nfmLQEsYE2hr89O3TEX7YnUVmAv8EKkrsndW5umvzJOk3MzE4YLoZa0knqdzheKPlvr0TSx~JWeMH9hub-Z023UT-M8iTmLdUf8w__',
    );
  }

  factory BannerDividerItemModel.hortifruti() {
    return BannerDividerItemModel(
      color: ColorTheme.greenBannerColor,
      title: "Hortifruti Perfeito!",
      subtitle: "Veja opções fresquinhas para\nabastecer seu hortifruti.",
      url:
          'https://s3-figma-videos-production-sig.figma.com/video/1033378068762196313/TEAM/b040/45a6/-a4be-42b9-944c-11cef61f7e81?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=egJDqGimnlqAgMouRwoPPa~QdHxIioY4BS7oCLbGuhbpUu3KJqEKRF3Xmq8kGj64vDHEep07HGwKddeEce4mbawX5qhfP1lsDNXFEwx5UjsgXTZ~7cmXz1a0UunGrZ~2NG~sR3dLf~u6JMS7NcuwTDHzK5hzlWxtkqqKn2Uv65K7OicNnxSfi~veu6UT~n3u7ialjssjnd9tX-yg~08k1NUdyxR3c7Z5z-6CgwAccgsAL2ahJekluMbSw9BX4pygRYbpi95U-YQbkPCOKRpLOInHTNljB6BjeeNCzuKDESfrwy5gHOAsn15upKZ8N6lRphct8EZPwVjhXkn39-AG3w__',
    );  
  }
}
