import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                "Statistics",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: FightClubColors.darkGreyText,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<SharedPreferences>(
                builder: (context, snapshot) {
                  final int won = snapshot.data?.getInt("stats_won") ?? 0;
                  final int draw = snapshot.data?.getInt("stats_draw") ?? 0;
                  final int lost = snapshot.data?.getInt("stats_lost") ?? 0;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Won: ${won.toString()}",
                        style: TextStyle(
                          color: FightClubColors.darkGreyText,
                          fontSize: 16,
                          height: 2,
                        ),
                      ),
                      Text(
                        "Draw: ${draw.toString()}",
                        style: TextStyle(
                          color: FightClubColors.darkGreyText,
                          fontSize: 16,
                          height: 2,
                        ),
                      ),
                      Text(
                        "Lost: ${lost.toString()}",
                        style: TextStyle(
                          color: FightClubColors.darkGreyText,
                          fontSize: 16,
                          height: 2,
                        ),
                      )
                    ],
                  );
                },
                future: SharedPreferences.getInstance(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SecondaryActionButton(
                onTap: () => Navigator.of(context).pop(),
                text: "Back",
              ),
            ),
          ],
        ),
      ),
    );
  }
}