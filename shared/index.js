module.exports = {
  printMemoryUsage() {
    let mem = process.memoryUsage().heapUsed / 1024 / 1024;
    console.log(`Using ${Math.round(mem * 100) / 100} MB of memory`);
  }
}