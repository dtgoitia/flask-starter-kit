import os

from api.app import app

if __name__ == "__main__":
    DEBUG_MODE = os.environ.get("FLASK_DEBUG_MODE", "False").lower() == "true"
    port = int(os.environ["FLASK_PORT"])

    app.run(debug=DEBUG_MODE, host="0.0.0.0", port=port)
