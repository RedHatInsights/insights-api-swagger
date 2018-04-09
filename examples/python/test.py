from __future__ import print_function
import os
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# Configure HTTP basic authorization: basicAuth
configuration = swagger_client.Configuration()
configuration.username = os.environ['USERNAME']
configuration.password = os.environ['PASSWORD']

# create an instance of the API class
api_instance = swagger_client.SystemApi(swagger_client.ApiClient(configuration))

try:
    # Request user information
    api_response = api_instance.show_system('b8acea6a3d2340498c90bbd043d0bfca')
    pprint(api_response)
except ApiException as e:
    print("Exception when calling SystemApi->show_system: %s\n" % e)

