import sys
from tomlkit import dumps, parse

INPUT_FILE = sys.argv[1]
OUTPUT_FILE = sys.argv[2]

with open(INPUT_FILE, 'r') as inp:
    with open(OUTPUT_FILE, 'r') as outr:
        inp_toml = parse(inp.read())
        out_toml = parse(outr.read())
        t = out_toml["tool"]["poetry"]["dev-dependencies"] | inp_toml["tool"]["poetry"]["dependencies"]
        t.pop("python")
        out_toml["tool"]["poetry"]["dev-dependencies"] = t
        with open(OUTPUT_FILE, 'w') as outw:
            outw.write(dumps(out_toml))
        

