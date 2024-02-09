using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Nanna.AspNetCore.Cors;

namespace Nanna.AspNetCore.Cors;

public static class CorsExtensions
{
    public static WebApplicationBuilder AddNCors(this WebApplicationBuilder builder)
    {
        // if (!isRunningInAzureWebApp && !env.IsIntegrationTesting())
        var corsOptions = builder.Configuration.GetSection("CORS").Get<CorsOptions>();
        if (corsOptions == null)
        {
            return builder;
        }

        builder.Services.AddCors(options =>
        {
            options.AddPolicy(
                "Default",
                policy =>
                {
                    if (corsOptions.AllowSpecificOrigins)
                    {
                        policy.WithOrigins(corsOptions.AllowedOrigins.Split(';'));
                        if (!corsOptions.AllowedOrigins.Contains("*"))
                        {
                            policy.AllowCredentials();
                        }
                    }
                    else
                    {
                        policy.AllowAnyOrigin();
                    }

                    if (corsOptions.AllowSpecificHeaders)
                        policy.WithHeaders(corsOptions.AllowedHeaders.Split(';'));
                    else
                        policy.AllowAnyHeader().WithExposedHeaders("Content-Disposition");

                    if (corsOptions.AllowSpecificMethods)
                        policy.WithMethods(corsOptions.AllowedMethods.Split(';'));
                    else
                        policy.AllowAnyMethod();
                }
            );
        });

        return builder;
    }
}
