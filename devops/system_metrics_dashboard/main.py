from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse#, FileResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import psutil
import uvicorn

# Initialize FastAPI app
app = FastAPI()

# Mount static folder for CSS/JS
app.mount("/static", StaticFiles(directory="static"), name="static")

# Set up Jinja2 templates directory
templates = Jinja2Templates(directory="templates")

#@app.get("/favicon.ico", include_in_schema=False)
#async def favicon():
#    return FileResponse("static/favicon.ico")

@app.get("/", response_class=HTMLResponse)
async def dashboard(request: Request):
    """
    Render the main dashboard HTML with current system metrics.
    """
    cpu_percent = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory()
    disk = psutil.disk_usage('/')

    return templates.TemplateResponse(request, "dashboard.html", {
        "request": request,
        "cpu_percent": cpu_percent,
        "memory_used": memory.used // (1024**2),  # in MB
        "memory_total": memory.total // (1024**2),
        "disk_used": disk.used // (1024**3),       # in GB
        "disk_total": disk.total // (1024**3),
        "memory_percent": memory.percent,
        "disk_percent": disk.percent
    })

@app.get("/api/metrics")
async def get_metrics():
    """
    API endpoint to return system metrics as JSON.
    """
    return {
        "cpu_percent": psutil.cpu_percent(interval=1),
        "memory": {
            "used": psutil.virtual_memory().used,
            "total": psutil.virtual_memory().total,
            "percent": psutil.virtual_memory().percent
        },
        "disk": {
            "used": psutil.disk_usage('/').used,
            "total": psutil.disk_usage('/').total,
            "percent": psutil.disk_usage('/').percent
        }
    }

if __name__ == "__main__":
    # Run the app using uvicorn on port 9000
   uvicorn.run("main:app", host="0.0.0.0", port=9000, reload=True, reload_dirs=["./", "./templates", "./static"])

