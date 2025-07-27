config.load_autoconfig(False)
# Config ######################################################################
c.fonts.default_size = "20pt"  # UI
c.fonts.default_family = "Maple Mono NF CN"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.bg = "#191919"  # fix darkmode white flash

c.url.start_pages = "file:///dev/null"
c.url.default_page = "file:///dev/null"

c.downloads.location.directory = "~/Downloads/"
c.statusbar.position = "top"
c.downloads.position = "bottom"

c.colors.hints.bg = "#41a6b5"
c.colors.hints.match.fg = "#eeeeee"

c.content.blocking.enabled = True
c.url.searchengines = {"DEFAULT": "https://search.brave.com/search?q={}"}
# privacy
c.content.canvas_reading = False
c.content.geolocation = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.completion.open_categories = ["filesystem"]

c.content.proxy = "socks://localhost:7897"

# keybindings #################################################################
config.bind("cs", "config-source")

config.bind("<Ctrl-p>", "completion-item-focus --history prev", mode="command")
config.bind("<Ctrl-n>", "completion-item-focus --history next", mode="command")

config.bind("gp", "open -p")
