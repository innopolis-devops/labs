import 'jest';
import TimeService from '../src/time';

describe("Testing time offsets", () => {
  for (const offset of [0, 1.337]) {
    const service = new TimeService(offset * 1000);
    const system_time = Date.now();
    test(`Offset set to ${offset}s`, () => (
      service.getTime().then(
        (date) => expect((system_time - date.getTime()) / 1000).toBeCloseTo(offset, 1)
      )
    )
    );
  }
});
