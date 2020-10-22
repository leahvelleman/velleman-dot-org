#!/usr/local/bin/python3

import cgi, json
form = cgi.FieldStorage() 
text = form.getvalue('text')
print("Content-type:application/json\r\n")
outtext=f"""
.      :poop: :poop:           :poop: :poop:
:poop:                :poop:                   :poop:
    :poop:    {text}          {text}       :poop:
       :poop:                            :poop:
            :poop:                 :poop:
                :poop:       :poop:
                       :poop:
"""
result = {'response_type': 'in_channel', 'text': outtext}
print(json.dumps(result))
