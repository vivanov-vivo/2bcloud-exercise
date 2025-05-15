from flask import Flask, jsonify, render_template_string

app = Flask(__name__)

# Simple HTML template
HTML_PAGE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello from Flask</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            color: #333;
            padding: 40px;
            text-align: center;
        }
        h1 {
            color: #2c3e50;
        }
        .subtitle {
            color: #777;
        }
    </style>
</head>
<body>
    <h1>Hello, World! 👋</h1>
    <p class="subtitle">Welcome to your Flask app running in a container or on EKS!</p>
</body>
</html>
"""

# Root endpoint
@app.route('/')
def home():
    return render_template_string(HTML_PAGE)

# Health check endpoint
@app.route('/healthz')
def health_check():
    return jsonify(status="ok"), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
