# From https://gist.github.com/760273
# This is the actual file that combines all of the other snippets
# I've been using it for a while, so it's officially Bug Free (TM)

# Python startup script.            vim: set ft=python :
# from http://www.norvig.com/python-iaq.html
# also see Tarek Ziade's _Expert_Pythom_Programming_ page 19
import os, sys

# Coloured prompt
if os.getenv('TERM') in ('xterm-color', 'xterm', 'screen', 'vt100', 'rxvt', 'Eterm', 'putty'):
    try:
        import readline
    except ImportError:
        sys.ps1 = '\033[0;32m>>> \033[0m'
        sys.ps2 = '\033[0;32m... \033[0m'
    else:
        sys.ps1 = '\001\033[0;32m\002>>> \001\033[0m\002'
        sys.ps2 = '\001\033[0;32m\002... \001\033[0m\002'

# Completion!
try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    # persistent history
    histfile = os.path.expanduser('~/.pythonhistory')
    try:
        readline.read_history_file(histfile)
    except IOError:
        pass
    import atexit
    atexit.register(readline.write_history_file, histfile)
    del histfile, atexit

    # tab completion
    try:
        import rlcompleter
        readline.parse_and_bind("tab: complete")
        del rlcompleter
    except: pass
    del readline

del sys, os
