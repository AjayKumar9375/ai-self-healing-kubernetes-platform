import os
import time

from flask import Flask, jsonify


app = Flask(__name__)
started_at = time.time()


@app.get("/")
def index():
    if os.getenv("FORCE_CRASH", "false").lower() == "true":
        raise RuntimeError("Forced crash enabled")

    return jsonify(
        service="sample-service",
        status="ok",
        uptime_seconds=round(time.time() - started_at, 2),
    )


@app.get("/healthz")
def healthz():
    return jsonify(status="healthy")


@app.get("/readyz")
def readyz():
    return jsonify(status="ready")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))

