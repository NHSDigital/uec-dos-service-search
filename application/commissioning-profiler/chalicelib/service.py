# chalicelib/service.py

from chalice import Chalice

app = Chalice(app_name="commissioning-profiler")


def basic_lambda_handler(event, context):
    """
    Basic Lambda handler function.

    Args:
    - event: The event data.
    - context: The context object.

    Returns:
    A dictionary representing the Lambda function response.
    """
    # Example: Extracting data from the event
    body = event.get("body", {})
    key = body.get("key", "")

    # Example: Processing the data
    result_body = f"Received key: {key}"

    # Example: Building the Lambda response
    response = {
        "statusCode": 200,
        "body": result_body,
        "headers": {"Content-Type": "application/json"},
    }

    return response


@app.route("/")
def index():
    return {"hello": "world"}


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
