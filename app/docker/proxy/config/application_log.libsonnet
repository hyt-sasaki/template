{
  log_format: {
    json_format: {
      timestamp: "%Y-%m-%dT%T.%F",
      threadId: "%t",
      sourceLine: "%s:%#",
      level: "%l",
      loggerName: "%n",
      message: "%j",
      logType: "application_log",
    }
  }
}