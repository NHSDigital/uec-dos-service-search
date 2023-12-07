from chalice.test import Client
from chalicelib.service import app

def test_chalice_app_lambda_route():
    with Client(app) as client:
        response = client.http.post(
            "/lambda",
            body='{"key": "value"}',
            headers={"Content-Type": "application/json"},
        )
        assert response.status_code == 200
