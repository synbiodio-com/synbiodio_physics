import 'dart:math';

import 'package:synbiodio_physics/synbiodio_physics.dart';
import 'package:test/test.dart';

void main() {
  group('Test Mass', () {
    test('Test unit conversion', () {
      const weight = Mass(kilogram: 1);

      expect(weight.inGram, pow(10, 3));
      expect(weight.inMilligram, pow(10, 6));
      expect(weight.inMicrogram, pow(10, 9));
      expect(weight.inNanogram, pow(10, 12));
    });

    test('Test calculation', () {
      const oneKilogram = Mass(kilogram: 1);
      const oneGram = Mass(gram: 1);
      const oneMilliGram = Mass(milligram: 1);
      const oneMicrogram = Mass(microgram: 1);
      const oneNanogram = Mass(nanogram: 1);

      expect(oneKilogram + oneGram, const Mass(kilogram: 1, gram: 1));

      expect(oneKilogram - oneGram, const Mass(gram: 999));
      expect(oneKilogram - oneGram * 10, const Mass(gram: 990));
      expect(oneKilogram - oneGram * 100, const Mass(gram: 900));
      expect(oneKilogram - oneGram * 1000, const Mass.empty());

      expect(oneKilogram * 2, const Mass(kilogram: 2));

      expect(oneNanogram * 1000, oneMicrogram);

      expect(oneMilliGram, oneMicrogram * 1000);
    });
  });
}
