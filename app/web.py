#!/usr/bin/python

from flask import Flask
import os

app = Flask(__name__)

env = os.getenv('ENV')

@app.route("/")
def home():
    return f"""
    <html>
    <head>
        <title>Flask App</title>
    </head>
    <body>
        <center>
            <h3>Hello, DevOps Gurus!<br>
                You are connected to <span style="color: red;">{env}</span> environment 2.</h3>
            <img border="0" src="/static/devops.png" alt="devops" width="1000" height="500" align="middle"/>
        </center>
    </body>
    </html>
    """

if __name__ == "__main__":
    app.run(port=5000, host="0.0.0.0")
