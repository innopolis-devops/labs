import Database from "../interfaces/database";

class MockRedis implements Database {
  private data: Map<string, string | number>;
  
  constructor() {
    this.data = new Map();
  }

  async get(key: string) {
    return String(this.data.get(key) ?? 0);
  }

  async incr(key: string) {
    const value = Number(this.data.get(key) ?? 0) + 1;
    this.data.set(key, value);
    return value;
  }
}

export default MockRedis;
