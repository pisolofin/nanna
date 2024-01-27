using Microsoft.AspNetCore.Http;
using Serilog.Context;
using System.Diagnostics;

namespace Nanna.Serilog;

public class LogEnrichmentMiddleware
{
    private readonly RequestDelegate _next;

    public LogEnrichmentMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task Invoke(HttpContext context)
    {
        LogContext.PushProperty("ClientIPAddress", context.Connection.RemoteIpAddress?.ToString());
        LogContext.PushProperty("ThreadProcess", $"{context.TraceIdentifier}/{Process.GetCurrentProcess().Id}");
        LogContext.PushProperty("LoggedUserID", context.User?.Identity?.Name);
        LogContext.PushProperty("RequestID", context.TraceIdentifier);
        LogContext.PushProperty("AppVersion", GetAppVersion());

        await _next(context);
    }

    private string GetAppVersion()
    {
        // Implementa il recupero della versione dell'applicazione
        return "1.0.0";
    }
}
