import requests
base_url = 'http://maps.googleapis.com/maps/api/geocode/json'
my_params = {'address': '100 Broadway, New York, NY, U.S.A', 'language': 'ca'}
response = requests.get(base_url, params = my_params)
results = response.json()['results']
x_geo = results[0]['geometry']['location']
print(x_geo['lng'], x_geo['lat'])
# -74.01110299999999 40.7079445