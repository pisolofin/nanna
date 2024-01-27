using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using NSwag.Generation.AspNetCore;

namespace Nanna.Swagger;

public static class SwaggerExtensions
{
    public static WebApplicationBuilder AddSwagger(this WebApplicationBuilder builder, AspNetCoreOpenApiDocumentGeneratorSettings? settings = null)
    {
        builder.Services
            .AddOpenApiDocument((openApiSettings) =>
            {
                openApiSettings = settings ?? openApiSettings;
            })
            .AddEndpointsApiExplorer();

        return builder;
    }
}
