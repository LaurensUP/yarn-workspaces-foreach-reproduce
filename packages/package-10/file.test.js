const { printMemoryUsage } = require('../../shared');

describe('a test suite', () => {
  it('runs', () => {
    let arr = Array(1e7).fill("This will cost a lot of memory");
    arr.reverse();
    printMemoryUsage();
    expect(arr.length).toBe(1e7);
  })
});
