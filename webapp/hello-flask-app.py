from flask import Flask, jsonify

app = Flask(__name__)

# Root endpoint
@app.route('/')
def hello():
    return "Hello, World!"

# Health check endpoint
@app.route('/healthz')
def health_check():
    return jsonify(status="ok"), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
