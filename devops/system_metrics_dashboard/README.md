
# 📊 System Metrics Dashboard

A **FastAPI** web application that displays **real-time system metrics** including CPU, memory, and disk usage using beautiful visualizations

---

## 🚀 Features

- ✅ Real-time CPU, Memory, and Disk metrics
- 💻 API endpoint for metrics in JSON format
- 🌐 Web UI using FastAPI + Jinja2 templates
- 🧪 Unit tested with `pytest` and `httpx`
- 🎨 Clean and responsive design with custom CSS

---

## 🛠️ Tech Stack

| Layer        | Technology        |
|--------------|-------------------|
| Backend      | [FastAPI](https://fastapi.tiangolo.com) |
| Metrics      | [psutil](https://pypi.org/project/psutil/) |
| Templating   | [Jinja2](https://jinja.palletsprojects.com/) |
| Charts       | [Chart.js](https://www.chartjs.org/) |
| Testing      | [Pytest](https://docs.pytest.org/) + [httpx](https://www.python-httpx.org/) |

---

## 📂 Project Structure

```
system_metrics_dashboard/
├── main.py                 # Main FastAPI app
├── test_uat.py             # Test cases
├── requirements.txt        # Python dependencies
├── static/                 # Icons, CSS, manifest
│   └── style.css
├── templates/
│   └── dashboard.html      # Jinja2 HTML template
```

---

## 🧪 Running Locally

### 1️⃣ Clone the repo

```bash
git clone https://github.com/your-username/system_metrics_dashboard.git
cd system_metrics_dashboard
```

### 2️⃣ Install dependencies

Use a virtual environment (recommended):

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 3️⃣ Run the app

```bash
python main.py
```

Then, open your browser and go to:  
🔗 [http://localhost:9000](http://localhost:9000)

---

## ✅ Run Tests

```bash
pytest test_uat.py
```

---

## 🔌 API Endpoint

You can fetch system metrics as JSON at:

```
GET /api/metrics
```

Response Example:
```json
{
  "cpu_percent": 21.4,
  "memory": {
    "used": 8468398080,
    "total": 16777216000,
    "percent": 50.4
  },
  "disk": {
    "used": 52428800000,
    "total": 107374182400,
    "percent": 48.9
  }
}
```

---

## 🙌 Contribute

Feel free to fork and submit a Pull Request to improve the app!

🚀 Built for internal monitoring and learning use cases.

---
