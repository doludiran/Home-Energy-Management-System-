# -*- coding: utf-8 -*-
import json
import requests
r = requests.get(‘http://www2.cs.uregina.ca/~joshi26a/test.json’)
print r.text