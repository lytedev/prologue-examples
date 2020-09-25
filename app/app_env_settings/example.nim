import prologue


# Handler that is called by the route below
proc pong(ctx: Context) {.async.} =
  resp "pong"


# Create new custom settings
# More on that: https://planety.github.io/prologue/coreapi/prologue/core/nativesettings.html#Settings
let
    env = loadPrologueEnv(".env")
    settings = newSettings(
        appName = env.getOrDefault("appName", "Prologue"),
        debug = env.getOrDefault("debug", true),
        address = env.getOrDefault("address", ""),
        port = Port(env.getOrDefault("port", 8080))
    )

# Create instance
var app = newApp(settings = settings)

# Attach new route with handler name
app.addRoute("/ping", pong)

# Run instance
app.run()