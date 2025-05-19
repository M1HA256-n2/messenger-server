import ParseConfig
import ../types/ServerConfiguration

const
  ConfigurationFile: string = "config.json"
  Config*: ServerConfiguration = ParseConfig.parse(ConfigurationFile)
