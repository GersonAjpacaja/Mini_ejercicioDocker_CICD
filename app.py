import flask
from flask import request
from flask import render_template

app = flask.Flask(__name__)

@app.route("/")
def main():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5051)