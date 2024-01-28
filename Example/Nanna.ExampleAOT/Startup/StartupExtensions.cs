using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Nanna.Example.Application.Persistance;
using System;

namespace Nanna.ExampleAOT.Startup;

public static class StartupExtensions
{
    public static IServiceCollection AddAppDbContext(this IServiceCollection services)
    {
        return services.AddDbContext<AppDbContext>(
            (serviceProvider, options) =>
            {
                
            }
        );
    }
}
