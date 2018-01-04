import requests

r = requests.get(r'http://www.reddit.com/r/uconn/.json')

r.text

data = r.json()

print "hot posts on r/uconn today"
for child in data['data']['children']:
    print "Username:"+child['data']['author'], "\n" ,"Title: " + child['data']['title'] , "\n","---Score on post:"+ str(child['data']['score']) 
    print   
