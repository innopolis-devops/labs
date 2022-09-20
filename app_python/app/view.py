"""HTML module."""
from fastapi.responses import HTMLResponse


def html_response(zone, time):
    """Generate HTML page"""
    html_content = f"""
    <html>
        <head>
            <title>{zone} time</title>
        </head>
        <body>
            <h3>{zone} time is {time}</h3>
        </body>
    </html>
    """
    return HTMLResponse(content=html_content, status_code=200)
