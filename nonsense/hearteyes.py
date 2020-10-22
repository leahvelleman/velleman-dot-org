#!/usr/local/bin/python3

import cgi, json
form = cgi.FieldStorage() 
text = form.getvalue('text')
print("Content-type:application/json\r\n")
outtext=f"""
.      :heart: :heart:           :heart: :heart:
:heart:                :heart:                   :heart:
    :heart:    {text}          {text}       :heart:
       :heart:                            :heart:
            :heart:                 :heart:
                :heart:       :heart:
                       :heart:
"""
result = {'response_type': 'in_channel', 'text': outtext}
print(json.dumps(result))
