﻿using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Nanna.Example.Application.Persistance;
using System.Reflection;

namespace Nanna.Example.WebAPI.Startup;

public static class StartupExtensions
{
    public static IServiceCollection AddAppDbContext(this IServiceCollection services, Assembly? migrationsAssembly = null)
    {
        // TODO: Read connection string from configuration
        const string connectionString = "Host=localhost;Port=5488;Database=example;Username=postgres;Password=postgres_pwd";

        return services.AddDbContext<AppDbContext>(
            (serviceProvider, options) =>
            {
                options.UseNpgsql(connectionString, sqlOptions =>
                {
                    if (migrationsAssembly != null)
                    {
                        sqlOptions.MigrationsAssembly(migrationsAssembly.FullName);
                    }
                });
            }
        );
    }
}
