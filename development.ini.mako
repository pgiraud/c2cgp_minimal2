[app:app]
use = egg:c2cgp_minimal2
pyramid.reload_templates = true
pyramid.debug_authorization = false
pyramid.debug_notfound = true
pyramid.debug_routematch = false
pyramid.debug_templates = true
pyramid.includes =
    pyramid_debugtoolbar
mako.directories = c2cgp_minimal2:templates
    c2cgeoportal:templates
authtkt_secret = ${authtkt["secret"]}
authtkt_cookie_name = ${authtkt["cookie_name"]}
% if "timeout" in authtkt:
authtkt_timeout = ${authtkt["timeout"]}
% endif
app.cfg = %(here)s/.build/config.yaml

[filter:fanstatic]
use = egg:fanstatic#fanstatic
publisher_signature = fanstatic
base_url = /${instanceid}/wsgi
recompute_hashes = false
versioning = false
bottom = true
minified = false

[pipeline:main]
pipeline =
    egg:WebError#evalerror
    fanstatic
    app

[server:main]
use = egg:waitress#main
host = 0.0.0.0
port = ${waitress_port}

###
# logging configuration
# http://docs.pylonsproject.org/projects/pyramid/en/1.5-branch/narr/logging.html
###

[loggers]
keys = root, sqlalchemy, c2cgeoportal, c2cgp_minimal2

[handlers]
keys = console

[formatters]
keys = generic

[logger_root]
level = WARN
handlers = console

[logger_c2cgeoportal]
level = INFO
handlers =
qualname = c2cgeoportal

[logger_c2cgp_minimal2]
level = DEBUG
handlers =
qualname = c2cgp_minimal2

[logger_sqlalchemy]
level = INFO
handlers =
qualname = sqlalchemy.engine
# "level = INFO" logs SQL queries.
# "level = DEBUG" logs SQL queries and results.
# "level = WARN" logs neither.  (Recommended for production systems.)

[handler_console]
class = StreamHandler
args = (sys.stderr,)
level = NOTSET
formatter = generic

[formatter_generic]
format = %(asctime)s %(levelname)-5.5s [%(name)s][%(threadName)s] %(message)s
