from chalice.test import Client
from app import app


def test_chalice_app_lambda_route():
    with Client(app) as client:
        # Simulate an HTTP POST request to the /lambda endpoint with a JSON payload
        response = client.http.post(
            "/lambda",
            body='{"key": "value"}',
            headers={"Content-Type": "application/json"},
        )
        # Assert the response status code
        assert response.status_code == 200
        # Assert the response body
        assert response.json_body == {
            "statusCode": 200,
            "body": "Hello from the Lambda function!",
        }
