import Database from "./interfaces/database";
import Status from "./interfaces/status";

class StatusService {
  private db: Database;
  private static request_count_key = 'requests';

  constructor(db: Database) {
    this.db = db;
  }

  static async create(db: Database): Promise<StatusService> {
    return new StatusService(db);
  }

  async logRequest(): Promise<void> {
    await this.db.incr(StatusService.request_count_key);
  }

  async getStatus(): Promise<Status> {
    return {
      'status': 'ok',
      'requests_served': Number(
        await this.db.get(StatusService.request_count_key)
      ),
    };
  } 
}

export default StatusService;
