interface Database {
  get: (key: string) => Promise<string | null>;
  incr: (key: string) => Promise<number>;
}

export default Database;
