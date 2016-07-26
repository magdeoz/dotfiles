# -*- coding: utf-8 -*-
import subprocess
import sys
import json

reload(sys)
command = ['i3-msg', '-t', 'get_workspaces']
p = subprocess.Popen(command, stdout=subprocess.PIPE)
text = p.stdout.read()

pjson = json.loads(text)

string = "⎙ "
acnum = 0

for objects in pjson:
	if objects["visible"] == True:
		string += str(objects["num"])
		acnum = objects["num"]

string += " | "

for objects in pjson:
	string += str(objects["num"])
	string += " "

print string
