from chalice import Chalice


app = Chalice(app_name="commissioning-profiler")


def basic_lambda_handler(event, context):
    body = event.get("body", {})
    key = body.get("key", "")


    result_body = f"Received key: {key}"


    response = {
        "statusCode": 200,
        "body": result_body,
        "headers": {"Content-Type": "application/json"},
    }

    return response


@app.route("/")
def index():
    return {"hello": "DoS"}


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
