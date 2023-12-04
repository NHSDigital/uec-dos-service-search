from chalice import Chalice
from chalicelib.service import basic_lambda_handler

app = Chalice(app_name="commissioning-profiler")


@app.route("/")
def index():
    return {"hello": "world"}


# Use the basic_lambda_handler for a Lambda function endpoint
@app.route("/lambda", methods=["POST"])
def lambda_function():
    request = app.current_request
    event = {
        "body": request.json_body,
        "headers": request.headers,
        "httpMethod": request.method,
        "path": request.context["resourcePath"],
    }
    context = {}
    return basic_lambda_handler(event, context)
