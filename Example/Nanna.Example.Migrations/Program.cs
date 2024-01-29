using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Nanna.Example.Application.Persistance;

internal class Program
{
    static void Main(string[] args)
    {
        var sqlConnection = "Host=localhost;Port=5488;Database=example;Username=postgres;Password=postgres_pwd";

        // Create host builder
        var host = Host.CreateDefaultBuilder(args)
            .ConfigureServices((context, services) =>
            {
                // Register DbContext
                services.AddDbContext<AppDbContext>(options =>
                    options.UseNpgsql(sqlConnection,
                    x => x.MigrationsAssembly("Nanna.Example.Migrations")));
            })
            .Build();

        // Resolve the DbContext from the service provider
        using (var scope = host.Services.CreateScope())
        {
            var services = scope.ServiceProvider;
            var dbContext = services.GetRequiredService<AppDbContext>();

            // Use dbContext here...
            Console.WriteLine("DbContext created and ready to use!");

            // Example: Apply migrations
            dbContext.Database.Migrate();
            Console.WriteLine("Migrations applied successfully!");
        }

        // Keep the console window open
        Console.ReadLine();
    }
}


// // See https://aka.ms/new-console-template for more information
// using Microsoft.EntityFrameworkCore;
// using Microsoft.EntityFrameworkCore.Internal;
// using Microsoft.Extensions.DependencyInjection;
// using Nanna.Example.Application.Persistance;
// 
// Console.WriteLine("Hello, World!");
// 
// var sqlConnection = "Host=localhost;Port=5488;Database=example;Username=postgres;Password=postgres_pwd";
// 
// //var dbContext = new AppDbContext(new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(sqlConnection).Options);
// 
// // Create service collection
// var services = new ServiceCollection();
// 
// // Register DbContext
// services.AddDbContext<AppDbContext>(options =>
//     options.UseNpgsql(sqlConnection));
// 
// // Build service provider
// var serviceProvider = services.BuildServiceProvider();
// 
// // Resolve the DbContext from the service provider
// using (var scope = serviceProvider.CreateScope())
// {
//     var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();
// 
//     // Use dbContext here...
//     Console.WriteLine("DbContext created and ready to use!");
// 
//     // Example: Apply migrations
//     dbContext.Database.Migrate();
//     Console.WriteLine("Migrations applied successfully!");
// }
// 
// // Keep the console window open
// Console.ReadLine();