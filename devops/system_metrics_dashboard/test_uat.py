import pytest
from httpx import AsyncClient
from httpx import ASGITransport
from main import app

@pytest.mark.asyncio
async def test_dashboard_page():
    """
    UAT: Test if the dashboard HTML page loads successfully.
    """
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        response = await ac.get("/")
    assert response.status_code == 200
    assert "System Realtime Metrics" in response.text

@pytest.mark.asyncio
async def test_metrics_api():
    """
    UAT: Test if the API returns correct metric keys.
    """
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        response = await ac.get("/api/metrics")
    assert response.status_code == 200
    data = response.json()
    assert "cpu_percent" in data
    assert "memory" in data
    assert "disk" in data
    assert "used" in data["memory"]
    assert "percent" in data["disk"]

