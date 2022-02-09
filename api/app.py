from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello_world():
    # raise Exception("foo")
    return "Hey, we have Flask in a Docker container!"
