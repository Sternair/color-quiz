import 'package:flutter/material.dart';

import 'Settings.i18n.dart';

class LegalAndImpressum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legal Notice & Privacy Policy'.i18n),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Text(
                    '''Impressum und Datenschutzerklärung für die mobile App Color Quiz

Angaben gemäß § 5 TMG, Stand: 04.04.2020

Ich nehme den Schutz Ihrer persönlichen Daten sehr ernst. Ich behandle Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Datenschutzvorschriften sowie dieser Datenschutzerklärung.

Diese Datenschutzerklärung gilt für die mobilen iPhone- und Android-App (im Folgenden „App“). In ihr werden Art, Zweck und Umfang der Datenerhebung im Rahmen der App-Nutzung erläutert.

Verantwortliche Stelle:
Markus Sterner
Agnesstr. 24
80798 München
colorquizgame@gmail.com
    
Wenn Sie diese App installieren und nutzen, werden folgende personenbezogenen Daten von Ihnen erfasst:
- Nutzungsdaten zur Erstellung von Statistiken
        
Nutzungsdaten zur Erstellung von Statistiken:
Diese Daten werden nur von den jeweiligen Appstores (Google Play und Apple App Store) im Rahmen ihrer AGBs erhoben, es erfolgt keine weitere Datenerhebung innerhalb der App.

Im Besonderen stellt die App keine Verbindung mit dem Internet her und speichert Daten nur lokal auf dem Endgerät. Diese werden bei einer Deinstallation vollständig gelöscht.

Beschwerderecht bei der zuständigen Aufsichtsbehörde:
Ich weise Sie darauf hin, dass Ihnen im Falle datenschutzrechtlicher Verstöße ein Beschwerderecht bei der zuständigen Aufsichtsbehörde zusteht. Zuständige Aufsichtsbehörde in datenschutzrechtlichen Fragen ist in der Regel der Landesdatenschutzbeauftragte der Bundesländer. Die Liste der Datenschutzbeauftragten sowie deren Kontaktdaten können folgendem Link entnommen werden: https://www.bfdi.bund.de/DE/Infothek/Anschriften_Links/anschriften_links-node.html
    '''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
