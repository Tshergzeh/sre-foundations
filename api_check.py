import requests

response = requests.get('https://jsonplaceholder.typicode.com/todos/1')
response_time = response.elapsed.total_seconds()
print("Response time =", round(response_time, 2), "seconds")
