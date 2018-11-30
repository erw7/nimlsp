import ospaths
import times

const storage = ospaths.getEnv("tmp", "/tmp/nimlsp")

when defined(debugLogging):
  var logFile = open(storage / "nimlsp.log", fmWrite)

template debugEcho*(args: varargs[string, `$`]) =
  when defined(debugLogging):
    stderr.write("[debug ", format(now(), "hh:mm:ss"), "] ")
    stderr.write(join args)
    stderr.write("\n")
    logFile.write("[debug ", format(now(), "hh:mm:ss"), "] ")
    logFile.write(join args)
    logFile.write("\n\n")
    logFile.flushFile()
