import urllib.request, json
req = urllib.request.Request('https://backend-look.onrender.com/api/clear_data/', data=json.dumps({'admin_username':'admin', 'data_type':'notifications'}).encode(), headers={'Content-Type':'application/json'})
try:
    print(urllib.request.urlopen(req).read().decode())
except Exception as e:
    print(e)
