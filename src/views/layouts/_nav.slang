- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/students" ? "active" : ""
a class="nav-item #{active}" href="/students" Students
