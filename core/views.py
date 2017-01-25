import pyjsonrpc
from django.shortcuts import render, render_to_response


def welcome(request):
    return render_to_response("welcome.html", {})

def rpc(request):
    http_client = pyjsonrpc.HttpClient(url = "http://192.168.102.81:8080")
    result = http_client.call("add", 1, 2)
    return render_to_response("add.html", {'result': result})

