{
  log_format: {
    json_format: {
      Timestamp: "%Y-%m-%dT%T.%F",
      ThreadId: "%t",
      SourceLine: "%s:%#",
      Level: "%l",
      LoggerName: "%n",
      Message: "%j",
      LogType: "application_log",
    }
  }
}