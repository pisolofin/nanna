using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Logging;
using Serilog;

namespace Nanna.Serilog;

public static class SerilogExtensions
{
    public static WebApplicationBuilder AddLoggingSerilog(this WebApplicationBuilder builder)
    {
        // TODO: IsIntegrationTesting

        Log.Logger = new LoggerConfiguration().ReadFrom.Configuration(builder.Configuration).Enrich.FromLogContext().CreateLogger();
        builder.Host.UseSerilog();

        builder.Logging
            .AddConsole()
            //.AddAzureWebAppDiagnostics()
            //.AddApplicationInsights() We Use Serilog Sinks
            .AddSerilog();

        return builder;
    }

    public static WebApplication UseLogEnrichment(this WebApplication app)
    {
        app.UseMiddleware<LogEnrichmentMiddleware>();

        return app;
    }
}
