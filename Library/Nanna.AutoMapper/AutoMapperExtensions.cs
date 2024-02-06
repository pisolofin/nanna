using System.Reflection;
using Microsoft.Extensions.DependencyInjection;
using Nanna.Infrastructure;

namespace Nanna.AutoMapper;

public static class AutoMapperExtensions
{
    public static IServiceCollection AddAutoMapperAndConfig(this IServiceCollection services, IEnumerable<Assembly> assemblyToConfigureList)
    {
        services.AddAutoMapper(
            configuration =>
            {
                assemblyToConfigureList.ExecuteStaticInterfaceMethod(typeof(IAutoMapper), nameof(IAutoMapper.ConfigureAutoMapper), configuration);
            },
            assemblyToConfigureList
        );

        return services;
    }

    public static IServiceCollection AddAutoMapperAndConfig(this IServiceCollection services)
    {
        return AddAutoMapperAndConfig(services, AppDomain.CurrentDomain.GetAssemblies());
    }
}
