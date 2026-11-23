import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_akvaryum_dekorasyonu/oyun_akvaryum_dekorasyonu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(akvaryumDekorasyonuConfig.title.length, 33);
    expect(akvaryumDekorasyonuConfig.tagline.length, 33);
    for (final s in akvaryumDekorasyonuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(akvaryumDekorasyonuConfig.gameId, akvaryumDekorasyonuId);
    expect(akvaryumDekorasyonuRules.gameId, akvaryumDekorasyonuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(akvaryumDekorasyonuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: akvaryumDekorasyonuId, optionalMechanics: akvaryumDekorasyonuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(akvaryumDekorasyonuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
