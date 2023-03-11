import 'dart:math';

import 'package:synbiodio_physics/synbiodio_physics.dart';
import 'package:test/test.dart';

void main() {
  group('Test Weight', () {
    test('Test unit conversion', () {
      const weight = Weight(kilogram: 1);

      expect(weight.inGram, pow(10, 3));
      expect(weight.inMilligram, pow(10, 6));
      expect(weight.inMicrogram, pow(10, 9));
      expect(weight.inNanogram, pow(10, 12));
    });

    test('Test calculation', () {
      const oneKilogram = Weight(kilogram: 1);
      const oneGram = Weight(gram: 1);
      const oneMilliGram = Weight(milligram: 1);
      const oneMicrogram = Weight(microgram: 1);
      const oneNanogram = Weight(nanogram: 1);

      expect(oneKilogram + oneGram, const Weight(kilogram: 1, gram: 1));

      expect(oneKilogram - oneGram, const Weight(gram: 999));
      expect(oneKilogram - oneGram * 10, const Weight(gram: 990));
      expect(oneKilogram - oneGram * 100, const Weight(gram: 900));
      expect(oneKilogram - oneGram * 1000, const Weight.empty());

      expect(oneKilogram * 2, const Weight(kilogram: 2));

      expect(oneNanogram * 1000, oneMicrogram);

      expect(oneMilliGram, oneMicrogram * 1000);
    });
  });
}
