using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Nanna.EntityFramework;

public static class MigrationsExtensions
{
    public static async Task ApplyMigrations(this DbContext dbContext, CancellationToken cancellationToken = default)
    {
        var migrations = dbContext.Database.GetPendingMigrations();
        if (migrations.Any())
        {
            Console.WriteLine($"Applying {migrations.Count()} migrations...");
            await dbContext.Database.MigrateAsync(cancellationToken);
            Console.WriteLine("Migrations applied successfully!");
        }
        else
        {
            Console.WriteLine("No migrations to apply.");
        }
    }

    public static async Task ApplyMigrations<TDbContext>(this IServiceProvider services, CancellationToken cancellationToken = default) where TDbContext : DbContext
    {
        using var scope = services.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<TDbContext>();
        await dbContext.ApplyMigrations(cancellationToken);
    }
}
