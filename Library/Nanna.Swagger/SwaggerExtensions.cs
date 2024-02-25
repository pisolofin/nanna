using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using NSwag.Generation.AspNetCore;

namespace Nanna.Swagger;

public static class SwaggerExtensions
{
    public static WebApplicationBuilder AddNSwagger(this WebApplicationBuilder builder, Action<AspNetCoreOpenApiDocumentGeneratorSettings>? settings = null)
    {
        builder.Services
            .AddOpenApiDocument((openApiSettings) =>
            {
                settings?.Invoke(openApiSettings);
            })
            .AddEndpointsApiExplorer();

        return builder;
    }
}
