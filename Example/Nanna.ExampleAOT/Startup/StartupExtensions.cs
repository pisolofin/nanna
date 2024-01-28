using Microsoft.EntityFrameworkCore;
using Nanna.Example.Application.Persistance;

namespace Nanna.ExampleAOT.Startup;

public static class StartupExtensions
{
    public static IServiceCollection AddAppDbContext(this IServiceCollection services)
    {
        const string connectionString = "Host=localhost;Port=5488;Database=example;Username=postgres;Password=postgres_pwd";

        return services.AddDbContext<AppDbContext>(
            (serviceProvider, options) =>
            {
                options.UseNpgsql(connectionString, opt => opt.MigrationsAssembly(typeof(Program).Assembly.FullName));
            }
        );
    }
}
