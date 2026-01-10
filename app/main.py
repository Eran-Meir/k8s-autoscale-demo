from flask import Flask
import math
import sys

app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Production Engineering Demo</h1><p>System Status: <b>Online</b></p>"

@app.route("/stress")
def stress():
    # This loop forces high CPU usage to trigger the autoscaler
    x = 0.0001
    for i in range(1000000):
        x = x + math.sqrt(i)
    return f"<h1>CPU Stress Test Complete</h1>Result: {x}"

if __name__ == "__main__":
    # This print statement ensures we see something in the logs on startup
    print("Starting Flask Application...", file=sys.stderr)
    app.run(host="0.0.0.0", port=5000)