#!/usr/bin/python

from flask import Flask
from flask import render_template
import os

app = Flask(__name__)

env=os.getenv('ENV')

@app.route("/")
def home():
    return f"Hello, you are connected to {env} environment"

@app.route("/picture")
def pic():
    return render_template('index.html')

if __name__ == "__main__":
    app.run(port=os.environ.get("PORT", 5000), host="0.0.0.0")