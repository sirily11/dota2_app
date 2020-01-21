import 'package:dota2/models/data_object.dart';
import 'package:dota2/models/dota_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testdata.dart';

void main() {
  group("Test streaks", () {
    test("find streaks", () {
      List<PlayerMatches> matches = [
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: true),
      ];

      Streak streak = DotaModel.getStreak(matches);

      expect(streak.winStreaks.length, 4);
      expect(streak.loseStreaks.length, 4);
    });

    test("find streaks 2", () {
      List<PlayerMatches> matches = [
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: true),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
        PlayerMatches(playerSlot: 127, radiantWin: false),
      ];

      Streak streak = DotaModel.getStreak(matches);

      expect(streak.winStreaks.length, 4);
      expect(streak.loseStreaks.length, 6);
    });

    test("test large data", () {
      List<PlayerMatches> matches =
          testMatchData.map((d) => PlayerMatches.fromJson(d)).toList();
      int prev = matches[0].startTime;
      for (var match in matches) {
        expect(match.startTime <= prev, true);
        prev = match.startTime;
      }

      Streak streak = DotaModel.getStreak(matches);
    });
  });
}
